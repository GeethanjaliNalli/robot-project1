*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Validates navigation through all About tabs and closing the dialog.
Test Template    Verify Navigation In The About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_navigation

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify Navigation In The About Section Template

*** Keywords ***
Verify Navigation In The About Section Template
    [Documentation]    Template keyword for verifying About section navigation using test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section_navigation
    Open About Section
    Navigate All About Tabs
    Close About Section
