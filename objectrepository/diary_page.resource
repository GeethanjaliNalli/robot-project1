*** Settings ***
Documentation       This file contains Diary Page locators for booking, quicknote, and related diary actions.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_NAVIGATION_LOCATORS}
...    tab.diary=//a[t[text()='Diary']]
...    tab.dashboard=//a[t[text()='Dashboard']]
...    tab.inbox=//a[t[text()='Inbox']]
...    tab.clinical_reports=//a[t[text()='Clinical Reports']]
...    tab.hospital_rounds=//a[t[text()='Hospital Rounds']]
...    tab.theatre_manager=//a[t[text()='Theatre Manager']]
...    tab.patient_identifier=//a[t[text()='Patient Identifier']]
...    button.new_booking=.btn.new-booking
...    button.new_task=.btn.new-task
...    button.new_operation=.btn.new-operation
...    button.reload_bookings=.btn-reload-bookings
...    input.filter_bookings=input[placeholder='Filter bookings ...']
...    button.show_active_bookings=.booking-display.btn-primary
...    button.hide_tasks=//button[contains(.,'Hide Tasks')]
...    button.hide_closed_tasks=//button[contains(.,'Hide Closed Tasks')]
...    button.available_booking_times=//button[@title='Click here for available booking times']
...    button.search_debtor_bookings=//button[@title='Search for debtor bookings']
...    button.print_diary=//button[contains(@class,'print-diary')]
...    button.procedure_search=//button[@title='Click here to view procedures or ICD10']
...    dropdown.diary_types=.diary-types .dropdown-menu
...    dropdown.render_policies=.render-policies .dropdown-menu

&{DIARY_GRID_LOCATORS}
...    grid.diary_timeslots=.timeslots
...    cell.timeslot=//div[contains(@class,'timeslot')]
...    cell.timeslot_time=//div[contains(@class,'timeslot')]//div[@class='time']
...    cell.timeslot_label=//div[contains(@class,'timeslot')]//div[@class='time']/text()
...    cell.timeslot_selected=//div[contains(@class,'timeslot') and contains(@class,'selected')]
...    button.timeslot_history=//button[@title='View timeslot history']
...    table.diary=//table[contains(@class,'table-striped')]
...    table.diary.header=//table[contains(@class,'table-striped')]//th
...    table.diary.row=//table[contains(@class,'table-striped')]//tr
...    table.diary.cell.time=//table[contains(@class,'table-striped')]//td[1]
...    table.diary.cell.name=//table[contains(@class,'table-striped')]//td[2]
...    table.diary.row.action=//button[contains(.,'action')]

&{BOOKING_FORM_LOCATORS}
...    booking.container=//div[contains(@class,'booking')]
...    booking.selected=//div[contains(@class,'booking') and contains(@class,'selected')]
...    booking.deleted=//div[contains(@class,'booking') and contains(@class,'deleted')]
...    input.patient_name=//div[contains(@class,'patient')]//div[@class='name']/span
...    input.patient_mobile=//div[contains(@class,'patient')]//div[@class='details']/span[contains(@data-bind,'mobile_no')]
...    input.patient_gender=//div[contains(@class,'patient')]//div[@class='details']/span[contains(.,'Male') or contains(.,'Female')]
...    input.patient_age=//div[contains(@class,'patient')]//div[@class='details']/span[contains(text(),'years') or contains(text(),'months')]
...    select.location=//div[contains(@class,'location')]//select[contains(@class,'input-xs')]
...    select.case=//div[contains(@class,'case-selector')]//select[contains(@class,'input-xs')]
...    input.treatment_date=//input[contains(@class,'treatment-date')]
...    select.event_class=//select[contains(@class,'event-class')]
...    select.forms_library=//select[contains(@class,'event-type')]
...    button.add_appointment=//button[contains(.,'Add Appointment')]
...    button.add_documents=//button[contains(.,'Add Documents')]
...    button.advance_status=//button[contains(@class,'btn-advance-status')]
...    button.patient_dashboard=//button[contains(@class,'btn-patient-dashboard')]
...    button.debtor_edit=//button[contains(@class,'btn-debtor-edit')]
...    button.account_details=//button[contains(@class,'btn-account-details')]
...    button.invoice=//button[contains(@class,'invoice')]
...    button.clinical=//button[contains(@class,'clinical')]
...    button.receipt=//button[contains(@class,'btn-receipt')]
...    button.sms=//button[contains(@class,'btn-sms')]
...    button.whatsapp=//button[contains(@class,'btn-whatsapp')]
...    button.email=//button[contains(@class,'btn-email')]
...    button.request_payment=//button[contains(@title,'Send a payment request')]
...    button.download_invoice=//button[contains(@onclick,'DownloadInvoice')]
...    button.download_receipt=//button[contains(@onclick,'DownloadReceipt')]
...    button.download_statement=//button[contains(@onclick,'Statement')]
...    button.print_booking_label=//button[contains(.,'Print Booking Label')]
...    button.verify_patient=//button[contains(.,'Verify Patient') or contains(.,'verify_patient')]
...    button.close=.pull-left.btn-close
...    button.switch_status=//button[contains(@class,'btn-switch-status')]
...    button.view_notebook=//span[contains(@class,'btn-view-notebook')]
...    button.complete=//button[contains(@class,'btn-finalize')]
...    button.add_image=//button[contains(.,'Add Image')]
...    button.upload_multiple_files=//button[contains(.,'Upload Multiple Files')]
...    button.add_voice_recording=//button[contains(.,'Add Voice Recording')]
...    input.set_pdf_file=//input[@type='file' and @accept='application/pdf']
...    textarea.quicknote=//textarea[contains(@class,'note')]

&{PATIENT_DETAILS_LOCATORS}
...    label.patient_fullname=//div[contains(@class,'fullname')]/span
...    label.patient_dob=//div[contains(@class,'date-of-birth')]/span
...    label.patient_file_no=//div[contains(@class,'file-no')]/span
...    label.patient_debtor_file_no=//div[contains(@class,'debtor-file-no')]/span
...    label.patient_id_no=//div[contains(@class,'id-no')]/span
...    label.patient_mobile_no=//div[contains(@class,'mobile-no')]/span
...    label.patient_email=//div[contains(@class,'email')]/span
...    label.patient_medical_aid=//div[contains(@class,'medical-aid')]/span
...    img.patient_picture=//div[contains(@class,'picture')]/img

&{DEBTOR_DETAILS_LOCATORS}
...    label.debtor_name=//div[contains(@class,'debtor')]//div[@class='name']/span
...    label.debtor_details=//div[contains(@class,'debtor')]//div[@class='details']/span
...    label.debtor_account_identifier=//span[contains(@data-bind,'debtor().acct_identifier')]
...    label.debtor_file_no=//div[contains(@class,'debtor-filenumber')]/span
...    label.debtor_status=//span[contains(@class,'account-status')]
...    label.debtor_medical_aid=//div[contains(@class,'debtor')]//div[@class='details']/span[contains(@data-bind,'medical_aid')]

&{QUICKNOTE_LOCATORS}
...    header.quicknote=//h3[@class='title']/a[t[text()='Quick Note']]
...    textarea.quicknote=//textarea[contains(@class,'note')]
...    button.add_image=//button[contains(.,'Add Image')]
...    button.upload_multiple_files=//button[contains(.,'Upload Multiple Files')]
...    button.complete=//button[contains(@class,'btn-finalize')]
...    object.quicknote_pdf=//object[contains(@data-bind,'pdf')]
...    img.quicknote_image=//div[contains(@data-bind,'foreach: images')]//img

&{WARNING_ALERT_LOCATORS}
...    alert.warning_timezone=//div[contains(@class,'error') and contains(.,'timezone')]
...    alert.validation_status=//span[contains(@class,'validation-status')]
...    alert.account_status=//span[contains(@class,'account-status')]
...    alert.invoice_status=//span[contains(@class,'invoice-status')]
...    alert.document_status=//span[contains(@class,'document-status')]
...    alert.clinical_status=//span[contains(@class,'clinical-status')]
...    alert.verification_pending=//span[contains(@class,'verification-pending')]
...    alert.verification_done=//span[contains(@class,'verification-done')]

# Standalone locators
${button.close}    .pull-left.btn-close
${button.save}     [type="submit"]
${input.patient_search}    input[placeholder='Search for Entity ...']
${list.entity_suggestions}    ul.entity-dropdown-menu
${item.entity_suggestion}    ul.entity-dropdown-menu li a
${dialog.quicknote}    //div[contains(@class,'ui-dialog-content') and .//h3[@class='title']/a[t[text()='Quick Note']]]
${tab.clinical}    //a[t[text()='Clinical']]
${tab.invoice}     //a[t[text()='Invoice Details']]
${tab.patient_file}    //a[t[text()='Patient File']]
${tab.medical_history} //a[t[text()='Medical History']]
${tab.booking_history} //a[t[text()='Booking History']]
${tab.switch_details} //a[t[text()='Switch Details']]
${tab.periodontal_chart} //a[t[text()='Periodontal Chart']]
${tab.mouth_diagnosis} //a[t[text()='Diagnosis/Observations']]
