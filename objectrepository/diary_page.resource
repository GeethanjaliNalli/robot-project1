*** Variables ***
# Locators for Diary (New Patient Booking)
${DIARY_NEW_BOOKING_BUTTON}    xpath=//button[@id='new-booking']
${DIARY_PATIENT_NAME_FIELD}    xpath=//input[@id='patient-name']
${DIARY_TIME_SLOT}             xpath=//div[contains(@class,'time-slot') and @data-time='${TIME}']
${DIARY_SAVE_BUTTON}           xpath=//button[@id='save-booking']
${DIARY_BOOKING_ICON}          xpath=//span[contains(@class,'booking-icon') and contains(@class,'icon-a')]
