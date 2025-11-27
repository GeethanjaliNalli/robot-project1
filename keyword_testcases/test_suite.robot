
*** Test Cases ***
TC_02 New Patient Booking - Successful Booking
    [Documentation]    Verifies that a new patient booking can be created when all required information is provided and saved. Confirms booking creation and success message.
    Go To Diary Screen
    Open New Booking Dialog
    Enter Patient Information    &{PATIENT_INFO}
    Enter Booking Information    &{BOOKING_INFO}
    Save Booking
    Validate Booking Is Created    &{EXPECTED_DATA}[confirmation_message]
    Close Booking Dialog

TC_03 New Patient Booking - Required Fields Missing
    [Documentation]    Verifies that booking is not created when required fields are missing. Confirms error message is displayed and no booking is made.
    Go To Diary Screen
    Open New Booking Dialog
    Enter Patient Information    &{PATIENT_INFO}    exclude=firstname
    Enter Booking Information    &{BOOKING_INFO}
    Save Booking
    Validate Error Message Is Displayed    &{EXPECTED_DATA}[error_message]
    Validate Booking Is Not Created
    Close Booking Dialog

TC_04 New Patient Booking - Close Without Saving
    [Documentation]    Verifies that closing the booking dialog without saving does not create a booking.
    Go To Diary Screen
    Open New Booking Dialog
    Enter Patient Information    &{PATIENT_INFO}
    Enter Booking Information    &{BOOKING_INFO}
    Close Booking Dialog Without Saving
    Validate Booking Is Not Created
