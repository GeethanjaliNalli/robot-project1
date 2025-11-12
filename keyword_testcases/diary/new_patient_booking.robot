*** Settings ***
Documentation     Test suite for Diary - New Patient Booking functionality.
...               Validates that a new patient booking can be created when required fields are filled and saved,
...               and that no booking is created if required fields are missing or the booking is cancelled.
Resource          ../../common/super.resource
Resource          ../../keywords/diary_page.resource

*** Test Cases ***
Create New Patient Booking With Required Fields
    [Documentation]    Verify that a new patient booking is created when all required fields are filled and saved.
    [Tags]    Diary    NewPatientBooking    Positive    Functional
    Open Diary Screen
    Click New Booking Button
    Fill Patient Booking Details    John Doe    2024-07-01
    Save Booking
    Booking Should Be Created

Do Not Create Booking When Required Fields Are Missing
    [Documentation]    Verify that no booking is created if required fields are missing.
    [Tags]    Diary    NewPatientBooking    Negative    Functional
    Open Diary Screen
    Click New Booking Button
    # Only fill patient name, leave booking date empty
    Fill Patient Booking Details    Jane Smith    
    Save Booking
    Booking Should Not Be Created

Do Not Create Booking When Screen Is Closed Without Saving
    [Documentation]    Verify that no booking is created if the booking screen is closed without saving.
    [Tags]    Diary    NewPatientBooking    Negative    Functional
    Open Diary Screen
    Click New Booking Button
    Fill Patient Booking Details    Alex Brown    2024-07-02
    Close Booking Screen
    Booking Should Not Be Created
