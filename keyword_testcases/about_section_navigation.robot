*** Settings ***
Documentation     Test suite to verify navigation in the About section. Logs in, navigates to About, and checks all tabs.
Resource          ../common/super.resource

*** Test Cases ***
Verify Navigation In The About Section
    [Documentation]    Login and verify navigation through all tabs in the About section. Ensures About section opens with App Info tab and all tabs are accessible.
    [Tags]    Smoke    About    Navigation
    Precondition: User Has Valid Credentials
    Login To Application
    Navigate To About Section
    Verify About Section Opened With App Info Tab
    Navigate Through All About Tabs
