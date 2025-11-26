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
    [Documentation]    Verifies that the user is able to navigate through each tab in the About section successfully and close the section.
    ...    Ensures all About tabs are accessible and About section can be closed after navigation.
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To About Tab    ${ABOUT_SECTION_TABS}[tab.company]
    Validate About Tab Is Displayed    ${ABOUT_SECTION_TABS}[tab.company]
    Navigate To About Tab    ${ABOUT_SECTION_TABS}[tab.team]
    Validate About Tab Is Displayed    ${ABOUT_SECTION_TABS}[tab.team]
    Navigate To About Tab    ${ABOUT_SECTION_TABS}[tab.legal]
    Validate About Tab Is Displayed    ${ABOUT_SECTION_TABS}[tab.legal]
    Navigate To About Tab    ${ABOUT_SECTION_TABS}[tab.privacy]
    Validate About Tab Is Displayed    ${ABOUT_SECTION_TABS}[tab.privacy]
    Navigate To About Tab    ${ABOUT_SECTION_TABS}[tab.contact]
    Validate About Tab Is Displayed    ${ABOUT_SECTION_TABS}[tab.contact]
    Close About Section
    Validate About Section Is Closed
