*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures user can access all About tabs and close the dialog.
Test Template    Verify Navigation In The About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section

*** Test Cases ***
${test_case_name}
    [Template]    Verify Navigation In The About Section Template

*** Keywords ***
Verify Navigation In The About Section Template
    [Documentation]    Performs About section navigation using data-driven approach.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section
    Open About Section
    Navigate Through All About Tabs
    Close About Section
