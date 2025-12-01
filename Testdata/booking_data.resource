*** Settings ***
Documentation    This file contains the dictionaries for booking data used in the test cases for creating a new booking for an existing patient.
Resource    ../common/super.resource

*** Variables ***
&{BOOKING_INFO}
    ...    select.type=Consultation
    ...    select.status=Booked
    ...    input.time=09:15
    ...    input.duration=15
    ...    input.reason=Routine Checkup
    ...    input.patient_id=PATIENT12345
    ...    input.practitioner_id=PRACT001
    ...    input.diary=Main Clinic Diary
    ...    input.date=2025-12-01
