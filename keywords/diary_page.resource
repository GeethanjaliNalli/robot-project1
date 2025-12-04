*** Settings ***
Documentation    This diary page Resource file has all the diary and booking keywords for New Patient Booking scenarios.
Resource    ../common/super.resource

*** Keywords ***
Open Diary Screen
    [Documentation]    Navigates to the Diary screen from the dashboard.
    Click    ${link.diary}
    Wait Until Element Is Visible    ${label.diaryScreen}    timeout=${LONG_WAIT}

Click New Booking Button
    [Documentation]    Clicks the New Booking button on the Diary screen.
    [Arguments]    ${new_booking_button_locator}
    Click    ${new_booking_button_locator}
    Wait Until Element Is Visible    ${label.addeditbooking}    timeout=${LONG_WAIT}

Fill Patient Details
    [Documentation]    Fills in patient details in the booking form.
    [Arguments]    ${first_name_field}    ${first_name}    ${last_name_field}    ${last_name}    ${dob_field}    ${dob}    ${gender_dropdown}    ${gender}    ${phone_field}    ${phone}    ${email_field}    ${email}    ${address_field}    ${address}
    Fill Text    ${first_name_field}    ${first_name}
    Fill Text    ${last_name_field}    ${last_name}
    Fill Text    ${dob_field}    ${dob}
    Select Options By    ${gender_dropdown}    label    ${gender}
    Fill Text    ${phone_field}    ${phone}
    Fill Text    ${email_field}    ${email}
    Fill Text    ${address_field}    ${address}

Select Booking Date And Time
    [Documentation]    Selects booking date and time in the booking form.
    [Arguments]    ${date_field}    ${date}    ${time_field}    ${time}
    Fill Text    ${date_field}    ${date}
    Fill Text    ${time_field}    ${time}

Select Booking Type
    [Documentation]    Selects the booking type from dropdown.
    [Arguments]    ${booking_type_dropdown}    ${booking_type}
    Select Options By    ${booking_type_dropdown}    label    ${booking_type}

Select Doctor
    [Documentation]    Selects the doctor from dropdown.
    [Arguments]    ${doctor_dropdown}    ${doctor}
    Select Options By    ${doctor_dropdown}    label    ${doctor}

Enter Reason For Visit
    [Documentation]    Enters the reason for visit in the booking form.
    [Arguments]    ${reason_field}    ${reason}
    Fill Text    ${reason_field}    ${reason}

Enter Insurance Details
    [Documentation]    Selects insurance provider and enters policy number.
    [Arguments]    ${insurance_provider_dropdown}    ${insurance_provider}    ${policy_number_field}    ${policy_number}
    Select Options By    ${insurance_provider_dropdown}    label    ${insurance_provider}
    Fill Text    ${policy_number_field}    ${policy_number}

Enter Emergency Contact Details
    [Documentation]    Enters emergency contact name and phone number.
    [Arguments]    ${emergency_contact_field}    ${emergency_contact}    ${emergency_contact_phone_field}    ${emergency_contact_phone}
    Fill Text    ${emergency_contact_field}    ${emergency_contact}
    Fill Text    ${emergency_contact_phone_field}    ${emergency_contact_phone}

Add Booking Notes
    [Documentation]    Adds notes to the booking.
    [Arguments]    ${notes_field}    ${notes}
    Fill Text    ${notes_field}    ${notes}

Save Booking
    [Documentation]    Saves the booking form.
    [Arguments]    ${save_button_locator}
    Click    ${save_button_locator}
    Wait Until Element Is Invisible    ${label.addeditbooking}    timeout=${LONG_WAIT}

Validate Booking Created
    [Documentation]    Validates that the booking was created successfully.
    [Arguments]    ${success_message_locator}
    Wait Until Element Is Visible    ${success_message_locator}    timeout=${LONG_WAIT}
    ${actual_message}=    Get Text    ${success_message_locator}
    Should Contain    ${actual_message}    Booking created successfully
