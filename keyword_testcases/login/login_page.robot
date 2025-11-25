*** Settings ***
Documentation    This File has all the Test Cases related to the login page
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...    Ensures access to the application dashboard after login.
    ...    Checks for the presence of dashboard elements.

TC_02 Validate User Is Able To Create New Patient Booking
    [Documentation]    Validates that a user can create a new patient booking from the diary screen.
    ...    Ensures that a booking is made when all required information is filled and saved.
    ...    Confirms that no booking is made if required fields are missing or the form is closed.
    Open New Patient Booking Form
    Enter New Patient Booking Details    &{BOOKING_DETAILS}
    Save New Patient Booking
    Validate Booking Is Created
    Close New Patient Booking Form
    Validate Booking Is Not Created
