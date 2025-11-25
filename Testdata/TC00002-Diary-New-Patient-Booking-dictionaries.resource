*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{BOOKING_INFO}
    ...    input.date=2024-07-01
    ...    input.time=09:30
    ...    input.duration=30
    ...    select.reason=Consultation
    ...    input.notes=First time booking

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.surname=Carey
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AC
    ...    input.debtor.gender=Male
    ...    input.debtor.idnumber=8501015009087
    ...    input.debtor.cell=0821234567
    ...    input.debtor.email=alex.carey@example.com

&{PATIENT_INFO}
    ...    input.patient.title=MR
    ...    input.patient.surname=Carey
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AC
    ...    input.patient.gender=Male
    ...    input.patient.idnumber=8501015009087
    ...    input.patient.cell=0821234567
    ...    input.patient.email=alex.carey@example.com

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2024-07-01 09:30
