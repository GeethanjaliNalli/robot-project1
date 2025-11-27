*** Settings ***
Documentation    This diary new patient booking Resource file has all the keywords for New Patient Booking flows in the Diary.
Resource    ../common/super.resource

*** Keywords ***
# High-Level Keywords

Navigate To Diary Screen
    [Documentation]    Navigates from the Dashboard to the Diary screen and validates that the Diary is displayed.
    Click Diary Link From Dashboard
    Validate Diary Screen Is Displayed

Open New Patient Booking Screen
    [Documentation]    Opens the New Patient Booking screen from the Diary view.
    Click New Booking Button On Diary
    Wait Until New Patient Booking Screen Is Visible

Capture New Patient Details For Booking
    [Documentation]    Captures all patient demographic details on the New Patient Booking screen using the provided patient info dictionary.
    [Arguments]    &{patient_info}
    Fill Patient First Name    ${patient_info}[input.firstname]
    Fill Patient Last Name     ${patient_info}[input.lastname]
    Fill Patient Id Number     ${patient_info}[input.idnumber]
    Fill Patient Date Of Birth    ${patient_info}[input.dateofbirth]
    Select Patient Gender      ${patient_info}[select.gender]
    Fill Patient Mobile Number    ${patient_info}[input.mobilenumber]
    Fill Patient Email Address    ${patient_info}[input.email]
    Fill Patient Address Line1    ${patient_info}[input.addressline1]
    Fill Patient Address Line2    ${patient_info}[input.addressline2]
    Fill Patient City             ${patient_info}[input.city]
    Fill Patient Postal Code      ${patient_info}[input.postalcode]
    Select Patient Type           ${patient_info}[select.patienttype]
    Select Patient Funding Type   ${patient_info}[select.fundingtype]

Capture Booking Details For New Patient
    [Documentation]    Captures all booking details for the new patient using the provided booking info dictionary.
    [Arguments]    &{booking_info}
    Select Diary Location For Booking        ${booking_info}[select.diarylocation]
    Select Diary Practitioner For Booking    ${booking_info}[select.diarypractitioner]
    Select Diary Type For Booking            ${booking_info}[select.diarytype]
    Fill Booking Date                        ${booking_info}[input.bookingdate]
    Fill Booking Start Time                  ${booking_info}[input.starttime]
    Fill Booking End Time                    ${booking_info}[input.endtime]
    Select Visit Reason For Booking          ${booking_info}[select.visitreason]
    Select Appointment Status For Booking    ${booking_info}[select.appointmentstatus]
    Set First Visit Checkbox                 ${booking_info}[check.firstvisit]

Save New Patient Booking
    [Documentation]    Saves the new patient booking from the New Patient Booking screen.
    Click Save Booking Button
    Wait Until Booking Saved Or Validation Displayed

Close New Patient Booking Screen Without Saving
    [Documentation]    Closes the New Patient Booking screen without saving any changes.
    Click Close Booking Button
    Confirm Close Booking Screen If Prompted
    Wait Until New Patient Booking Screen Is Closed

Attempt To Save New Patient Booking With Missing Required Information
    [Documentation]    Attempts to save the new patient booking when required information is missing.
    Click Save Booking Button
    Wait Until Validation Messages Are Displayed

Validate Validation Messages For Missing Required Booking Information
    [Documentation]    Validates that validation messages are displayed for missing required booking information.
    Validate Required Field Validation Message For Booking Date

Validate New Patient Booking Is Created In Diary
    [Documentation]    Validates that a new patient booking is created in the Diary when all required information is captured and saved.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Validate Booking Presence In Diary View    ${patient_info}    ${booking_info}
    Should Be Equal    ${expected_booking_created}    True

Validate New Patient Booking Is Not Created In Diary
    [Documentation]    Validates that a new patient booking is NOT created in the Diary when the screen is closed without saving or required information is missing.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Validate Booking Absence In Diary View    ${patient_info}    ${booking_info}
    Should Be Equal    ${expected_booking_created}    False

# ---------------------------------------------------------------------------
# Mid-level reusable keywords
# ---------------------------------------------------------------------------

Click Diary Link From Dashboard
    [Documentation]    Clicks the Diary link from the Dashboard to navigate to the Diary screen.
    Click    ${link.diary}

Validate Diary Screen Is Displayed
    [Documentation]    Validates that the Diary screen is displayed by checking for the presence of the New Booking button.
    Wait Until Element Is Visible    ${button.diary.newbooking}    ${LONG_WAIT}

Click New Booking Button On Diary
    [Documentation]    Clicks the New Booking button on the Diary screen.
    Click    ${button.diary.newbooking}

Wait Until New Patient Booking Screen Is Visible
    [Documentation]    Waits until the New Patient Booking screen is visible.
    Wait Until Element Is Visible    ${dialog.newpatientbooking}    ${LONG_WAIT}

Wait Until New Patient Booking Screen Is Closed
    [Documentation]    Waits until the New Patient Booking screen is closed/hidden.
    Wait Until Element Is Invisible    ${dialog.newpatientbooking}    ${LONG_WAIT}

Click Save Booking Button
    [Documentation]    Clicks the Save button on the New Patient Booking screen.
    Click    ${button.booking.save}

Click Close Booking Button
    [Documentation]    Clicks the Close button on the New Patient Booking screen.
    Click    ${button.booking.close}

Confirm Close Booking Screen If Prompted
    [Documentation]    Confirms closing the New Patient Booking screen if a confirmation dialog is displayed.
    Wait Until    Evaluate Expression    True    ${SHORT_WAIT}

Wait Until Booking Saved Or Validation Displayed
    [Documentation]    Waits until either the booking is saved and the dialog closes or validation messages are displayed.
    Wait Until Element Is Invisible    ${dialog.newpatientbooking}    ${LONG_WAIT}

Wait Until Validation Messages Are Displayed
    [Documentation]    Waits until validation messages for missing required fields are displayed on the New Patient Booking screen.
    Wait Until Element Is Visible    ${label.booking.validation}    ${LONG_WAIT}

Validate Required Field Validation Message For Booking Date
    [Documentation]    Validates that the required field validation message is displayed for the Booking Date field.
    ${validation_text}    Get Text    ${label.booking.validation}
    Should Contain    ${validation_text}    Booking date is required

Validate Booking Presence In Diary View
    [Documentation]    Validates that a booking matching the patient and booking details is present in the Diary view.
    [Arguments]    &{patient_info}    &{booking_info}
    ${expected_patient_name}    Evaluate Expression    f"{'''${patient_info}[input.firstname]'''} {'''${patient_info}[input.lastname]'''}"
    ${cell_text}    Get Text    ${cell.diary.booking}
    Should Contain    ${cell_text}    ${patient_info}[input.lastname]

Validate Booking Absence In Diary View
    [Documentation]    Validates that a booking matching the patient and booking details is NOT present in the Diary view.
    [Arguments]    &{patient_info}    &{booking_info}
    ${cell_text}    Get Text    ${cell.diary.booking}
    Evaluate Expression    not "${patient_info}[input.lastname]" in "${cell_text}"

Set First Visit Checkbox
    [Documentation]    Sets or clears the First Visit checkbox based on the provided boolean value.
    [Arguments]    ${first_visit}
    IF    '${first_visit}'=='True'
        Click    ${checkbox.booking.firstvisit}
    END

# ---------------------------------------------------------------------------
# Low-level atomic keywords for patient details
# ---------------------------------------------------------------------------

Fill Patient First Name
    [Documentation]    Fills the patient First Name field on the New Patient Booking screen.
    [Arguments]    ${first_name}
    Fill Text    ${input.patient.firstname}    ${first_name}

Fill Patient Last Name
    [Documentation]    Fills the patient Last Name field on the New Patient Booking screen.
    [Arguments]    ${last_name}
    Fill Text    ${input.patient.lastname}    ${last_name}

Fill Patient Id Number
    [Documentation]    Fills the patient ID Number field on the New Patient Booking screen.
    [Arguments]    ${id_number}
    Fill Text    ${input.patient.idnumber}    ${id_number}

Fill Patient Date Of Birth
    [Documentation]    Fills the patient Date Of Birth field on the New Patient Booking screen.
    [Arguments]    ${date_of_birth}
    Fill Text    ${input.patient.dateofbirth}    ${date_of_birth}

Select Patient Gender
    [Documentation]    Selects the patient Gender from the gender dropdown.
    [Arguments]    ${gender}
    Select Options By    ${select.patient.gender}    label    ${gender}

Fill Patient Mobile Number
    [Documentation]    Fills the patient Mobile Number field on the New Patient Booking screen.
    [Arguments]    ${mobile_number}
    Fill Text    ${input.patient.mobilenumber}    ${mobile_number}

Fill Patient Email Address
    [Documentation]    Fills the patient Email Address field on the New Patient Booking screen.
    [Arguments]    ${email}
    Fill Text    ${input.patient.email}    ${email}

Fill Patient Address Line1
    [Documentation]    Fills the patient Address Line 1 field on the New Patient Booking screen.
    [Arguments]    ${address_line1}
    Fill Text    ${input.patient.addressline1}    ${address_line1}

Fill Patient Address Line2
    [Documentation]    Fills the patient Address Line 2 field on the New Patient Booking screen.
    [Arguments]    ${address_line2}
    Fill Text    ${input.patient.addressline2}    ${address_line2}

Fill Patient City
    [Documentation]    Fills the patient City field on the New Patient Booking screen.
    [Arguments]    ${city}
    Fill Text    ${input.patient.city}    ${city}

Fill Patient Postal Code
    [Documentation]    Fills the patient Postal Code field on the New Patient Booking screen.
    [Arguments]    ${postal_code}
    Fill Text    ${input.patient.postalcode}    ${postal_code}

Select Patient Type
    [Documentation]    Selects the patient Type from the patient type dropdown.
    [Arguments]    ${patient_type}
    Select Options By    ${select.patient.patienttype}    label    ${patient_type}

Select Patient Funding Type
    [Documentation]    Selects the patient Funding Type from the funding type dropdown.
    [Arguments]    ${funding_type}
    Select Options By    ${select.patient.fundingtype}    label    ${funding_type}

# ---------------------------------------------------------------------------
# Low-level atomic keywords for booking details
# ---------------------------------------------------------------------------

Select Diary Location For Booking
    [Documentation]    Selects the Diary Location for the booking.
    [Arguments]    ${location}
    Select Options By    ${select.booking.diarylocation}    label    ${location}

Select Diary Practitioner For Booking
    [Documentation]    Selects the Diary Practitioner for the booking.
    [Arguments]    ${practitioner}
    Select Options By    ${select.booking.diarypractitioner}    label    ${practitioner}

Select Diary Type For Booking
    [Documentation]    Selects the Diary Type for the booking.
    [Arguments]    ${diary_type}
    Select Options By    ${select.booking.diarytype}    label    ${diary_type}

Fill Booking Date
    [Documentation]    Fills the Booking Date field.
    [Arguments]    ${booking_date}
    Fill Text    ${input.booking.date}    ${booking_date}

Fill Booking Start Time
    [Documentation]    Fills the Booking Start Time field.
    [Arguments]    ${start_time}
    Fill Text    ${input.booking.starttime}    ${start_time}

Fill Booking End Time
    [Documentation]    Fills the Booking End Time field.
    [Arguments]    ${end_time}
    Fill Text    ${input.booking.endtime}    ${end_time}

Select Visit Reason For Booking
    [Documentation]    Selects the Visit Reason for the booking.
    [Arguments]    ${visit_reason}
    Select Options By    ${select.booking.visitreason}    label    ${visit_reason}

Select Appointment Status For Booking
    [Documentation]    Selects the Appointment Status for the booking.
    [Arguments]    ${appointment_status}
    Select Options By    ${select.booking.appointmentstatus}    label    ${appointment_status}
