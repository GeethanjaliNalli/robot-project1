*** Settings ***
Documentation       This file has all type of locators for Booking Page

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${ADD_EDIT_BOOKING_MODAL}    xpath=//div[@id='addEditBookingModal']
${BOOKING_SAVE_BUTTON}       xpath=//button[@id='saveBooking']
${BOOKING_CLOSE_BUTTON}      xpath=//button[@id='closeBooking']
${BOOKING_REQUIRED_FIELD1}   xpath=//input[@id='bookingField1']
${BOOKING_REQUIRED_FIELD2}   xpath=//input[@id='bookingField2']
