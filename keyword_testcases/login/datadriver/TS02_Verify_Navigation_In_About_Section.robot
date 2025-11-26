*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Each row can specify a user for About navigation validation.
Test Template    Verify Navigation In About Section With User
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_users

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify Navigation In About Section With User

*** Keywords ***
Verify Navigation In About Section With User
    [Documentation]    Logs in with provided credentials and verifies navigation in About section.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section_users
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${row_data}[Username]    ${row_data}[Password]
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To About Tab    company
    Navigate To About Tab    privacy
    Navigate To About Tab    terms
    Navigate To About Tab    licenses
    Close About Section
