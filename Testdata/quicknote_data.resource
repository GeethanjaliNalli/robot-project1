*** Settings ***
Documentation    This file contains the test data dictionary for Adding a Quicknote to a booking (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{QUICKNOTE_BOOKING}
    ...    booking.type=Consultation
    ...    booking.status=Booked
    ...    patient.type=New
    ...    patient.in_debtor_list=False
    ...    booking.time=09:15
    ...    booking.duration=15
    ...    booking.reason=Add quick note test
    ...    quicknote.text=Follow up required
    ...    quicknote.image_path=resources/images/sample-quicknote-image.png
