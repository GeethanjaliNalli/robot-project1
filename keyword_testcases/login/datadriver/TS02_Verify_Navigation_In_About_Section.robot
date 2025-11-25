*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Each test row verifies navigation through all About tabs and closure.
Test Template    Verify Navigation In About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_navigation

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify Navigation In About Section Template

*** Keywords ***
Verify Navigation In About Section Template
    [Documentation]    Logs in and navigates through all tabs in the About section, then closes it.
    [Arguments]    ${test_case_name}
    # No row_data needed as there is no test data for this scenario
    Open About Section
    Navigate Through All About Tabs
    Close About Section
