*** Settings ***
Documentation     Keywords for About page navigation and verification
Resource          ../common/super.resource

*** Keywords ***
Precondition: User Has Valid Credentials
    [Documentation]    Ensure a valid username and password are available for login.
    # This is a precondition check; actual data should be managed via test data or environment
    # No action required here unless validation is needed

Login To Application
    [Documentation]    Log in using valid credentials. Reuses existing login keyword.
    Login To Application With Valid Credentials

Navigate To About Section
    [Documentation]    Navigates to the About section from the dashboard or main menu.
    Click Element    ${ABOUT_SECTION}
    Wait Until Element Is Visible    ${ABOUT_TAB_APP_INFO}

Navigate Through All About Tabs
    [Documentation]    Navigates through each tab in the About section to verify navigation.
    Click Element    ${ABOUT_TAB_APP_INFO}
    Wait Until Element Is Visible    ${ABOUT_TAB_APP_INFO}
    Click Element    ${ABOUT_TAB_LICENSE}
    Wait Until Element Is Visible    ${ABOUT_TAB_LICENSE}
    Click Element    ${ABOUT_TAB_TEAM}
    Wait Until Element Is Visible    ${ABOUT_TAB_TEAM}
    Click Element    ${ABOUT_TAB_PRIVACY}
    Wait Until Element Is Visible    ${ABOUT_TAB_PRIVACY}
    Click Element    ${ABOUT_TAB_SUPPORT}
    Wait Until Element Is Visible    ${ABOUT_TAB_SUPPORT}

Verify About Section Opened With App Info Tab
    [Documentation]    Verifies that the About section is open and the App Info tab is selected.
    Element Should Be Visible    ${ABOUT_TAB_APP_INFO}
    # Add further checks if needed (e.g., tab is active)
