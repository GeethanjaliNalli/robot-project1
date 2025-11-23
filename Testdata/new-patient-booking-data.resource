*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=Consultation

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.gender=Male
    ...    input.debtor.idnumber=9001015800081
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.carey@example.com

&{PATIENT_INFO}
    ...    input.patient.title=MR
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.initials=AC
    ...    input.patient.gender=Male
    ...    input.patient.idnumber=9001015800081
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.carey@example.com
    ...    input.patient.dob=1990-01-01

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=09:30
