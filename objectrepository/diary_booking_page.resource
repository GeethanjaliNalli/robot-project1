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
...    input.debtor.search=css:input[placeholder="Search Debtor by *File no., +MA Scheme, #MA no., Account, Name, Surname, ID or Mobile."]
...    input.debtor.name=css:div.row.debtor input.form-control.input-sm.name.validation
...    input.debtor.surname=css:input[name="debtor_surname"]
...    input.debtor.cellphone=css:div.row.debtor input.form-control.input-sm.cellnr.validation
...    select.debtor.idtype=css:div.row.debtor select.form-control.input-sm.idtype.validation
...    input.debtor.idnumber=css:div.row.debtor input.form-control.input-sm.idnumber.validation
...    input.debtor.email=css:div.row.debtor input.form-control.input-sm.email.validation
...    input.debtor.medical_aid=css:input.form-control.input-sm.ma_schemename
...    input.debtor.ma_option=css:input.form-control.input-sm.ma_optionname.validation
...    input.debtor.ma_number=css:input.form-control.input-sm.ma_number.validation
...    select.debtor.gender=css:div.row.debtor select.form-control.input-sm.gender.validation
...    input.debtor.initials=css:div.row.debtor input.form-control.input-sm.initials.validation
...    select.debtor.title=css:div.row.debtor select.form-control.input-sm.title.validation

&{PATIENT_INFO_LOCATORS}
...    input.patient.name=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient input.form-control.input-sm.name.validation
...    input.patient.surname=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient input.form-control.input-sm.surname.validation
...    input.patient.cellphone=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient input.form-control.input-sm.cellnr.validation
...    select.patient.idtype=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient select.form-control.input-sm.idtype.validation
...    input.patient.idnumber=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient input.form-control.input-sm.idnumber.validation
...    input.patient.email=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient input.form-control.input-sm.email.validation
...    input.patient.dateofbirth=css:input.form-control.input-sm.dateofbirth.validation
...    input.patient.initials=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient input.form-control.input-sm.initials.validation
...    input.patient.dependant_number=css:input.form-control.input-sm.dependant-nr.validation
...    select.patient.dependant_type=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient select.form-control.input-sm.type.validation
...    select.patient.gender=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient select.form-control.input-sm.gender.validation
...    select.patient.title=css:div.row.debtor + div.row.debtor + div.row.debtor div.patient select.form-control.input-sm.title.validation

${button.diary.tab}        css:a[href="#"] t:contains("Diary")
${button.new.booking}      css:button.btn.btn-sm.btn-primary.new-booking
${dialog.add.edit.booking}    css:div.ui-dialog[aria-labelledby="ui-id-61"]
${label.booking.details}   css:h2.box-title.text-primary
${button.repeat.booking}   css:button.btn.btn-xs.btn-default.pull-right.btn-repeat-booking
${button.clear.debtor.info}    xpath://button[.//t[normalize-space(.)="Clear Debtor Info"]]
${button.close.booking}    css:button.btn.btn-sm.btn-danger.pull-left.btn-close
${button.save.booking}     css:button.btn.btn-sm.btn-success.pull-right.btn-save
${button.print.booking.label}    xpath://button[span[contains(normalize-space(.),"Print Booking Label")]]
