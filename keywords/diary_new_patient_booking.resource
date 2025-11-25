*** Settings ***
Documentation    Keywords for creating a new patient booking from the diary screen.
Resource    ../common/super.resource
Resource    ../objectrepository/diary_new_patient_booking_page.resource

*** Keywords ***

Open New Patient Booking Form
    [Documentation]    Opens the new patient booking form from the diary screen.
    Click    ${DIARY_NPB_PAGE_LOCATORS.button.save}
    Wait Until Element Is Visible    ${DIARY_NPB_PAGE_LOCATORS.input.patient.firstname}    timeout=5s

Enter New Patient Booking Details
    [Documentation]    Enters required details for a new patient booking.
    [Arguments]    &{booking_details}
    Fill Text    ${DIARY_NPB_PAGE_LOCATORS.input.patient.firstname}    ${booking_details.firstname}
    Fill Text    ${DIARY_NPB_PAGE_LOCATORS.input.patient.lastname}    ${booking_details.lastname}
    Fill Text    ${DIARY_NPB_PAGE_LOCATORS.input.patient.dob}    ${booking_details.dob}

Save New Patient Booking
    [Documentation]    Saves the new patient booking form.
    Click    ${DIARY_NPB_PAGE_LOCATORS.button.save}
    Wait Until Element Is Not Visible    ${DIARY_NPB_PAGE_LOCATORS.button.save}    timeout=10s

Close New Patient Booking Form
    [Documentation]    Closes the new patient booking form without saving.
    Click    ${DIARY_NPB_PAGE_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${DIARY_NPB_PAGE_LOCATORS.button.close}    timeout=5s

Validate Booking Is Created
    [Documentation]    Validates that a booking is created when required information is filled and saved.
    # Implementation would check for booking confirmation or booking entry in the diary
    # Placeholder for actual validation logic, as no locator or confirmation message is provided
    # Wait Until Page Contains Element    <booking confirmation locator>    timeout=10s

Validate Booking Is Not Created
    [Documentation]    Validates that no booking is created if form is closed or required fields are missing.
    # Implementation would check that no new booking entry appears in the diary
    # Placeholder for actual validation logic, as no locator or confirmation message is provided
    # Wait Until Page Does Not Contain Element    <booking confirmation locator>    timeout=5s
