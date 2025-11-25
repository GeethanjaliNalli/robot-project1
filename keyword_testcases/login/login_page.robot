*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    Ensures the dashboard is displayed after login.
    ...    Checks that user is redirected to the correct page.
    Validate Dashboard Is Displayed

TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Validates that a user is able to create a new patient booking from the Diary page.
    ...    Ensures all required patient information is entered and booking is saved successfully.
    ...    Confirms that the booking success message is displayed after saving.
    Open New Patient Booking Form
    Enter New Patient Details    &{NEW_PATIENT_DATA}
    Save New Patient Booking
    Validate Booking Success Message
