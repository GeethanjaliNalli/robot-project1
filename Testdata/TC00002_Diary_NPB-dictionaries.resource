*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{BOOKING_INFO}
    ...    input.date=2024-07-01
    ...    input.time=09:30
    ...    input.duration=30
    ...    input.reason=General Consultation
    ...    select.doctor=Dr Smith

&{PATIENT_INFO}
    ...    input.firstname=Alex
    ...    input.surname=Carey
    ...    input.initials=AC
    ...    select.gender=Male
    ...    input.dob=1990-05-15
    ...    input.idnumber=9005151234567
    ...    input.cellno=0812345678

&{DEBTOR_INFO}
    ...    input.firstname=Alex
    ...    input.surname=Carey
    ...    input.initials=AC
    ...    select.title=MR
    ...    input.cellno=0812345678
    ...    input.email=alex.carey@email.com
    ...    input.idnumber=9005151234567

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0812345678
    ...    timeslot=2024-07-01 09:30
