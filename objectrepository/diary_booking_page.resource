*** Settings ***
Documentation       This file contains Diary Booking Page locators.

*** Variables ***
&{BOOKING_INFO_LOCATORS}
...    select.diary.dropdown=css:select.form-control.input-sm.diary.validation
...    select.type.dropdown=css:select.form-control.input-sm.type.validation
...    select.status.dropdown=css:select.form-control.input-sm.status.validation
...    textarea.reason=css:textarea.form-control.input-sm.reason.validation
...    select.location.dropdown=css:select.form-control.input-sm.location.validation
...    input.date=css:input.form-control.input-sm.date.validation
...    input.time=css:input.form-control.input-sm.time.validation
...    input.duration=css:input[name="duration"]

&{DEBTOR_INFO_LOCATORS}
...    input.name=css:div.row.debtor input.form-control.input-sm.name.validation
...    input.surname=css:div.row.debtor input[name="debtor_surname"]
...    input.cellphone=css:div.row.debtor input.form-control.input-sm.cellnr.validation
...    select.id_type=css:div.row.debtor select.form-control.input-sm.idtype.validation
...    input.id_number=css:div.row.debtor input.form-control.input-sm.idnumber.validation
...    input.email=css:div.row.debtor input.form-control.input-sm.email.validation
...    input.medical_aid=css:input.form-control.input-sm.ma_schemename
...    input.ma_option=css:input.form-control.input-sm.ma_optionname.validation
...    input.ma_number=css:input.form-control.input-sm.ma_number.validation
...    select.gender=css:div.row.debtor select.form-control.input-sm.gender.validation
...    input.initials=css:div.row.debtor input.form-control.input-sm.initials.validation
...    select.title=css:div.row.debtor select.form-control.input-sm.title.validation

&{PATIENT_INFO_LOCATORS}
...    input.name=css:div.row.debtor div.patient input.form-control.input-sm.name.validation
...    input.surname=css:div.row.debtor div.patient input.form-control.input-sm.surname.validation
...    input.cellphone=css:div.row.debtor div.patient input.form-control.input-sm.cellnr.validation
...    select.id_type=css:div.row.debtor div.patient select.form-control.input-sm.idtype.validation
...    input.id_number=css:div.row.debtor div.patient input.form-control.input-sm.idnumber.validation
...    input.email=css:div.row.debtor div.patient input.form-control.input-sm.email.validation
...    input.date_of_birth=css:input.form-control.input-sm.dateofbirth.validation
...    input.initials=css:div.row.debtor div.patient input.form-control.input-sm.initials.validation
...    input.dependant_number=css:input.form-control.input-sm.dependant-nr.validation
...    select.dependant_type=css:div.row.debtor div.patient select.form-control.input-sm.type.validation
...    select.gender=css:div.row.debtor div.patient select.form-control.input-sm.gender.validation
...    select.title=css:div.row.debtor div.patient select.form-control.input-sm.title.validation

*** Variables ***
${button.new_booking}    css:button.btn.btn-sm.btn-primary.new-booking
${dialog.add_edit_booking}    css:div[aria-labelledby="ui-id-61"]
${button.repeat_booking}    css:button.btn.btn-xs.btn-default.pull-right.btn-repeat-booking
${input.debtor_search}    css:input[placeholder="Search Debtor by *File no., +MA Scheme, #MA no., Account, Name, Surname, ID or Mobile."]
${button.clear_debtor_info}    xpath://button[.//t[normalize-space(.)='Clear Debtor Info']]
${button.save_booking}    css:button.btn.btn-sm.btn-success.pull-right.btn-save
${button.close_booking}    css:button.btn.btn-sm.btn-danger.pull-left.btn-close
${link.diary_tab}    xpath://a[.//t[normalize-space(.)='Diary']]
${label.booking_details_header}    css:h2.box-title.text-primary
