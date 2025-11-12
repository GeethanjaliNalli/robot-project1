*** Settings ***
Documentation     TC00002_Diary_NPB: Verify that a new patient booking can be created in the diary and is reflected with the Black "A" icon at the selected time slot.
Resource          ../../common/super.resource

*** Test Cases ***
New Patient Booking Should Be Created
    [Documentation]    Create a new patient booking in the diary and verify booking is reflected with Black "A" icon.
    [Tags]    Diary    NewPatientBooking    Functional    Medium    TC00002_Diary_NPB
    # Assumes user is already logged in and on the diary screen (see preconditions)
    # If login is required, use existing login keywords from common keywords or login_page.resource
    # Example data (replace with actual test data or parameterize as needed)
    ${PATIENT_NAME}=    Set Variable    John Doe
    ${TIME}=            Set Variable    10:00
    New Patient Booking Should Be Created    ${PATIENT_NAME}    ${TIME}
