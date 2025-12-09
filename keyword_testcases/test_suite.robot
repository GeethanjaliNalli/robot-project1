*** Settings ***
Documentation    Test suite for login and diary new patient booking scenarios.
Resource         ../common/super.resource
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
    [Documentation]    Diary_ New patient booking
    # Step 1-2: User should be logged in on the diary screen. Open Diary module.
    Open Diary Module
    # Step 3: Click on 'Create New Booking' button.
    Click Create New Booking Button    ${button.new_booking}
    # Step 4-5: Select booking type as 'New Patient' and status as 'Confirmed'.
    Select Booking Type And Status    ${select.booking_type}    ${select.booking_status}
    # Step 6-7: Enter date and time for the booking.
    Enter Booking Date And Time    ${select.date}    ${select.time}
    # Step 8: Enter duration for the booking.
    Enter Booking Duration    ${input.duration}
    # Step 9: Enter reason for the booking.
    Enter Booking Reason    ${input.reason}
    # Step 10-11: Enter patient name and surname.
    Enter Patient Name And Surname    ${input.name}    ${input.surname}
    # Step 12: Enter patient cellphone number.
    Enter Patient Cellphone    ${input.cellphone}
    # Step 13-14: Select ID type and enter ID number.
    Enter Patient ID Type And Number    ${select.id_type}    ${input.id_number}
    # Step 15: Save the booking.
    Save New Patient Booking
    # Step 16: Validate booking is created successfully.
    Validate Booking Created Successfully

TC00002_Diary_NPB_Negative - New patient booking with missing required fields
    [Documentation]    Diary_ New patient booking - Negative scenario: missing required fields
    # Step 1-2: User should be logged in on the diary screen. Open Diary module.
    Open Diary Module
    # Step 3: Click on 'Create New Booking' button.
    Click Create New Booking Button    ${button.new_booking}
    # Step 4-5: Select booking type as 'New Patient' and status as 'Confirmed'.
    Select Booking Type And Status    ${select.booking_type}    ${select.booking_status}
    # Step 6-7: Enter date and time for the booking.
    Enter Booking Date And Time    ${select.date}    ${select.time}
    # Step 8: Enter duration for the booking.
    Enter Booking Duration    ${input.duration}
    # Step 9: Enter reason for the booking.
    Enter Booking Reason    ${input.reason}
    # Step 10-11: Enter patient name and leave surname blank (required field missing).
    Enter Patient Name And Surname    ${input.name}    ${input.surname}
    # Step 12: Enter patient cellphone number.
    Enter Patient Cellphone    ${input.cellphone}
    # Step 13-14: Select ID type and enter ID number.
    Enter Patient ID Type And Number    ${select.id_type}    ${input.id_number}
    # Step 15: Attempt to save the booking.
    Save New Patient Booking
    # Step 16: Validate booking is NOT created due to missing required fields.
    Validate Booking Not Created Due To Missing Fields
