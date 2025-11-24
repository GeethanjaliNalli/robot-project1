*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures About dialog tabs are accessible and can be closed.
Test Template    Verify Navigation In The About Section Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSection

*** Test Cases ***
# robocop disable line
TC_02 Verify Navigation In The About Section
    [Template]    Verify Navigation In The About Section Template

*** Keywords ***
Verify Navigation In The About Section Template
    [Documentation]    Template for verifying navigation in the About section using data-driven approach.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    AboutSection
    Open About Section
    Navigate To Overview Tab
    Navigate To License Tab
    Navigate To Credits Tab
    Close About Section
