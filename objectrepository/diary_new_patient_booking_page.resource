*** Settings ***
Documentation    This file contains all locators for New Patient Booking on the Diary page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.save}    css=button[type="submit"].btn-save
${input.patient.firstname}    xpath=//label[text()="First Name"]/following-sibling::input
${input.patient.lastname}    xpath=//label[text()="Last Name"]/following-sibling::input
${input.patient.dob}    css=input[name="dob"]
${select.booking.type}    css=select[name="bookingType"]
${label.success}    xpath=//span[contains(@class,"success") and contains(text(),"Booking successfully created")]
