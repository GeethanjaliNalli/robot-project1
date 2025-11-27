*** Settings ***
Documentation    This resource file contains all keywords for Diary New Patient Booking functionality, including booking creation, validation, and negative scenarios.
Resource    ../common/super.resource

*** Keywords ***
Open Diary Screen
    [Documentation]    Navigates to the Diary screen from the dashboard.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.new_patient_booking}    ${LONG_WAIT}

Start New Patient Booking
    [Documentation]    Initiates the new patient booking process by clicking the New Patient Booking button.
    Wait Until Element Is Visible    ${button.new_patient_booking}    ${LONG_WAIT}
    Click    ${button.new_patient_booking}
    Wait Until Element Is Visible    ${textbox.patient_first_name}    ${LONG_WAIT}

Fill New Patient Booking Details
    [Documentation]    Fills in all patient booking details using the provided booking data dictionary.
    [Arguments]    ${booking_data}
    Fill Patient Name Fields    ${booking_data}
    Fill Patient Demographics Fields    ${booking_data}
    Fill Appointment Details Fields    ${booking_data}
    Fill Additional Booking Notes    ${booking_data}

Fill Patient Name Fields
    [Documentation]    Fills in patient first and last name fields.
    [Arguments]    ${booking_data}
    Fill Text    ${textbox.patient_first_name}    ${booking_data['patient_first_name']}
    Fill Text    ${textbox.patient_last_name}    ${booking_data['patient_last_name']}

Fill Patient Demographics Fields
    [Documentation]    Fills in patient demographics fields (DOB, gender, contact, email).
    [Arguments]    ${booking_data}
    Fill Text    ${textbox.dob}    ${booking_data['dob']}
    Select Options By    ${dropdown.gender}    label=${booking_data['gender']}
    Fill Text    ${textbox.contact_number}    ${booking_data['contact_number']}
    Fill Text    ${textbox.email}    ${booking_data['email']}

Fill Appointment Details Fields
    [Documentation]    Fills in appointment date, time, type, reason, and doctor.
    [Arguments]    ${booking_data}
    Fill Text    ${textbox.appointment_date}    ${booking_data['appointment_date']}
    Fill Text    ${textbox.appointment_time}    ${booking_data['appointment_time']}
    Select Options By    ${dropdown.appointment_type}    label=${booking_data['appointment_type']}
    Fill Text    ${textbox.reason}    ${booking_data['reason']}
    Select Options By    ${dropdown.doctor}    label=${booking_data['doctor']}

Fill Additional Booking Notes
    [Documentation]    Fills in the notes field for the booking if provided.
    [Arguments]    ${booking_data}
    Fill Text    ${textbox.notes}    ${booking_data['notes']}

Save Patient Booking
    [Documentation]    Saves the new patient booking by clicking the Save button.
    Wait Until Element Is Visible    ${button.save_booking}    ${LONG_WAIT}
    Click    ${button.save_booking}
    Wait Until Element Is Invisible    ${dialog.booking_form}    ${LONG_WAIT}

Attempt To Save Patient Booking With Missing Fields
    [Documentation]    Attempts to save the booking when required fields are missing, expects validation error.
    Wait Until Element Is Visible    ${button.save_booking}    ${LONG_WAIT}
    Click    ${button.save_booking}
    Wait Until Element Is Visible    ${label.error_message}    ${LONG_WAIT}

Close Booking Screen Without Saving
    [Documentation]    Closes the booking screen without saving the booking.
    Wait Until Element Is Visible    ${button.close_booking_form}    ${LONG_WAIT}
    Click    ${button.close_booking_form}
    Wait Until Element Is Invisible    ${dialog.booking_form}    ${LONG_WAIT}

Validate Booking Is Made
    [Documentation]    Validates that a booking matching the provided data is present in the diary list.
    [Arguments]    ${booking_data}
    Search For Booking In Diary    ${booking_data}
    Should Contain Booking Entry    ${booking_data}

Validate Booking Is Not Made
    [Documentation]    Validates that no booking matching the provided data is present in the diary list.
    [Arguments]    ${booking_data}
    Search For Booking In Diary    ${booking_data}
    Should Not Contain Booking Entry    ${booking_data}

Search For Booking In Diary
    [Documentation]    Searches for a booking entry in the diary list using patient name and appointment date.
    [Arguments]    ${booking_data}
    Wait Until Element Is Visible    ${textbox.search_patient}    ${LONG_WAIT}
    Fill Text    ${textbox.search_patient}    ${booking_data['patient_first_name']} ${booking_data['patient_last_name']}
    Fill Text    ${textbox.search_date}    ${booking_data['appointment_date']}
    Click    ${button.search_booking}
    Wait Until Element Is Visible    ${table.diary_results}    ${LONG_WAIT}

Should Contain Booking Entry
    [Documentation]    Asserts that the booking entry is present in the diary results table.
    [Arguments]    ${booking_data}
    ${row_text}=    Get Text    ${table.diary_results_row}
    Should Contain    ${row_text}    ${booking_data['patient_first_name']}
    Should Contain    ${row_text}    ${booking_data['patient_last_name']}
    Should Contain    ${row_text}    ${booking_data['appointment_date']}
    Should Contain    ${row_text}    ${booking_data['appointment_time']}

Should Not Contain Booking Entry
    [Documentation]    Asserts that the booking entry is NOT present in the diary results table.
    [Arguments]    ${booking_data}
    ${row_text}=    Get Text    ${table.diary_results_row}
    Should Not Contain    ${row_text}    ${booking_data['patient_first_name']}
    Should Not Contain    ${row_text}    ${booking_data['patient_last_name']}
    Should Not Contain    ${row_text}    ${booking_data['appointment_date']}
    Should Not Contain    ${row_text}    ${booking_data['appointment_time']}
