*** Settings ***
Documentation    Test data for New Patient Booking (TC00002_Diary_NPB) on the Diary screen.
Resource         ../common/super.resource

*** Variables ***
&{BOOKING_DATA}
...    select.booking_type=New Patient
...    select.booking_status=Confirmed
...    input.booking_date=2025-01-15
...    input.booking_time=10:30
...    input.booking_duration=30
...    textarea.reason_for_appointment=Initial consultation for persistent cough
...    input.patient_name=John
...    input.patient_surname=Doe
...    input.patient_cellphone=0821234567
...    select.id_type=South African ID
...    input.id_number=9001015800081
...    select.medical_aid_option=Discovery Health
...    input.medical_aid_number=1234567890
...    select.gender=Male
...    input.initials=J
...    select.title=Mr
