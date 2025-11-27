*** Settings ***
Documentation    This resource file contains all keywords for Diary - New Patient Booking functionality.
Resource    ../common/super.resource

*** Keywords ***
Go To Diary Page
    [Documentation]    Navigates to the Diary page from the dashboard.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.new_patient_booking}    ${LONG_WAIT}

Start New Patient Booking
    [Documentation]    Initiates a new patient booking by clicking the New Patient Booking button.
    Wait Until Element Is Visible    ${button.new_patient_booking}    ${LONG_WAIT}
    Click    ${button.new_patient_booking}
    Wait Until Element Is Visible    ${form.new_patient_booking}    ${LONG_WAIT}

Fill New Patient Booking Form
    [Documentation]    Fills the new patient booking form with the provided patient data dictionary.
    [Arguments]    &{PATIENT_DATA}
    Fill Patient First Name    ${PATIENT_DATA}[input.patient_first_name]
    Fill Patient Last Name    ${PATIENT_DATA}[input.patient_last_name]
    Fill Patient Date Of Birth    ${PATIENT_DATA}[input.date_of_birth]
    Select Patient Gender    ${PATIENT_DATA}[select.gender]
    Fill Patient Contact Number    ${PATIENT_DATA}[input.contact_number]
    Fill Patient Email    ${PATIENT_DATA}[input.email]
    Select Booking Type    ${PATIENT_DATA}[select.type]
    Select Booking Status    ${PATIENT_DATA}[select.status]
    Fill Booking Time    ${PATIENT_DATA}[input.time]
    Fill Booking Duration    ${PATIENT_DATA}[input.duration]
    Fill Booking Reason    ${PATIENT_DATA}[input.reason]

Save Booking
    [Documentation]    Saves the new patient booking.
    Wait Until Element Is Visible    ${button.save_booking}    ${LONG_WAIT}
    Click    ${button.save_booking}
    Wait Until Element Is Invisible    ${form.new_patient_booking}    ${LONG_WAIT}

Attempt To Save Booking With Missing Fields
    [Documentation]    Attempts to save the booking when required fields are missing.
    Wait Until Element Is Visible    ${button.save_booking}    ${LONG_WAIT}
    Click    ${button.save_booking}
    Wait Until Element Is Visible    ${label.error_message}    ${LONG_WAIT}

Cancel Booking
    [Documentation]    Cancels the new patient booking by clicking the cancel button.
    Wait Until Element Is Visible    ${button.cancel_booking}    ${LONG_WAIT}
    Click    ${button.cancel_booking}
    Wait Until Element Is Invisible    ${form.new_patient_booking}    ${LONG_WAIT}

Validate Booking Is Created
    [Documentation]    Validates that the booking is created and visible in the diary list.
    [Arguments]    &{PATIENT_DATA}
    Wait Until Booking Appears In Diary List    ${PATIENT_DATA}[input.patient_first_name]    ${PATIENT_DATA}[input.patient_last_name]    ${PATIENT_DATA}[input.time]

Validate Booking Is Not Created
    [Documentation]    Validates that the booking is NOT created and does not appear in the diary list.
    [Arguments]    &{PATIENT_DATA}
    Wait Until Booking Does Not Appear In Diary List    ${PATIENT_DATA}[input.patient_first_name]    ${PATIENT_DATA}[input.patient_last_name]    ${PATIENT_DATA}[input.time]

# MID-LEVEL KEYWORDS
Fill Patient First Name
    [Documentation]    Fills the patient first name field.
    [Arguments]    ${first_name}
    Wait Until Element Is Visible    ${input.patient_first_name}    ${LONG_WAIT}
    Fill Text    ${input.patient_first_name}    ${first_name}

Fill Patient Last Name
    [Documentation]    Fills the patient last name field.
    [Arguments]    ${last_name}
    Wait Until Element Is Visible    ${input.patient_last_name}    ${LONG_WAIT}
    Fill Text    ${input.patient_last_name}    ${last_name}

Fill Patient Date Of Birth
    [Documentation]    Fills the patient date of birth field.
    [Arguments]    ${dob}
    Wait Until Element Is Visible    ${input.date_of_birth}    ${LONG_WAIT}
    Fill Text    ${input.date_of_birth}    ${dob}

Select Patient Gender
    [Documentation]    Selects the patient gender from dropdown.
    [Arguments]    ${gender}
    Wait Until Element Is Visible    ${select.gender}    ${LONG_WAIT}
    Select Options By    ${select.gender}    label    ${gender}

Fill Patient Contact Number
    [Documentation]    Fills the patient contact number field.
    [Arguments]    ${contact_number}
    Wait Until Element Is Visible    ${input.contact_number}    ${LONG_WAIT}
    Fill Text    ${input.contact_number}    ${contact_number}

Fill Patient Email
    [Documentation]    Fills the patient email field.
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${input.email}    ${LONG_WAIT}
    Fill Text    ${input.email}    ${email}

Select Booking Type
    [Documentation]    Selects the booking type from dropdown.
    [Arguments]    ${type}
    Wait Until Element Is Visible    ${select.type}    ${LONG_WAIT}
    Select Options By    ${select.type}    label    ${type}

Select Booking Status
    [Documentation]    Selects the booking status from dropdown.
    [Arguments]    ${status}
    Wait Until Element Is Visible    ${select.status}    ${LONG_WAIT}
    Select Options By    ${select.status}    label    ${status}

Fill Booking Time
    [Documentation]    Fills the booking time field.
    [Arguments]    ${time}
    Wait Until Element Is Visible    ${input.time}    ${LONG_WAIT}
    Fill Text    ${input.time}    ${time}

Fill Booking Duration
    [Documentation]    Fills the booking duration field.
    [Arguments]    ${duration}
    Wait Until Element Is Visible    ${input.duration}    ${LONG_WAIT}
    Fill Text    ${input.duration}    ${duration}

Fill Booking Reason
    [Documentation]    Fills the booking reason field.
    [Arguments]    ${reason}
    Wait Until Element Is Visible    ${input.reason}    ${LONG_WAIT}
    Fill Text    ${input.reason}    ${reason}

Wait Until Booking Appears In Diary List
    [Documentation]    Waits until the booking with given patient name and time appears in the diary list.
    [Arguments]    ${first_name}    ${last_name}    ${time}
    ${booking_locator}=    Set Variable    //tr[td[contains(text(),'${first_name}') and contains(text(),'${last_name}')] and td[contains(text(),'${time}')]]
    Wait Until Element Is Visible    ${booking_locator}    ${LONG_WAIT}

Wait Until Booking Does Not Appear In Diary List
    [Documentation]    Waits until the booking with given patient name and time does NOT appear in the diary list.
    [Arguments]    ${first_name}    ${last_name}    ${time}
    ${booking_locator}=    Set Variable    //tr[td[contains(text(),'${first_name}') and contains(text(),'${last_name}')] and td[contains(text(),'${time}')]]
    Wait Until Element Is Not Visible    ${booking_locator}    ${LONG_WAIT}
