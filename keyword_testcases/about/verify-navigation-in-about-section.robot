*** Settings ***
Documentation    Test suite to verify navigation in the About section, including login, navigating through all About tabs, and verifying About section closure.
Resource    ../../common/super.resource

*** Test Cases ***
Verify Navigation In About Section
    [Documentation]    Login and navigate to each tab in the About section, then verify the About section is closed.
    [Tags]    Smoke    About    Navigation
    Precondition: User Is Logged In
    Navigate To About Section
    Navigate Through All About Tabs
    Verify About Section Is Closed
