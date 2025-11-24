*** Variables ***
# Locators for New Patient Booking Form actions
${BOOKING_FORM_LOCATORS}    Create Dictionary    input.patient_name=//input[@id='patientName']    input.dob=//input[@id='dob']    select.gender=//select[@id='gender']    input.contact_number=//input[@id='contactNumber']    button.save=//button[@id='saveBooking']