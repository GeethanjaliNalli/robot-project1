*** Settings ***
Documentation    Data-driven suite to verify navigation to each tab in the About section with valid user.
...              Navigates to each About tab and validates navigation status.
Test Template    Verify Navigation In About Section With Valid User
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section_navigation_testdata

*** Test Cases ***
${test_case_name}
    [Template]    Verify Navigation In About Section With Valid User

*** Keywords ***
Verify Navigation In About Section With Valid User
    [Documentation]    Navigates to the specified About section tab and validates navigation status.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section_navigation_testdata
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To About Tab    ${row_data}[Navigate_Tab]
    Validate About Tab Is Displayed    ${row_data}[Navigate_Tab]
    Close About Section
    Validate About Section Is Closed
