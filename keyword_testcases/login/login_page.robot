*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_02 Verify Navigation In The About Section
    [Documentation]    Verify that a user can navigate to each tab within the About section and close the section successfully.
    ...    This test ensures that all About section tabs (Company, Team, Careers) are accessible and the section can be closed.
    ...    The user must be logged in prior to execution.
    Verify About Section Navigation
