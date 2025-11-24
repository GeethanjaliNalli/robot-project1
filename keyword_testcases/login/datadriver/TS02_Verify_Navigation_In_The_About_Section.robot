*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures user can access all About tabs and close the dialog.
Test Template    Verify Navigation In About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSection

*** Test Cases ***
# robocop disable line
TC_02_Verify_Navigation_In_The_About_Section
    [Template]    Verify Navigation In About Section Template

*** Keywords ***
Verify Navigation In About Section Template
    [Documentation]    Template to verify navigation in the About section using data-driven approach.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSection
    Open About Section
    Navigate To Company Tab
    Navigate To Team Tab
    Navigate To Careers Tab
    Close About Section
