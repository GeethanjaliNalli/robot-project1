*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_FORM_LOCATORS}
    ...    input.debtor.surname=//input[@id='debtor-surname']
    ...    input.debtor.firstname=//input[@id='debtor-firstname']
    ...    input.debtor.idnumber=//input[@id='debtor-idnumber']
    ...    input.reason=//input[@id='booking-reason']
    ...    button.save=//button[@id='save-booking']
    ...    button.close=//button[@id='close-booking']
