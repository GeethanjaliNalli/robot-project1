*** Settings ***
Documentation       This file contains Booking Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{BOOKING_FORM_LOCATORS}
...    button.new-booking=.btn.btn-sm.btn-primary.new-booking
...    dialog.add-edit-booking=.ui-dialog[aria-labelledby="ui-id-61"]
...    select.diary=.form-control.input-sm.diary.validation
...    select.type=.form-control.input-sm.type.validation
...    select.status=.form-control.input-sm.status.validation
...    select.location=.form-control.input-sm.location.validation
...    select.service-center=.form-control.input-sm.service-center.validation
...    input.date=.form-control.input-sm.date.validation
...    input.time=.form-control.input-sm.time.validation
...    input.duration=[name="duration"]
...    textarea.reason=.form-control.input-sm.reason.validation
...    input.treating-practitioner=.form-control.input-sm.name.ui-autocomplete-input.treating-doc.validation
...    input.referring-practitioner=.form-control.input-sm.name.ui-autocomplete-input.referring-doc
...    button.repeat-booking=.btn.btn-xs.btn-default.pull-right.btn-repeat-booking
...    button.delete=.btn-delete.btn-danger
...    button.save=.btn.btn-sm.btn-success.pull-right.btn-save
...    button.close=.btn.btn-sm.btn-danger.pull-left.btn-close

${button.close}    .pull-left.btn-close
${button.save}     .btn-save
