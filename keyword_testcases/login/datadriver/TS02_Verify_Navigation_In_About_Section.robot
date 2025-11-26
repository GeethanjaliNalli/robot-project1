*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Tests navigation to each About tab and closing the section with various credentials.
Test Template    Verify Navigation In About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_navigation

*** Test Cases ***
${test_case_name}
    [Template]    Verify Navigation In About Section Template

*** Keywords ***
Verify Navigation In About Section Template
    [Documentation]    Launches application, logs in, navigates About tabs, and validates result per test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section_navigation
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${row_data}[Username]    ${row_data}[Password]
    ${login_status}=    Run Keyword And Return Status    Validate Dashboard Is Displayed
    Run Keyword If    ${login_status}    Open About Section
    Run Keyword If    ${login_status}    Navigate To About Tab    ${row_data}[Tab_To_Navigate]
    Run Keyword If    ${login_status}    Close About Section
    Run Keyword If    ${login_status}    Validate About Section Closed
    Run Keyword If    not ${login_status}    Validate Error Message Is Displayed    ${row_data}[Expected_Result]
