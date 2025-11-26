*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Executes navigation through all About tabs and closing the dialog.
Test Template    Verify Navigation In About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify Navigation In About Section Template

*** Keywords ***
Verify Navigation In About Section Template
    [Documentation]    Logs in and verifies navigation through all About section tabs and closing the dialog.
    [Arguments]    ${test_case_name}
    Verify Navigation In About Section
