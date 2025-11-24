*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    Ensures the dashboard is displayed after login.
    ...    Confirms access to the main application page.
    Validate Dashboard Is Displayed

TC_02 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate to the About section, access all tabs, and close the About dialog.
    ...    Ensures navigation through Overview, License, and Credits tabs in the About section.
    ...    Confirms the About dialog can be closed successfully after navigation.
    Open About Section
    Navigate All About Tabs
    Close About Section
