*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures user can access all About tabs and close the dialog.
Test Template    Verify Navigation In The About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Verify Navigation In The About Section Template

*** Keywords ***
Verify Navigation In The About Section Template
    [Documentation]    Opens About section, navigates through all tabs, and closes the dialog.
    [Arguments]    ${test_case_name}
    Open About Section
    Navigate Through All About Tabs
    Close About Section
