*** Settings ***
Documentation    Diary page locators used for New Patient Booking.
Resource         ../common/super.resource

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_NEW_PATIENT_BOOKING_LOCATORS}
...    button.new_booking              css:button.btn.btn-primary.new-booking
...    slot.open_time                  css:div.diary-slot.available
...    select.booking_type             css:select[name='booking_type']
...    select.booking_status           css:select[name='booking_status']
...    input.booking_date              css:input[name='booking_date']
...    input.booking_time              css:input[name='booking_time']
...    input.booking_duration          css:input[name='duration']
...    textarea.reason_for_appointment css:textarea[name='reason']
...    input.patient_name              css:input[name='patient_name']
...    input.patient_surname           css:input[name='debtor_surname']
...    input.patient_cellphone         css:input[name='cellnr']
...    select.id_type                  css:select[name='id_type']
...    input.id_number                 css:input[name='idnumber']
...    select.medical_aid_option       css:select[name='ma_optionname']
...    input.medical_aid_number        css:input[name='ma_number']
...    select.gender                   css:select[name='gender']
...    input.initials                  css:input[name='initials']
...    select.title                    css:select[name='title']
...    button.duplicate_debtor         css:button.duplicate-debtor
...    button.save_booking             css:button.btn-save

# Standalone locators
${button.close}    css:button.btn-close
