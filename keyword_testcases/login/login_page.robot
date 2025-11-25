*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_02 Verify Navigation In The About Section
    [Documentation]    Verify that a user can successfully navigate to the About section, access each tab, and close the section after login.
    ...    This test ensures all About section tabs are accessible and the section can be closed as expected.
    ...    The flow covers login, About navigation, tab traversal, and closure.
    Verify About Section Navigation Flow
