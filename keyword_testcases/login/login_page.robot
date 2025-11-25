*** Settings ***
Documentation    This File has all the Test Cases related to the login page
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.

TC_02 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate through all tabs in the About section after logging in.
    ...    The test opens the About section, navigates to Overview, License, and Credits tabs, and closes the About dialog.
    Verify About Section Navigation
