*** Settings ***
Documentation    This file contains test data dictionaries used in Robot Framework test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_FORM_LOCATORS}
    ...    input.patient.firstname=//input[@name='patient_firstname']
    ...    input.patient.surname=//input[@name='patient_surname']
    ...    input.patient.id=//input[@name='patient_id']
    ...    select.patient.gender=//select[@name='patient_gender']
    ...    input.reason=//input[@name='booking_reason']
    ...    input.date=//input[@name='booking_date']
    ...    input.time=//input[@name='booking_time']
    ...    input.duration=//input[@name='booking_duration']
    ...    button.save=//button[@id='save_booking']
    ...    button.close=//button[@id='close_booking']
