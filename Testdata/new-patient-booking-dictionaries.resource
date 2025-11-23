*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.time=10:30
    ...    input.duration=30
    ...    input.reason=Consultation

&{DEBTOR_INFO}
    ...    input.debtor.surname=Smith
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AC
    ...    input.debtor.title=MR
    ...    input.debtor.gender=Male
    ...    input.debtor.idnumber=8501015009087
    ...    input.debtor.cellno=0821234567

&{PATIENT_INFO}
    ...    input.patient.surname=Smith
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AC
    ...    input.patient.title=MR
    ...    input.patient.gender=Male
    ...    input.patient.dob=1985-01-01
    ...    input.patient.cellno=0821234567

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=10:30
