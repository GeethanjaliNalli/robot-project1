*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=General Consultation

&{DEBTOR_INFO}
    ...    input.debtor.surname=Smith
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AC
    ...    select.debtor.title=MR
    ...    input.debtor.idnumber=9001015800081
    ...    input.debtor.gender=Male
    ...    input.debtor.cell=0821234567

&{PATIENT_INFO}
    ...    input.patient.surname=Smith
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AC
    ...    select.patient.title=MR
    ...    input.patient.idnumber=9001015800081
    ...    input.patient.gender=Male
    ...    input.patient.cell=0821234567

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=09:30
