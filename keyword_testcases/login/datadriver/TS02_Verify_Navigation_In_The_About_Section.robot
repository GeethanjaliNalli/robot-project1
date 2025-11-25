*** Settings ***
Documentation    Data-driven test for verifying navigation in the About section.
...              Ensures navigation through all About tabs and closure after login.
Test Template    Verify About Section Navigation Flow
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=AboutSection

*** Test Cases ***
# robocop disable line
TC_02_Verify_Navigation_In_The_About_Section
    [Template]    Verify About Section Navigation Flow

*** Keywords ***
Verify About Section Navigation Flow
    [Documentation]    Performs login, navigates to the About section, navigates through all tabs, and closes the section.
    [Arguments]    ${test_case_name}
    Login With Valid Credentials
    Navigate To About Section
    Navigate Through About Tabs
    Close About Section
