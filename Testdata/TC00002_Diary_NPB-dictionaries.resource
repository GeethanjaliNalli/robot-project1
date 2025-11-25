*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{BOOKING_INFO}
    ...    input.date=2025-07-15
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=Consultation
    ...    select.practitioner=Dr. Smith

&{PATIENT_INFO}
    ...    input.firstname=Alex
    ...    input.surname=Carey
    ...    input.initials=AC
    ...    select.gender=Male
    ...    input.dob=1992-03-12
    ...    input.idnumber=9203121234567
    ...    input.cellno=0821234567

&{DEBTOR_INFO}
    ...    input.debtor.surname=Carey
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AC
    ...    input.debtor.cellno=0821234567
    ...    input.debtor.idnumber=9203121234567

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2025-07-15 09:30
