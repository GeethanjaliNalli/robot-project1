*** Settings ***
Documentation    Test suite for login and new patient booking scenarios.
Resource         ../common/super.resource
Resource         ../Testdata/booking_data.resource
Test Setup       Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Handle Attention Alert    dismiss
    Validate Dashboard Is Displayed
    Logout From The Application
    Handle Attention Alert    dismiss
    Logout From The Application
    Handle Attention Alert    accept

TC00002_Diary_NPB - New patient booking
    [Documentation]    Diary_ New patient booking. A booking should be made if required information was filled in and saved. If the user closes the screen or not all required fields are filled in, NO booking should be made.
    # Step 1-2: Navigate to Diary and open New Booking dialog
    Open Diary And Open New Booking Dialog
    # Step 3-4: Select booking type and status
    Select Booking Type And Status    ${BOOKING_DATA.select.booking_type}    ${BOOKING_DATA.select.booking_status}
    # Step 5-6: Enter booking date, time, and duration
    Enter Booking Date Time And Duration    ${BOOKING_DATA.input.booking_date}    ${BOOKING_DATA.input.booking_time}    ${BOOKING_DATA.input.booking_duration}
    # Step 7: Enter reason for appointment
    Enter Reason For Appointment    ${BOOKING_DATA.textarea.reason_for_appointment}
    # Step 8-9: Enter patient name and surname
    Enter Patient Name And Surname    ${BOOKING_DATA.input.patient_name}    ${BOOKING_DATA.input.patient_surname}
    # Step 10: Enter patient cellphone
    Enter Patient Cellphone    ${BOOKING_DATA.input.patient_cellphone}
    # Step 11-12: Select ID type and enter ID number
    Select ID Type And Enter ID Number    ${BOOKING_DATA.select.id_type}    ${BOOKING_DATA.input.id_number}
    # Step 13-14: Select medical aid option and enter number
    Select Medical Aid Option And Enter Number    ${BOOKING_DATA.select.medical_aid_option}    ${BOOKING_DATA.input.medical_aid_number}
    # Step 15: Select gender
    Select Patient Gender    ${BOOKING_DATA.select.gender}
    # Step 16: Enter initials
    Enter Patient Initials    ${BOOKING_DATA.input.initials}
    # Step 17: Select title
    Select Patient Title    ${BOOKING_DATA.select.title}
    # Step 18: Save the booking
    Save New Patient Booking
    # Step 19: Validate booking is created
    Validate Booking Created Successfully
