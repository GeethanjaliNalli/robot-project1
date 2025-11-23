*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.reason=Consultation
    ...    select.idtype=RSA ID

&{DEBTOR_INFO}
    ...    input.debtor.surname=Carey

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2024-06-12 09:00
