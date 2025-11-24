*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Validates navigation to all About section tabs and closing the section.
Test Template    Verify About Section Navigation Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSectionNavigation

*** Test Cases ***
# robocop disable line
TC_02_Verify_Navigation_In_The_About_Section
    [Template]    Verify About Section Navigation Template

*** Keywords ***
Verify About Section Navigation Template
    [Documentation]    Template keyword for verifying navigation in the About section using test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSectionNavigation
    Verify About Section Navigation
