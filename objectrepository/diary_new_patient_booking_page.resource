*** Settings ***
Documentation    This file contains all locators for the Diary New Patient Booking page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.save}    css=button[type="submit"].btn-save
${button.close}    css=button.btn-close
${input.patient.firstname}    xpath=//label[text()="First Name"]/following-sibling::input
${input.patient.lastname}    xpath=//label[text()="Last Name"]/following-sibling::input
${input.booking.date}    css=input.input-sm.date
&{BOOKING_FORM_LOCATORS}
...    input.patient.firstname=${input.patient.firstname}
...    input.patient.lastname=${input.patient.lastname}
...    input.booking.date=${input.booking.date}
