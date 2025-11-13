*** Settings ***
Documentation    Keywords for Add/Edit Booking negative scenario: closing the booking screen without saving.
Resource         ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensure the user is logged in and on the diary screen. Reuses existing login and navigation keywords.
    Login To Application
    Go To Diary Screen

Open Add Edit Booking Screen
    [Documentation]    Open the Add/Edit Booking modal from the diary screen.
    Click Element    ${ADD_EDIT_BOOKING_MODAL}
    Element Should Be Visible    ${ADD_EDIT_BOOKING_MODAL}

Fill Booking Required Fields
    [Documentation]    Fill required fields in the Add/Edit Booking form (if needed for negative scenario).
    Input Text    ${BOOKING_REQUIRED_FIELD1}    Sample Value 1
    Input Text    ${BOOKING_REQUIRED_FIELD2}    Sample Value 2

Close Add Edit Booking Screen Without Saving
    [Documentation]    Close the Add/Edit Booking screen by clicking the close button without saving.
    Click Element    ${BOOKING_CLOSE_BUTTON}
    Element Should Not Be Visible    ${ADD_EDIT_BOOKING_MODAL}

Verify No Booking Is Made
    [Documentation]    Ensure that no new booking is created after closing the Add/Edit Booking screen without saving.
    # Implementation depends on the application's booking list/grid
    Booking Should Not Exist    Sample Value 1

