*** Settings ***
Documentation       This file contains Booking Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{BOOKING_FORM_LOCATORS}
...    button.new-booking=.btn-primary.new-booking
...    dialog.add-edit-booking=.ui-dialog-title
...    select.diary=.input-sm.diary
...    select.type=.input-sm.type
...    select.status=.input-sm.status
...    textarea.reason=.input-sm.reason
...    input.date=.input-sm.date
...    input.time=.input-sm.time
...    input.duration=[name="duration"]
...    input.treating-practitioner=.treating-doc
...    input.referring-practitioner=.referring-doc
...    select.location=.input-sm.location
...    select.service-center=.input-sm.service-center
...    button.repeat-booking=.btn-repeat-booking
...    button.delete=.btn-delete.btn-danger
...    button.save=[type="submit"]
...    button.close=.pull-left.btn-close

${button.save}    .btn-save
${button.close}    .btn-close
