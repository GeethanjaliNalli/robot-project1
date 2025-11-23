*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.idnumber=8001015009087
    ...    select.patient.gender=Male
    ...    input.patient.cellno=0821234567
    ...    input.date=2024-06-20
    ...    input.time=10:30
    ...    input.duration=30
    ...    input.reason=General Checkup

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2024-06-20 10:30
