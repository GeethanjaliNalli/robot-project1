*** Settings ***
Documentation    Keywords for Diary - New Patient Booking (TC00002_Diary_NPB)
Resource         ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensure user is logged in and on the diary screen (precondition)
    # Reuse existing login keyword if available, else implement login and navigation
    Login To Application
    Go To Diary Screen

Open New Patient Booking Form
    [Documentation]    Open the new patient booking form from the diary screen
    Click Element    ${DIARY_NPB_LOCATOR_1}

Fill New Patient Booking Required Fields
    [Documentation]    Fill in all required fields for new patient booking
    Input Text    ${DIARY_NPB_LOCATOR_2}    ${PATIENT_NAME}
    Input Text    ${DIARY_NPB_LOCATOR_3}    ${PATIENT_DOB}
    Input Text    ${DIARY_NPB_LOCATOR_4}    ${PATIENT_CONTACT}
    # Add more fields as per actual UI and locators

Save New Patient Booking
    [Documentation]    Save the new patient booking
    Click Button    ${DIARY_NPB_LOCATOR_5}

Verify Booking Is Created
    [Documentation]    Verify that a booking is made if required information was filled in and saved
    # Implement verification logic, e.g., check for booking confirmation or entry in diary
    Booking Should Exist In Diary

Verify No Booking On Incomplete Or Closed Form
    [Documentation]    Verify that no booking is made if form is closed or required fields are missing
    # Implement negative check logic
    Booking Should Not Exist In Diary
