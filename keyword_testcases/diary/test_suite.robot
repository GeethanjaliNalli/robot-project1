*** Settings ***
Documentation    This file contains all the test cases related to Diary New Patient Booking, including positive and negative scenarios.
Resource    ../../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Book New Patient Successfully
    [Documentation]    Verifies that a user can create a new patient booking with all required information and save successfully.
    Navigate To Diary Page
    Click Add New Booking
    Fill New Patient Booking Details    ${BOOKING_DATA}
    Save Booking
    Validate Booking Is Created    ${BOOKING_DATA}

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Verifies that booking is not created when required fields are missing and appropriate validation is shown.
    Navigate To Diary Page
    Click Add New Booking
    Fill New Patient Booking Details With Missing Fields    ${BOOKING_DATA}
    Attempt To Save Booking With Missing Fields
    Validate Booking Is Not Created
    Validate Required Field Error Messages Are Displayed

TC_03 Validate Booking Is Not Created When User Closes Without Saving
    [Documentation]    Verifies that no booking is created when the user closes the booking screen without saving.
    Navigate To Diary Page
    Click Add New Booking
    Fill New Patient Booking Details    ${BOOKING_DATA}
    Close Booking Screen Without Saving
    Validate Booking Is Not Created
