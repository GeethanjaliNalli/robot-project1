*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.date=2025-07-15
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=Consultation

&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.idnumber=8507155052083
    ...    input.patient.cell=0821234567
    ...    select.gender=Male

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2025-07-15 09:30
