*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_GRID_LOCATORS}
...    table.diary=.diary-table
...    table.diary.header=.diary-table thead tr
...    table.diary.row=.diary-table tbody tr
...    table.diary.row.time=.diary-table tbody tr td.time
...    table.diary.row.patient=.diary-table tbody tr td.patient
...    table.diary.row.action=.diary-table tbody tr td.actions
...    button.diary.row.edit=.diary-table tbody tr td.actions .btn-edit
...    button.diary.row.delete=.diary-table tbody tr td.actions .btn-delete
...    label.diary.date=//label[t[text()='Date']]
...    input.diary.date=[name="diary_date"]
...    button.diary.add=.btn.btn-add-booking

&{BOOKING_FORM_LOCATORS}
...    input.patient.name=//label[t[text()='Name']]/following-sibling::input
...    input.patient.surname=//label[t[text()='Surname']]/following-sibling::input
...    input.patient.dob=//label[t[text()='Date of Birth']]/following-sibling::input
...    select.patient.gender=[name="gender"]
...    input.patient.cellphone=//label[t[text()='Cellphone']]/following-sibling::input
...    input.patient.email=//label[t[text()='Email']]/following-sibling::input
...    select.booking.type=[name="booking_type"]
...    input.booking.time=[name="booking_time"]
...    textarea.booking.notes=[name="booking_notes"]
...    button.booking.save=[type="submit"]
...    button.booking.cancel=.btn-cancel-booking
...    label.booking.warning=//div[contains(@class,'alert-warning')]

&{QUICKNOTE_LOCATORS}
...    button.booking.display=.btn.booking-display.btn-primary
...    button.clinical.sidebar=.btn-sidebar.btn.btn-sm.clinical
...    button.forms.library.dropdown=button[data-toggle="dropdown"]
...    select.forms.library=.forms-library-select
...    option.quicknote=//option[normalize-space()='QUICK NOTE']
...    button.add.image=.btn.btn-file.btn-clinical-event
...    button.upload.file=button.btn.btn-file
...    input.quicknote.text=//label[t[text()='Quick Note']]/following-sibling::input | .input-sm
...    button.save.quicknote=.btn.btn-sm.btn-primary.w100.mb5[data-bind*="processEvent: { click: ['Save'"]
...    button.print.quicknote=.btn.btn-sm.btn-success.btn-print
...    button.upload.pdf=button.btn.btn-file
...    button.open.pdf=button.btn.booking-display
...    button.quicknote.suggestion.item=.autocomplete-suggestion
...    list.quicknote.suggestions=.autocomplete-suggestions
...    button.quicknote.clear=.btn-clear-quicknote
...    dialog.quicknote=//div[contains(@class,'modal') and .//span[contains(text(),'Quick Note')]]

&{PATIENT_DETAILS_LOCATORS}
...    input.patient.id=[name="patient_id"]
...    input.patient.address=//label[t[text()='Address']]/following-sibling::input
...    select.patient.idtype=[name="id_type"]
...    input.patient.idnumber=//label[t[text()='ID Number']]/following-sibling::input
...    input.patient.medicalaid=//label[t[text()='Medical Aid']]/following-sibling::input
...    input.patient.medicalaidno=//label[t[text()='Medical Aid Number']]/following-sibling::input
...    button.patient.search=.btn-search-patient

&{WARNING_ALERT_LOCATORS}
...    alert.warning=.alert-warning
...    alert.success=.alert-success
...    alert.error=.alert-danger
...    icon.warning=.icon-warning
...    icon.success=.icon-success
...    icon.error=.icon-error

${button.close.dialog}    .pull-left.btn-close
${dialog.upload.image}    //div[contains(@class,'modal') and .//span[contains(text(),'Upload Image')]]
${dialog.upload.pdf}      //div[contains(@class,'modal') and .//span[contains(text(),'Upload PDF')]]
${tab.clinical}           .tab-clinical
${tab.booking}            .tab-booking
${tab.patient}            .tab-patient
${tab.debtor}             .tab-debtor
${tab.documents}          .tab-documents
