*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_FORM_LOCATORS}
    ...    input.patient.firstname=//input[@id='patient_firstname']
    ...    input.patient.surname=//input[@id='patient_surname']
    ...    input.patient.idnumber=//input[@id='patient_idnumber']
    ...    select.patient.gender=//select[@id='patient_gender']
    ...    input.patient.cellno=//input[@id='patient_cellno']
    ...    input.date=//input[@id='booking_date']
    ...    input.time=//input[@id='booking_time']
    ...    input.duration=//input[@id='booking_duration']
    ...    input.reason=//input[@id='booking_reason']
    ...    button.save=//button[@id='save_booking']
