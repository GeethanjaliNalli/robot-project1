*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{BOOKING_INFO}
    ...    input.time=09:00
    ...    input.date=2024-07-01
    ...    input.duration=30
    ...    select.reason=Consultation
    ...    input.notes=First time booking

&{DEBTOR_INFO}
    ...    input.debtor.surname=Smith
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AC
    ...    select.debtor.title=MR
    ...    input.debtor.idnumber=9001015800081
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.smith@email.com

&{PATIENT_INFO}
    ...    input.patient.surname=Smith
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AC
    ...    select.patient.gender=Male
    ...    input.patient.dob=1990-01-01
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.smith@email.com

&{EXPECTED_DATA}
    ...    debtor_name=MR Smith, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2024-07-01 09:00
