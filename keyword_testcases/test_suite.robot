*** Settings ***
Documentation    Test suite for login and diary new patient booking scenarios.
Resource         ../common/super.resource
Resource         ../Testdata/new_patient_booking_data.resource
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
    [Documentation]    Diary_ New patient booking. A booking should be made if required information was filled in and saved. If the user closes the screen or not all required fields are filled in, NO booking should be made.
    # Step 1-2: Ensure user is on Diary screen
    Open Diary Screen
    # Step 3: Click on 'New Booking' button
    Click New Booking Button    ${diary.newBookingButton}
    # Step 4-6: Fill patient details (First Name, Last Name, DOB, Gender, Phone, Email, Address)
    Fill Patient Details    ${diary.patientFirstNameField}    ${BOOKING_DATA.input.patientFirstName}    ${diary.patientLastNameField}    ${BOOKING_DATA.input.patientLastName}    ${diary.patientDOBField}    ${BOOKING_DATA.input.patientDOB}    ${diary.patientGenderDropdown}    ${BOOKING_DATA.select.patientGender}    ${diary.patientPhoneField}    ${BOOKING_DATA.input.patientPhone}    ${diary.patientEmailField}    ${BOOKING_DATA.input.patientEmail}    ${diary.patientAddressField}    ${BOOKING_DATA.input.patientAddress}
    # Step 7-8: Select booking date and time
    Select Booking Date And Time    ${diary.bookingDateField}    ${BOOKING_DATA.input.bookingDate}    ${diary.bookingTimeField}    ${BOOKING_DATA.input.bookingTime}
    # Step 9: Select booking type
    Select Booking Type    ${diary.bookingTypeDropdown}    ${BOOKING_DATA.select.bookingType}
    # Step 10: Select doctor
    Select Doctor    ${diary.doctorDropdown}    ${BOOKING_DATA.select.doctor}
    # Step 11: Enter reason for visit
    Enter Reason For Visit    ${diary.reasonForVisitField}    ${BOOKING_DATA.input.reasonForVisit}
    # Step 12: Select insurance provider and enter policy number
    Enter Insurance Details    ${diary.insuranceProviderDropdown}    ${BOOKING_DATA.select.insuranceProvider}    ${diary.policyNumberField}    ${BOOKING_DATA.input.policyNumber}
    # Step 13: Enter emergency contact details
    Enter Emergency Contact Details    ${diary.emergencyContactField}    ${BOOKING_DATA.input.emergencyContact}    ${diary.emergencyContactPhoneField}    ${BOOKING_DATA.input.emergencyContactPhone}
    # Step 14: Add notes
    Add Booking Notes    ${diary.notesField}    ${BOOKING_DATA.input.notes}
    # Step 15: Save the booking
    Save Booking    ${diary.saveButton}
    # Step 16: Validate booking is created successfully
    Validate Booking Created    ${diary.bookingSuccessMessage}
