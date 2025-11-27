*** Settings ***
Documentation    This file contains the dictionaries for new patient booking data used in the test cases for TC00002_Diary_NPB.
Resource    ../common/super.resource

*** Variables ***
&{NEW_PATIENT_BOOKING_VALID}
...    input.patient_first_name=John
...    input.patient_last_name=Doe
...    input.date_of_birth=1990-01-01
...    input.gender=Male
...    input.contact_number=9876543210
...    select.booking_type=New Patient
...    select.status=Booked
...    input.time=10:30
...    input.duration=30
...    input.reason=Initial Consultation

&{NEW_PATIENT_BOOKING_MISSING_REQUIRED}
...    input.patient_first_name=Jane
...    input.patient_last_name=   # Missing required field: last name
...    input.date_of_birth=1985-05-15
...    input.gender=Female
...    input.contact_number=1234567890
...    select.booking_type=New Patient
...    select.status=Booked
...    input.time=11:00
...    input.duration=30
...    input.reason=General Checkup

&{NEW_PATIENT_BOOKING_SCREEN_CLOSED}
...    input.patient_first_name=Mark
...    input.patient_last_name=Smith
...    input.date_of_birth=1978-12-20
...    input.gender=Male
...    input.contact_number=5551234567
...    select.booking_type=New Patient
...    select.status=Booked
...    input.time=14:00
...    input.duration=20
...    input.reason=Follow-up
...    action=close_screen_without_saving
