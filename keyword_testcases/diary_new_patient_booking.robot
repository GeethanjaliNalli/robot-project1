*** Settings ***
Documentation     Test suite for Diary - New patient booking. Verifies that a new patient can be booked from the diary screen and booking is reflected correctly.
Resource          ../common/super.resource

*** Test Cases ***
New Patient Booking Should Be Reflected In Diary
    [Documentation]    Ensure that a new patient booking is created and reflected in the diary with the correct icon and details.
    [Tags]    Diary    Booking    Smoke
    User Should Be Logged In On Diary Screen
    Book New Patient In Diary
    Verify New Booking Reflected In Diary
    Booking Should Be Made If Required Information Is Saved

No Booking Should Be Made If Screen Closed Or Fields Missing
    [Documentation]    Ensure that no booking is made if the booking screen is closed or required fields are missing.
    [Tags]    Diary    Booking    Negative
    User Should Be Logged In On Diary Screen
    No Booking Should Be Made If Screen Closed Or Fields Missing
