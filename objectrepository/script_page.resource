*** Settings ***
Documentation       This file contains Script (Prescription) Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{PATIENT_DETAILS_LOCATORS}
...    input.patient.surname=//label[t[text()='Patient Surname']]/following-sibling::input
...    input.patient.name=//label[t[text()='Patient Name']]/following-sibling::input
...    input.patient.dob=//label[t[text()='Date of Birth']]/following-sibling::input
...    select.patient.gender=//label[t[text()='Gender']]/following-sibling::select
...    input.patient.id=//label[t[text()='ID Number']]/following-sibling::input

&{PRESCRIPTION_DETAILS_LOCATORS}
...    input.prescription.date=[name="prescriptionDate"]
...    input.prescription.number=[name="prescriptionNumber"]
...    select.prescription.type=[name="prescriptionType"]
...    textarea.prescription.notes=[name="prescriptionNotes"]
...    label.prescription.status=//label[t[text()='Status']]

&{MEDICATION_DETAILS_LOCATORS}
...    input.medication.name=//label[t[text()='Medication Name']]/following-sibling::input
...    input.medication.strength=//label[t[text()='Strength']]/following-sibling::input
...    input.medication.dosage=//label[t[text()='Dosage']]/following-sibling::input
...    input.medication.frequency=//label[t[text()='Frequency']]/following-sibling::input
...    input.medication.duration=//label[t[text()='Duration']]/following-sibling::input
...    textarea.medication.directions=//label[t[text()='Directions']]/following-sibling::textarea
...    button.add.medication=.btn-add-medication
...    table.medication.list=.medication-list-table
...    table.medication.row=.medication-list-table tbody tr
...    button.delete.medication.row=.medication-list-table tbody tr .btn-delete

&{SIGNATURE_LOCATORS}
...    label.signature=//label[t[text()='Practitioner Signature']]
...    img.signature=.practitioner-signature-img
...    button.add.signature=.btn-add-signature
...    dialog.signature=.signature-dialog
...    button.signature.save=.signature-dialog .btn-save
...    button.signature.cancel=.signature-dialog .btn-cancel

&{SCRIPT_ACTIONS_LOCATORS}
...    button.save.script=[type="submit"]
...    button.complete.script=.btn-complete-script
...    button.sign.script=.btn-sign-script
...    button.email.script=.btn-email-script
...    button.print.script=.btn-print-script
...    dialog.confirm.complete=.dialog-complete-confirm
...    button.confirm.complete.yes=.dialog-complete-confirm .btn-yes
...    button.confirm.complete.no=.dialog-complete-confirm .btn-no
...    icon.qrcode.output=.script-output .qrcode

${tab.prescription}    //a[span[text()='Prescription']]
${tab.medication}      //a[span[text()='Medication']]
${tab.signature}      //a[span[text()='Signature']]
${dialog.email}       .email-dialog
${input.email.to}     .email-dialog [name="to"]
${button.email.send}  .email-dialog .btn-send
${button.email.cancel}  .email-dialog .btn-cancel
${alert.success}      .alert-success
${alert.error}        .alert-danger
