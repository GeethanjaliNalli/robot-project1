*** Settings ***
Documentation    This file contains all the test cases related to the Diary New Patient Booking, including positive and negative scenarios.
Resource    ../../common/super.resource
Resource    ../../Testdata/booking_data.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate New Patient Booking With All Required Information
    [Documentation]    Verifies that a new patient booking can be made when all required information is filled in and saved.
    Open Diary Screen
    Start New Patient Booking
    Fill New Patient Booking Details    &{TC00002_Diary_NPB_Valid_Booking}
    Save Patient Booking
    Validate Booking Is Made    &{TC00002_Diary_NPB_Valid_Booking}

TC_02 Validate Booking Is Not Made When Required Fields Are Missing
    [Documentation]    Verifies that no booking is made if required information is missing.
    Open Diary Screen
    Start New Patient Booking
    Fill New Patient Booking Details    &{TC00002_Diary_NPB_Missing_Required_Field}
    Attempt To Save Patient Booking With Missing Fields
    Validate Booking Is Not Made    &{TC00002_Diary_NPB_Missing_Required_Field}

TC_03 Validate Booking Is Not Made When User Closes Without Saving
    [Documentation]    Verifies that no booking is made if the user closes the booking screen without saving.
    Open Diary Screen
    Start New Patient Booking
    Fill New Patient Booking Details    &{TC00002_Diary_NPB_Close_Without_Saving}
    Close Booking Screen Without Saving
    Validate Booking Is Not Made    &{TC00002_Diary_NPB_Close_Without_Saving}
