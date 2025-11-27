*** Settings ***
Documentation    This file contains the dictionaries for new patient booking test data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{NEW_PATIENT_BOOKING_VALID}
...    select.type=New Patient
...    select.status=Booked
...    input.time=10:00
...    input.duration=30
...    input.reason=Initial Consultation
...    input.patient_first_name=John
...    input.patient_last_name=Doe
...    input.patient_dob=1990-01-01
...    input.patient_phone=5551234567
...    input.patient_email=john.doe@example.com

&{NEW_PATIENT_BOOKING_MISSING_FIELDS}
...    select.type=New Patient
...    select.status=Booked
...    input.time=10:30
...    input.duration=30
...    input.reason=Initial Consultation
...    input.patient_first_name=    # Missing first name
...    input.patient_last_name=Doe
...    input.patient_dob=1990-01-01
...    input.patient_phone=5551234567
...    input.patient_email=john.doe@example.com

&{NEW_PATIENT_BOOKING_CANCELLED}
...    select.type=New Patient
...    select.status=    # Status not set, simulating user closing the booking screen
...    input.time=11:00
...    input.duration=30
...    input.reason=Initial Consultation
...    input.patient_first_name=Jane
...    input.patient_last_name=Smith
...    input.patient_dob=1985-05-20
...    input.patient_phone=5559876543
...    input.patient_email=jane.smith@example.com
