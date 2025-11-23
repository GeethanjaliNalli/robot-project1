*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.id=9001015800081
    ...    select.patient.gender=Male
    ...    input.reason=Consultation
    ...    input.date=2025-12-01
    ...    input.time=09:30
    ...    input.duration=30

&{BOOKING_INFO_MISSING_SURNAME}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=
    ...    input.patient.id=9001015800081
    ...    select.patient.gender=Male
    ...    input.reason=Consultation
    ...    input.date=2025-12-01
    ...    input.time=09:30
    ...    input.duration=30

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2025-12-01 09:30
