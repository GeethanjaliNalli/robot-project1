*** Settings ***
Documentation     Keywords for About section navigation (TC00002 - Verify Navigation in the About section)
Resource          ../common/super.resource

*** Keywords ***
Login And Open About Section
    [Documentation]    Logs in with valid credentials and opens the About section.
    # Assumes common login keyword exists in common_keywords.resource or login_page.resource
    Login With Valid Credentials
    Wait Until Element Is Visible    ${ABOUT_SECTION_BUTTON}    10s
    Click Element    ${ABOUT_SECTION_BUTTON}
    Wait Until Element Is Visible    ${APP_INFO_TAB}    10s

Navigate To Medical Aid Contracts Tab
    [Documentation]    Navigates to the Medical Aid Contracts tab in the About section.
    Click Element    ${MEDICAL_AID_CONTRACTS_TAB}
    Wait Until Element Is Visible    ${MEDICAL_AID_CONTRACTS_TAB}    5s

Navigate To User Manual Tab
    [Documentation]    Navigates to the User Manual tab in the About section.
    Click Element    ${USER_MANUAL_TAB}
    Wait Until Element Is Visible    ${USER_MANUAL_TAB}    5s

Navigate To Changelog Tab
    [Documentation]    Navigates to the Changelog tab in the About section.
    Click Element    ${CHANGELOG_TAB}
    Wait Until Element Is Visible    ${CHANGELOG_TAB}    5s

Navigate To Services Tab
    [Documentation]    Navigates to the Services tab in the About section.
    Click Element    ${SERVICES_TAB}
    Wait Until Element Is Visible    ${SERVICES_TAB}    5s

Close About Section
    [Documentation]    Closes the About section.
    Click Element    ${CLOSE_ABOUT_SECTION_BUTTON}
    Wait Until Element Is Not Visible    ${APP_INFO_TAB}    5s

Verify Navigation In About Section
    [Documentation]    End-to-end keyword for TC00002: Login and navigate to each tab in About section, then close it.
    Login And Open About Section
    Navigate To Medical Aid Contracts Tab
    Navigate To User Manual Tab
    Navigate To Changelog Tab
    Navigate To Services Tab
    Close About Section
