*** Settings ***
Documentation    This file contains all the test cases related to the Login page, Dashboard page and Booking page.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    Ensures the dashboard is displayed after login.
    ...    Confirms login flow works as expected.
    Validate Dashboard Is Displayed

TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Validates that a new patient booking can be created from the diary screen.
    ...    Ensures booking is created when required information is filled and saved.
    ...    Confirms no booking is made if form is incomplete or closed without saving.
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Enter New Patient Booking Form Data    ${BOOKING_FORM_DATA}
    Save New Patient Booking
    Validate Booking Is Created
    # Negative scenario: close form without saving and validate not created
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Enter New Patient Booking Form Data    ${INCOMPLETE_BOOKING_FORM_DATA}
    Close New Patient Booking Form
    Validate Booking Is Not Created
