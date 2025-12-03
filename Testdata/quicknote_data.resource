*** Settings ***
Documentation    This file contains the test data dictionaries for adding a quick note to a booking (TC00005_Diary_Add Quicknote).
Resource    ../common/super.resource

*** Variables ***
&{NEW_PATIENT_BOOKING}
    ...    patient.first_name=Test
    ...    patient.last_name=User
    ...    patient.dob=1995-05-15
    ...    patient.gender=Other
    ...    booking.type=Consultation
    ...    booking.status=Booked
    ...    booking.time=10:30
    ...    booking.duration=30
    ...    booking.reason=Initial Consultation
    ...    patient.debtor=False

&{QUICKNOTE_DATA}
    ...    quicknote.text=Test@123
    ...    quicknote.image_path=resources/test_images/sample_image.png
    ...    quicknote.pdf_path=resources/test_docs/sample_doc.pdf
    ...    quicknote.auto_complete=True
    ...    quicknote.printout_expected=True
