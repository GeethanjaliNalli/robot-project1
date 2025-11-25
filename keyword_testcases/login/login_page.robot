*** Settings ***
Documentation    This File has all the Test Cases related to the login page
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Handle Attention Alert    dismiss
    Validate Dashboard Is Displayed
    Logout From The Application
    Handle Attention Alert    dismiss
    Logout From The Application
    Handle Attention Alert    accept

TC_02 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate through all tabs in the About section after logging in.
    ...    Ensures each About tab is accessible and the section can be closed successfully.
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
