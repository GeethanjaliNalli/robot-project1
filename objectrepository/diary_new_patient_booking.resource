*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_FORM_LOCATORS}
    ...    input.debtor.surname=//input[@id='debtorSurname']
    ...    input.reason=//input[@id='reason']
    ...    select.idtype=//select[@id='idType']
    ...    button.save=//button[@id='saveBooking']
    ...    button.close=//button[@id='closeBooking']

&{BOOKING_INFO}
    ...    input.debtor.surname=Carey
    ...    input.reason=Consultation
    ...    select.idtype=RSA ID

&{BOOKING_INFO_MISSING_SURNAME}
    ...    input.debtor.surname=
    ...    input.reason=Consultation
    ...    select.idtype=RSA ID

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0821234567
    ...    timeslot=2024-07-01 09:00
