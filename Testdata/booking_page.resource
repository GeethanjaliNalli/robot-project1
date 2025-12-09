*** Settings ***
Documentation    Test data for New Patient Booking (TC00002_Diary_NPB)

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{new_patient_booking_valid}
...    ${button.new_booking}=Create New Booking
...    ${select.booking_type}=New Patient
...    ${select.booking_status}=Confirmed
...    ${select.date}=2025-12-10
...    ${select.time}=09:30
...    ${input.duration}=30
...    ${input.reason}=General Consultation
...    ${input.name}=John
...    ${input.surname}=Doe
...    ${input.cellphone}=0812345678
...    ${select.id_type}=ID
...    ${input.id_number}=9001015800087

&{new_patient_booking_missing_fields}
...    ${button.new_booking}=Create New Booking
...    ${select.booking_type}=New Patient
...    ${select.booking_status}=Confirmed
...    ${select.date}=2025-12-10
...    ${select.time}=09:30
...    ${input.duration}=30
...    ${input.reason}=General Consultation
...    ${input.name}=John
...    ${input.surname}=    # MISSING
...    ${input.cellphone}=0812345678
...    ${select.id_type}=ID
...    ${input.id_number}=9001015800087
