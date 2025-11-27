*** Settings ***
Documentation    This file contains all the test cases related to the GoodX Web Application.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_02 Diary New Patient Booking With All Required Information
    [Documentation]    Verifies that a new patient booking can be created successfully when all required
    ...                patient, debtor and booking information is captured and the booking is saved.
    ...                Ensures that the booking is visible in the diary for the selected practitioner,
    ...                date and time.
    Open Diary Module
    Open New Patient Booking Screen
    Populate New Patient Details For Booking    ${PATIENT_INFO_VALID}
    Populate Debtor Details For Booking    ${DEBTOR_INFO_PRIVATE}
    Populate Booking Details For New Patient    ${BOOKING_INFO_VALID}
    Save New Patient Booking
    Validate Booking Created In Diary    ${BOOKING_INFO_VALID}    ${EXPECTED_DATA}[booking_created_message]

TC_03 Diary New Patient Booking Missing Required Fields
    [Documentation]    Verifies that the system does not create a new patient booking when required
    ...                patient and/or booking fields are missing and the user attempts to save.
    ...                Confirms that an appropriate validation indication is shown and that no
    ...                booking is created in the diary.
    Open Diary Module
    Open New Patient Booking Screen
    Populate New Patient Details For Booking    ${PATIENT_INFO_MISSING_REQUIRED}
    Populate Booking Details For New Patient    ${BOOKING_INFO_MISSING_REQUIRED}
    Attempt To Save New Patient Booking With Missing Data
    Validate Required Fields Indication For New Patient Booking    ${EXPECTED_DATA}[required_fields_error_message]
    Validate No Booking Created In Diary For New Patient    ${BOOKING_INFO_MISSING_REQUIRED}    ${EXPECTED_DATA}[booking_not_created_message]

TC_04 Diary New Patient Booking Close Screen Without Saving
    [Documentation]    Verifies that no booking is created when the user closes the New Patient Booking
    ...                screen without saving, even though all required information has been captured.
    ...                Ensures that the diary does not contain a booking for the specified
    ...                practitioner, date and time.
    Open Diary Module
    Open New Patient Booking Screen
    Populate New Patient Details For Booking    ${PATIENT_INFO_VALID}
    Populate Debtor Details For Booking    ${DEBTOR_INFO_PRIVATE}
    Populate Booking Details For New Patient    ${BOOKING_INFO_CLOSE_WITHOUT_SAVE}
    Close New Patient Booking Screen Without Saving
    Validate No Booking Created In Diary For New Patient    ${BOOKING_INFO_CLOSE_WITHOUT_SAVE}    ${EXPECTED_DATA}[booking_not_created_message]
