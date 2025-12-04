*** Settings ***
Documentation    Test suite for login and diary new patient booking scenarios.
Resource         ../common/super.resource
Resource         ../Testdata/booking_data.resource
Test Setup       Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Handle Attention Alert    dismiss
    Validate Dashboard Is Displayed
    Logout From The Application
    Handle Attention Alert    dismiss
    Logout From The Application
    Handle Attention Alert    accept

TC00002_Diary_NPB - New patient booking
    [Documentation]    Diary_ New patient booking: A booking should be made if required information was filled in and saved. If the user closes the screen or not all required fields are filled in, NO booking should be made.
    # Step 1-2: Ensure user is on diary screen and open new booking dialog
    Open Diary And Start New Booking
    # Step 3-4: Fill patient details (first name, last name, DOB, gender, email, phone, address)
    Fill Patient Details For Booking
    ...    ${BOOKING_DATA.input.patientFirstName}
    ...    ${BOOKING_DATA.input.patientLastName}
    ...    ${BOOKING_DATA.input.patientDOB}
    ...    ${BOOKING_DATA.input.patientGender}
    ...    ${BOOKING_DATA.input.patientEmail}
    ...    ${BOOKING_DATA.input.patientPhone}
    ...    ${BOOKING_DATA.input.patientAddress}
    # Step 5-6: Select booking date and time
    Select Booking Date And Time
    ...    ${BOOKING_DATA.input.bookingDate}
    ...    ${BOOKING_DATA.input.bookingTime}
    # Step 7: Select booking type (New Patient)
    Select Booking Type    ${BOOKING_DATA.select.bookingType}
    # Step 8: Select doctor
    Select Doctor For Booking    ${BOOKING_DATA.select.doctor}
    # Step 9: Select appointment reason
    Select Appointment Reason    ${BOOKING_DATA.select.appointmentReason}
    # Step 10-11: Fill insurance details
    Fill Insurance Details For Booking
    ...    ${BOOKING_DATA.input.insuranceNumber}
    ...    ${BOOKING_DATA.select.insuranceProvider}
    # Step 12: Add notes (Add Text must be a separate keyword)
    # Add notes to booking
    Add Booking Notes    ${BOOKING_DATA.textarea.notes}
    # Step 13: Save booking
    Save New Patient Booking
    # Step 14: Validate booking is created (expected result)
    Validate New Patient Booking Created
