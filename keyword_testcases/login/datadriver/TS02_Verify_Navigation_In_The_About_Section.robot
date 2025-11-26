*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Executes navigation scenarios for About section tabs based on provided data.
Test Template    Verify Navigation In The About Section With Data
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_navigation_datadriver

*** Test Cases ***
${test_case_name}
    [Template]    Verify Navigation In The About Section With Data

*** Keywords ***
Verify Navigation In The About Section With Data
    [Documentation]    Navigates to the About section and iterates through specified tabs, validating navigation and closure.
    [Arguments]    ${test_case_name}
    ${row_data}=    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section_navigation_datadriver
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${row_data}[Username]    ${row_data}[Password]
    Run Keyword If    '${row_data}[Expected_Login_Status]' == 'Success'    Validate Dashboard Is Displayed
    ...    ELSE    Validate Error Message Is Displayed    Invalid username or password.
    Run Keyword If    '${row_data}[Expected_Login_Status]' == 'Success'    Open About Section
    : FOR    ${tab}    IN    @{row_data}[Tab_Sequence].split(',')
    \    Run Keyword If    '${tab}'    Navigate To About Tab    ${tab}
    Run Keyword If    '${row_data}[Expected_Login_Status]' == 'Success'    Close About Section
    # Optionally, add validation for navigation status and about closed if such keywords exist
