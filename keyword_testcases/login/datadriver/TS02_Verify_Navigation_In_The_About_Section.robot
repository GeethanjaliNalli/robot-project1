*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures navigation through all About tabs for valid users.
Test Template    Verify Navigation In The About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Verify Navigation In The About Section Template

*** Keywords ***
Verify Navigation In The About Section Template
    [Documentation]    Logs in and navigates through all tabs in the About section using test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${row_data}[Username]    ${row_data}[Password]
    Navigate To About Section
    Navigate Through All About Tabs
