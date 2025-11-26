*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.date=2025-07-15
    ...    input.time=09:30
    ...    input.duration=30
    ...    select.reason=Consultation
    ...    input.notes=First time booking

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.idnumber=8501015009087
    ...    input.debtor.cellno=0821234567
    ...    input.debtor.email=alex.carey@example.com

&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.gender=Male
    ...    input.patient.dob=1985-01-01
    ...    input.patient.cellno=0821234567

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2025-07-15 09:30
