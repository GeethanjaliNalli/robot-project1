*** Variables ***

&{PATIENT_INFO}
...    input.firstname=John
...    input.lastname=Doe
...    input.idnumber=9001015800087
...    select.gender=Male
...    input.dateofbirth=1990-01-01

&{BOOKING_INFO}
...    select.appointmenttype=New Patient
...    select.doctor=Dr. Smith
...    input.date=2025-12-01
...    input.time=09:30
...    input.reason=General Consultation

&{EXPECTED_DATA}
...    booking_status=Booking Created
...    confirmation_message=Booking successfully created for John Doe
...    error_message=All required fields must be filled in
...    no_booking_message=No booking was made
