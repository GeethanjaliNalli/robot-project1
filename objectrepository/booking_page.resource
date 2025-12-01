*** Settings ***
Documentation       This file contains Booking Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{BOOKING_FORM_LOCATORS}
...    button.new_booking=.btn-primary.new-booking
...    dialog.add_edit_booking=//span[@class="ui-dialog-title" and text()="Add/Edit Booking"]
...    label.booking_details=//h2[@class="box-title text-primary" and .//t[text()='Booking Details']]
...    button.save=[type="submit"]
...    button.delete=.btn-delete.btn-danger
...    button.repeat_booking=.btn-repeat-booking
...    button.close=.pull-left.btn-close
...    button.duplicate_debtor=.duplicate-debtor
...    button.import_debtor=.import-debtor
...    button.debtor_authorization=.btn-info[title="Add debtor before authorization"]
...    button.clear_debtor_info=//button[.//t[text()='Clear Debtor Info']]
...    button.debtor_patient_search=//button[icon[contains(@class,'fa-ellipsis-h')]]
...    button.dropdown_duration=.col-sm-3 .caret
...    button.dropdown_time=.col-md-2 .caret
...    button.dropdown_location=.col-md-2 .caret
...    button.dropdown_type=.col-md-4 .caret
...    button.dropdown_status=.col-md-4 .caret
...    button.dropdown_service_center=.col-md-4 .caret
...    button.dropdown_idtype=.col-md-4 .caret
...    button.dropdown_title=.col-md-4 .caret
...    button.dropdown_gender=.col-md-4 .caret
...    button.dropdown_dependant_type=.col-md-4 .caret
...    button.dropdown_medical_aid=.col-md-4 .caret
...    button.dropdown_ma_option=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret
...    button.dropdown_patient_title=.col-md-4 .caret
...    button.dropdown_patient_gender=.col-md-4 .caret
...    button.dropdown_patient_dependant_type=.col-md-4 .caret
...    button.dropdown_patient_idtype=.col-md-4 .caret

&{BOOKING_DETAILS_LOCATORS}
...    select.diary=[name="diary_uid"]
...    select.type=[name="booking_type_uid"]
...    select.status=[name="booking_status_uid"]
...    select.location=[name="location_uid"]
...    select.service_center=[name="service_center_uid"]
...    input.date=.input-sm.date
...    input.time=.input-sm.time
...    input.duration=[name="duration"]
...    textarea.reason=.input-sm.reason
...    input.treating_practitioner=.treating-doc
...    input.referring_practitioner=.referring-doc
...    select.dependant_type=.type.validation
...    input.end_time=.input-sm.time[placeholder*='End Time']

&{DEBTOR_DETAILS_LOCATORS}
...    input.debtor_search=.debtor-patient-search-filter
...    input.debtor_name=.input-sm.name
...    input.debtor_surname=[name="debtor_surname"]
...    input.debtor_cellphone=.input-sm.cellnr
...    select.debtor_idtype=.idtype
...    input.debtor_idnumber=.idnumber
...    input.debtor_email=.email
...    input.debtor_medical_aid=.ma_schemename
...    input.debtor_ma_option=.ma_optionname
...    input.debtor_ma_number=.ma_number
...    input.debtor_iod_claim_no=.iod_claim_no
...    input.debtor_iod_date=.iod_date
...    input.debtor_iod_description=.iod_description
...    input.debtor_employer=.employer_search_filter
...    select.debtor_gender=[name="gender"]
...    select.debtor_title=[name="title"]
...    input.debtor_initials=.initials

&{PATIENT_DETAILS_LOCATORS}
...    input.patient_name=.input-sm.name
...    input.patient_surname=.input-sm.surname
...    input.patient_cellnr=.input-sm.cellnr
...    select.patient_idtype=.idtype
...    input.patient_idnumber=.idnumber
...    input.patient_email=.email
...    input.patient_date_of_birth=.dateofbirth
...    input.patient_initials=.initials
...    input.patient_dependant_no=.dependant-nr
...    select.patient_dependant_type=.type.validation
...    select.patient_gender=.gender
...    select.patient_title=.title

&{WARNING_ALERT_LOCATORS}
...    alert.validation_status=.validation-status.error
...    alert.verification_done=.verification-done
...    alert.verification_pending=.verification-pending
...    alert.invoice_status=.invoice-status
...    alert.account_status=.account-status
...    alert.document_status=.document-status
...    alert.clinical_status=.clinical-status

&{DIARY_GRID_LOCATORS}
...    grid.diary=.timeslots
...    grid.diary_row=.timeslot
...    grid.diary_row_time=.timeslot .time
...    grid.booking=.booking
...    grid.booking_time=.booking .time .start
...    grid.booking_date=.booking .date
...    grid.booking_status=.booking .typestatus .status
...    grid.booking_type=.booking .typestatus .type
...    grid.booking_reason=.booking .reason span
...    grid.booking_patient_name=.booking .patient .name span
...    grid.booking_patient_details=.booking .patient .details span
...    grid.booking_practitioner_name=.booking .treatingdoc .details
...    grid.booking_debtor_name=.booking .debtor .name span
...    grid.booking_debtor_details=.booking .debtor .details span
...    grid.booking_summary_status=.booking .summary
...    grid.booking_view_notebook=.booking .btn-view-notebook

# Standalone locators
${button.save}    [type="submit"]
${button.close}    .pull-left.btn-close
${dialog.add_edit_booking}    //span[@class="ui-dialog-title" and text()="Add/Edit Booking"]
${input.debtor_search}    .debtor-patient-search-filter
${input.patient_name}    .input-sm.name
${input.patient_surname}    .input-sm.surname
${input.patient_idnumber}    .idnumber
${input.patient_date_of_birth}    .dateofbirth
${input.patient_cellnr}    .cellnr
${input.patient_email}    .email
${input.patient_initials}    .initials
${input.patient_dependant_no}    .dependant-nr
${select.patient_idtype}    .idtype
${select.patient_dependant_type}    .type.validation
${select.patient_gender}    .gender
${select.patient_title}    .title
${input.debtor_name}    .input-sm.name
${input.debtor_surname}    [name="debtor_surname"]
${input.debtor_cellphone}    .input-sm.cellnr
${input.debtor_idnumber}    .idnumber
${input.debtor_email}    .email
${input.debtor_medical_aid}    .ma_schemename
${input.debtor_ma_option}    .ma_optionname
${input.debtor_ma_number}    .ma_number
${input.debtor_iod_claim_no}    .iod_claim_no
${input.debtor_iod_date}    .iod_date
${input.debtor_iod_description}    .iod_description
${input.debtor_employer}    .employer_search_filter
${select.debtor_gender}    [name="gender"]
${select.debtor_title}    [name="title"]
${input.debtor_initials}    .initials
${input.date}    .input-sm.date
${input.time}    .input-sm.time
${input.duration}    [name="duration"]
${textarea.reason}    .input-sm.reason
${input.treating_practitioner}    .treating-doc
${input.referring_practitioner}    .referring-doc
${select.diary}    [name="diary_uid"]
${select.type}    [name="booking_type_uid"]
${select.status}    [name="booking_status_uid"]
${select.location}    [name="location_uid"]
${select.service_center}    [name="service_center_uid"]
${button.new_booking}    .btn-primary.new-booking
${button.delete}    .btn-delete.btn-danger
${button.repeat_booking}    .btn-repeat-booking
${button.duplicate_debtor}    .duplicate-debtor
${button.import_debtor}    .import-debtor
${button.debtor_authorization}    .btn-info[title="Add debtor before authorization"]
${button.clear_debtor_info}    //button[.//t[text()='Clear Debtor Info']]
${button.debtor_patient_search}    //button[icon[contains(@class,'fa-ellipsis-h')]]
${alert.validation_status}    .validation-status.error
${alert.verification_done}    .verification-done
${alert.verification_pending}    .verification-pending
${alert.invoice_status}    .invoice-status
${alert.account_status}    .account-status
${alert.document_status}    .document-status
${alert.clinical_status}    .clinical-status
${grid.diary}    .timeslots
${grid.diary_row}    .timeslot
${grid.diary_row_time}    .timeslot .time
${grid.booking}    .booking
${grid.booking_time}    .booking .time .start
${grid.booking_date}    .booking .date
${grid.booking_status}    .booking .typestatus .status
${grid.booking_type}    .booking .typestatus .type
${grid.booking_reason}    .booking .reason span
${grid.booking_patient_name}    .booking .patient .name span
${grid.booking_patient_details}    .booking .patient .details span
${grid.booking_practitioner_name}    .booking .treatingdoc .details
${grid.booking_debtor_name}    .booking .debtor .name span
${grid.booking_debtor_details}    .booking .debtor .details span
${grid.booking_summary_status}    .booking .summary
${grid.booking_view_notebook}    .booking .btn-view-notebook
