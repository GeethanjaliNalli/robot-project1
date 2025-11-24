*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_02 Verify Navigation In The About Section
    [Documentation]    Verify that a user can open the About section, navigate through all tabs (Overview, License, Credits), and close the section successfully.
    ...    This ensures the About dialog and all its tabs are accessible and function as expected after login.
    ...    The test covers navigation and closure of the About section dialog.
    Open About Section
    Navigate To Overview Tab
    Navigate To License Tab
    Navigate To Credits Tab
    Close About Section
