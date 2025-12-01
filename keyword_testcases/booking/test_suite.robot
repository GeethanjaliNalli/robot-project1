*** Settings ***
Documentation    This file contains test cases related to creating a new booking for an existing patient, following the booking workflow for practitioners.
Resource    ../../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Create A New Booking For Existing Patient
    [Documentation]    Creates a new booking for an existing patient and verifies the booking appears in the diary at the selected time slot.
    Open Practitioner Diary    ${BOOKING_INFO}[input.practitioner_id]    ${BOOKING_INFO}[input.diary]    ${BOOKING_INFO}[input.date]
    Select Available Time Slot    ${BOOKING_INFO}[input.time]
    Initiate New Booking
    Search And Select Existing Patient    ${BOOKING_INFO}[input.patient_id]
    Enter Booking Details    ${BOOKING_INFO}
    Save Booking
    Validate Booking In Diary    ${BOOKING_INFO}[input.time]    ${BOOKING_INFO}[input.patient_id]    ${BOOKING_INFO}[input.diary]    ${BOOKING_INFO}[input.date]
