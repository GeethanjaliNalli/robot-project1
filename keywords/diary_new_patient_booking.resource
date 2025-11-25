*** Settings ***
Documentation    Keywords for creating a new patient booking from the Diary page.
Resource    ../common/super.resource
Resource    ../objectrepository/diary_new_patient_booking_page.resource

*** Keywords ***

Open New Patient Booking Form
    [Documentation]    Opens the New Patient Booking form from the Diary page.
    Click    ${button.save}
    Wait Until Element Is Visible    ${input.patient.firstname}    timeout=5s

Enter New Patient Details
    [Documentation]    Enters patient details in the New Patient Booking form.
    [Arguments]    &{patient_data}
    Fill Text    ${input.patient.firstname}    ${patient_data.firstname}
    Fill Text    ${input.patient.lastname}    ${patient_data.lastname}
    Fill Text    ${input.patient.dob}    ${patient_data.dob}
    Select From List By Label    ${select.booking.type}    ${patient_data.booking_type}

Save New Patient Booking
    [Documentation]    Saves the New Patient Booking form.
    Click    ${button.save}
    Wait Until Element Is Visible    ${label.success}    timeout=10s

Validate Booking Success Message
    [Documentation]    Validates that the booking success message is displayed after saving.
    Element Should Be Visible    ${label.success}
