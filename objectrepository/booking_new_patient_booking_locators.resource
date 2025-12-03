*** Settings ***
Documentation    Booking page locators used for New Patient Booking.
Resource         ../common/super.resource

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{BOOKING_NEW_PATIENT_BOOKING_LOCATORS}
...    button.new_booking=button.btn.btn-primary.new-booking
...    input.booking_type=select[name="booking_type"]
...    input.booking_status=select[name="booking_status"]
...    input.booking_date=input[name="booking_date"]
...    input.booking_time=input[name="booking_time"]
...    input.duration=input[name="duration"]
...    textarea.reason=input[name="reason"]
...    input.patient_name=input[name="debtor_name"]
...    input.patient_surname=input[name="debtor_surname"]
...    input.cellphone=input[name="cellnr"]
...    select.id_type=select[name="idtype"]
...    input.id_number=input[name="idnumber"]
...    input.medical_aid_option=input[name="ma_optionname"]
...    input.medical_aid_number=input[name="ma_number"]
...    select.gender=select[name="gender"]
...    input.initials=input[name="initials"]
...    select.title=select[name="title"]
...    button.duplicate_debtor=button.btn.duplicate-debtor
...    button.save_booking=button.btn.btn-success.btn-save
...    button.close_booking=button.btn.btn-danger.btn-close

# Standalone locators
${button.save}    button.btn.btn-success.btn-save
${button.close}   button.btn.btn-danger.btn-close
