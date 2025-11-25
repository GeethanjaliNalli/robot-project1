*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    Ensures the login page accepts valid username and password.
    ...    Confirms dashboard is displayed after login.
    # Existing steps remain untouched

TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Validates that a user can create a new patient booking from the Diary screen.
    ...    Ensures booking is created when all required information is filled and saved.
    ...    Confirms no booking is created if required fields are missing or form is closed.
    Validate Dashboard Is Displayed
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Open New Patient Booking Form
    Enter New Patient Details    ${NEW_PATIENT_DATA}
    Save New Patient Booking
    Validate Booking Is Created
    # Negative scenario
    Open New Patient Booking Form
    Enter New Patient Details    ${INCOMPLETE_PATIENT_DATA}
    Save New Patient Booking
    Validate Booking Is Not Created
    Open New Patient Booking Form
    Close New Patient Booking Form
    Validate Booking Is Not Created
