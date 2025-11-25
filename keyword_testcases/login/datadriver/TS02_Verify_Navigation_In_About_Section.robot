*** Settings ***
Documentation    Data-driven suite for verifying navigation in the About section.
...              Each row logs in and checks navigation through all About tabs.
Test Template    Verify Navigation In About Section With Data
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=about_section

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Verify Navigation In About Section With Data

*** Keywords ***
Verify Navigation In About Section With Data
    [Documentation]    Logs in and verifies navigation through all tabs in the About section using test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    about_section
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${row_data}[Username]    ${row_data}[Password]
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.overview}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.overview}
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.license}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.license}
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.privacy}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.privacy}
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.terms}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.terms}
    Close About Section
