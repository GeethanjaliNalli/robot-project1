*** Settings ***
Documentation     Test suite for TC00002: Verify Navigation in the About section. Logs in and navigates through all tabs in the About section to ensure navigation works as expected.
Resource          ../common/super.resource
Resource          ../keywords/about_page.resource

*** Test Cases ***
Verify Navigation In The About Section
    [Documentation]    TC00002: Login and navigate to each tab in the About section. User should be able to login and navigate through each tab in the About section as specified in the expected results.
    [Tags]    Smoke    Regression    AboutSection    TC00002
    Login And Navigate Through About Section
