*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures user can access About, navigate all tabs, and close the dialog.
Test Template    Verify Navigation In About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify Navigation In About Section Template

*** Keywords ***
Verify Navigation In About Section Template
    [Documentation]    Logs in, opens About section, navigates all tabs, and closes About dialog.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To General Tab
    Navigate To License Tab
    Navigate To Third Party Tab
    Close About Section
