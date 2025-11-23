*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.date=2024-07-01
    ...    input.time=09:00
    ...    input.duration=30
    ...    input.reason=Initial consultation

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.surname=Smith
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AS
    ...    input.debtor.idnumber=9001015800081
    ...    input.debtor.gender=Male
    ...    input.debtor.cellno=0821234567
    ...    input.debtor.email=alex.smith@email.com

&{PATIENT_INFO}
    ...    input.patient.title=MR
    ...    input.patient.surname=Smith
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AS
    ...    input.patient.gender=Male
    ...    input.patient.dob=1990-01-01
    ...    input.patient.cellno=0821234567

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AS, Alex
    ...    cell_no=0821234567
    ...    timeslot=2024-07-01 09:00
