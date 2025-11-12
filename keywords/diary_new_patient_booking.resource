*** Settings ***
Documentation    Keywords for Diary - New Patient Booking functionality. Handles booking creation, validation, and post-condition checks.
Resource         ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensure the user is logged in and on the diary screen (Precondition).
    # Reuse existing login keyword from common_keywords.resource if available
    User Is Logged In
    Wait Until Element Is Visible    ${element}    timeout=10s

Select Diary Time Slot For New Booking
    [Documentation]    Select the desired time slot in the diary for new patient booking.
    Click Element    ${element}
    Wait Until Element Is Visible    ${element}    timeout=5s

Fill New Patient Booking Details
    [Documentation]    Fill all required details for new patient booking using available locators.
    Input Text    ${element}    John Doe
    Input Text    ${element}    01/01/1990
    Input Text    ${element}    1234567890
    Input Text    ${element}    john.doe@example.com
    # Add more Input Text/Select From List keywords as per actual form fields and locators

Save New Patient Booking
    [Documentation]    Save the new patient booking after filling required information.
    Click Element    ${element}
    Wait Until Element Is Not Visible    ${element}    timeout=10s

Verify New Booking Is Reflected On Diary
    [Documentation]    Verify that the new booking is visible on the selected diary and time slot with the Black "A"-icon.
    Element Should Be Visible    ${element}
    # Optionally, verify the icon if a locator is available

Booking Should Be Made If Required Information Is Filled And Saved
    [Documentation]    Post-condition: Booking should exist if all required information was filled and saved.
    Run Keyword    Verify New Booking Is Reflected On Diary

No Booking Should Be Made If Screen Closed Or Required Fields Not Filled
    [Documentation]    Post-condition: No booking should exist if screen is closed or required fields are missing.
    # Simulate closing or incomplete form, then verify no booking
    Element Should Not Be Visible    ${element}
