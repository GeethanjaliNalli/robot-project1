*** Settings ***
Documentation    This file contains test cases for adding a quick note to a booking in the diary module, including validations for auto-complete and printout rendering with attachments.
Resource    ../../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01_Adding_A_Quicknote_To_Booking
    [Documentation]    Verifies that a user can add a quick note to a booking for a new patient (not in debtor list), attach image and PDF, and that the note is auto-completed and printout renders with all attachments.
    Create New Booking For New Patient    &{NEW_PATIENT_BOOKING}
    Open Booking Quicknote Section
    Add Quicknote With Attachments    &{QUICKNOTE_DATA}
    Validate Quicknote Auto Completed    &{QUICKNOTE_DATA}
    Validate Quicknote Printout Rendered    &{QUICKNOTE_DATA}
