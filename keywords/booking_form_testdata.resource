*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.debtor.surname=Carey
    ...    input.debtor.firstname=Alex
    ...    input.debtor.idnumber=8001015009087
    ...    input.reason=Consultation

&{BOOKING_INFO_MISSING_SURNAME}
    ...    input.debtor.firstname=Alex
    ...    input.debtor.idnumber=8001015009087
    ...    input.reason=Consultation

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2024-07-01 09:00
