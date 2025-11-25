*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Executes About section navigation for multiple user credentials.
Test Template    Verify Navigation In About Section With Data
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_navigation

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify Navigation In About Section With Data

*** Keywords ***
Verify Navigation In About Section With Data
    [Documentation]    Logs in and verifies navigation through all tabs in the About section using provided credentials.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section_navigation
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${row_data}[Username]    ${row_data}[Password]
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To Overview Tab
    Navigate To Details Tab
    Navigate To History Tab
    Close About Section
    Logout From The Application
