*** Settings ***
Documentation    Test suite for negative scenario: Close the Add/Edit Booking screen without saving and verify no booking is created.
Resource         ../../common/super.resource

*** Test Cases ***
TC-N002 Negative Scenario - Close the Add/Edit Booking Screen
    [Documentation]    Verify that closing the Add/Edit Booking screen without saving does not create a booking.
    [Tags]    Negative    Booking    KDD    Medium
    User Should Be Logged In On Diary Screen
    Open Add Edit Booking Screen
    Fill Booking Required Fields
    Close Add Edit Booking Screen Without Saving
    Verify No Booking Is Made
