*** Settings ***
Documentation    Keywords for About section navigation and verification
Resource    ../common/super.resource

*** Keywords ***
Precondition: User Is Logged In
    [Documentation]    Ensure a valid user is logged in before About section navigation
    # Reuse existing login keyword from common_keywords.resource or login_page.resource
    Run Keyword    Login With Valid Credentials

Navigate To About Section
    [Documentation]    Navigate to the About section from the dashboard or main menu
    # You may need to click on About section/menu using locator
    Click Element    ${ABOUT_SECTION_TAB_1}

Navigate Through All About Tabs
    [Documentation]    Navigate to each tab in the About section
    Click Element    ${ABOUT_SECTION_TAB_1}
    Click Element    ${ABOUT_SECTION_TAB_2}
    Click Element    ${ABOUT_SECTION_TAB_3}
    Click Element    ${ABOUT_SECTION_TAB_4}
    Click Element    ${ABOUT_SECTION_TAB_5}

Verify About Section Is Closed
    [Documentation]    Verify that the About section is closed as expected
    # Add verification step, e.g., element not visible or About section closed
    Element Should Not Be Visible    ${ABOUT_SECTION_TAB_1}
