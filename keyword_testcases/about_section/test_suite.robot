*** Settings ***
Documentation    This file contains test cases to verify navigation in the About section, ensuring a user can access all About tabs and close the section successfully.
Resource    ../../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate to each tab in the About section and close it successfully.
    Open About Section
    Navigate Through All About Tabs
    Close About Section
