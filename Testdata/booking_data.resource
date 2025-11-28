*** Settings ***
Documentation    This file contains the dictionaries for new patient booking data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{NEW_PATIENT_BOOKING_VALID}
...    select.type=New Patient
...    select.status=Booked
...    input.time=10:00
...    input.duration=30
...    input.reason=Initial Consultation
...    input.first_name=John
...    input.last_name=Doe
...    input.dob=1990-01-01
...    input.contact_number=5551234567
...    input.email=john.doe@example.com

&{NEW_PATIENT_BOOKING_MISSING_FIELDS}
...    select.type=New Patient
...    select.status=Booked
...    input.time=11:00
...    input.duration=30
...    input.reason=Initial Consultation
...    input.first_name=
...    input.last_name=Doe
...    input.dob=1990-01-01
...    input.contact_number=5551234567
...    input.email=john.doe@example.com

&{NEW_PATIENT_BOOKING_CANCELLED}
...    select.type=New Patient
...    select.status=Cancelled
...    input.time=12:00
...    input.duration=30
...    input.reason=Initial Consultation
...    input.first_name=Jane
...    input.last_name=Smith
...    input.dob=1985-05-15
...    input.contact_number=5559876543
...    input.email=jane.smith@example.com
