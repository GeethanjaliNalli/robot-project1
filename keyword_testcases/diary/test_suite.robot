*** Settings ***
Documentation    This file contains test cases for adding a quicknote to a booking in the Diary module.
Resource    ../../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Add Quicknote To Booking
    [Documentation]    Validates that a user can add a quicknote (with image) to a diary booking for a new patient not in the debtor list.
    Create New Booking For New Patient    ${QUICKNOTE_BOOKING}
    Open Booking Quicknote Section    ${QUICKNOTE_BOOKING}
    Add Quicknote With Image    ${QUICKNOTE_BOOKING}[quicknote.text]    ${QUICKNOTE_BOOKING}[quicknote.image_path]
    Validate Quicknote Image Is Displayed    ${QUICKNOTE_BOOKING}[quicknote.image_path]
