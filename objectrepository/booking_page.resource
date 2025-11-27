*** Settings ***
Documentation       This file contains Booking Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{BOOKING_FORM_LOCATORS}
...    button.new-booking=.btn-primary.new-booking
...    dialog.booking-title=.ui-dialog-title
...    select.diary=.input-sm.diary
...    select.type=.input-sm.type
...    select.status=.input-sm.status
...    select.location=.input-sm.location
...    textarea.reason=.input-sm.reason
...    input.date=.input-sm.date
...    input.time=.input-sm.time
...    input.duration=[name="duration"]
...    input.treating-practitioner=.treating-doc
...    input.referring-practitioner=.referring-doc
...    select.service-center=.input-sm.service-center
...    button.repeat-booking=.btn-repeat-booking
...    button.save=[type="submit"]
...    button.delete=.btn-delete.btn-danger
...    button.close=.pull-left.btn-close
...    input.rest-of-day=[type="checkbox"][data-bind*="duration_rest_of_day"]
...    input.end-time=.input-sm.time
...    input.patient.name=//label[t[text()='Name']]/following-sibling::input
...    input.patient.surname=//label[t[text()='Surname']]/following-sibling::input
...    input.patient.cellnr=//label[t[contains(text(),'Cell')]]/following-sibling::input
...    select.patient.idtype=.input-sm.idtype
...    input.patient.idnumber=.input-sm.idnumber
...    input.patient.email=.input-sm.email
...    input.patient.dateofbirth=.input-sm.dateofbirth
...    input.patient.initials=.input-sm.initials
...    input.patient.dependant-nr=.input-sm.dependant-nr
...    select.patient.dependant-type=.input-sm.type
...    select.patient.gender=.input-sm.gender
...    select.patient.title=.input-sm.title

${link.diary}    //a[t[text()='Diary']]
