*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Ensures user can access and navigate all About tabs and close the dialog.
Test Template    Verify Navigation In The About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=About_Navigation

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Verify Navigation In The About Section Template

*** Keywords ***
Verify Navigation In The About Section Template
    [Documentation]    Template for verifying navigation in the About section using data-driven approach.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    About_Navigation
    Verify About Section Navigation
