*** Settings ***
Documentation    This file has all type of locators for Booking Page (New Patient Booking)

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.new_booking}                 .btn.btn-sm.btn-primary.new-booking
${select.booking_type}                .ui-dialog.ui-corner-all .form-control.input-sm.type.validation
${select.booking_status}              .ui-dialog.ui-corner-all .form-control.input-sm.status.validation
${select.date}                        .ui-dialog.ui-corner-all .form-control.input-sm.date.validation
${select.time}                        .ui-dialog.ui-corner-all .form-control.input-sm.time.validation
${input.duration}                     .ui-dialog.ui-corner-all input[name='duration']
${input.reason}                       .ui-dialog.ui-corner-all .form-control.input-sm.reason.validation
${input.name}                         .form-control.input-sm.name.ui-autocomplete-input.treating-doc
${input.surname}                      input[name='debtor_surname']
${input.cellphone}                    .form-control.input-sm.cellnr.validation
${select.id_type}                     .form-control.input-sm.idtype.validation
${input.id_number}                    .form-control.input-sm.idnumber.validation
${button.duplicate_debtor}            .btn.btn-xs.btn-default.pull-right.duplicate-debtor
${button.save_booking}                .btn.btn-sm.btn-success.pull-right.btn-save
