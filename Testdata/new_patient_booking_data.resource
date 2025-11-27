*** Settings ***
Documentation    This file contains the dictionaries for new patient booking data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{NEW_PATIENT_BOOKING_VALID}
...    input.patient_first_name=John
...    input.patient_last_name=Doe
...    input.date_of_birth=1990-01-01
...    select.gender=Male
...    input.contact_number=5551234567
...    input.email=john.doe@example.com
...    select.type=Consultation
...    select.status=Booked
...    input.time=09:15
...    input.duration=15
...    input.reason=General Checkup

&{NEW_PATIENT_BOOKING_MISSING_REQUIRED}
...    input.patient_first_name=John
...    input.patient_last_name=
...    input.date_of_birth=1990-01-01
...    select.gender=Male
...    input.contact_number=5551234567
...    input.email=john.doe@example.com
...    select.type=Consultation
...    select.status=Booked
...    input.time=09:15
...    input.duration=15
...    input.reason=General Checkup

&{NEW_PATIENT_BOOKING_CANCELLED}
...    input.patient_first_name=Jane
...    input.patient_last_name=Smith
...    input.date_of_birth=1985-05-15
...    select.gender=Female
...    input.contact_number=5559876543
...    input.email=jane.smith@example.com
...    select.type=Consultation
...    select.status=Cancelled
...    input.time=10:30
...    input.duration=30
...    input.reason=Flu Symptoms
