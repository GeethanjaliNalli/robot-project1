*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_FORM_LOCATORS}
    ...    input.debtor.surname=//input[@id='debtorSurname']
    ...    input.reason=//textarea[@id='bookingReason']
    ...    select.idtype=//select[@id='idType']
    ...    button.save=//button[@id='saveBooking']
    ...    button.close=//button[@id='closeBooking']
