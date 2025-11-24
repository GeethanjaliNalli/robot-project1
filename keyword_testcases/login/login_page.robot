*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_02 Verify Navigation In The About Section
    [Documentation]    Verify that a user can successfully navigate to the About section after login,
    ...    access each tab (Company, Team, Careers), and close the About section dialog.
    Open About Section
    Navigate To Company Tab
    Navigate To Team Tab
    Navigate To Careers Tab
    Close About Section
