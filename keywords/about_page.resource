*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login and tab navigation.
Resource    ../common/super.resource

*** Keywords ***

Login With Valid Credentials
    [Documentation]    Logs in using a valid username and password.
    Use Login Keyword    # Replace with actual login keyword from login_page.resource or common_keywords.resource

Navigate To About Section
    [Documentation]    Navigates to the About section after login.
    Click    ${DASHBOARD_PAGE_LOCATORS.link.about}
    Wait Until Page Contains Element    ${ABOUT_PAGE_LOCATORS.tab.overview}    timeout=5s

Navigate To About Tab
    [Documentation]    Navigates to a specific tab in the About section.
    [Arguments]    ${tab_name}
    ${tab_locator}=    Get From Dictionary    ${ABOUT_PAGE_LOCATORS}    ${tab_name}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=5s

Navigate Through All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    FOR    ${tab}    IN    overview    details    history    settings    help
        Navigate To About Tab    ${tab}
    END

Verify About Section Navigation
    [Documentation]    Logs in and navigates through all tabs in the About section to verify navigation.
    Login With Valid Credentials
    Navigate To About Section
    Navigate Through All About Tabs
