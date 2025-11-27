*** Variables ***

&{PATIENT_INFO}
...    input.firstname=John
...    input.lastname=Doe
...    select.gender=Male
...    input.dateofbirth=1990-05-15
...    input.phonenumber=0123456789

&{BOOKING_INFO}
...    select.appointmenttype=New Patient
...    input.bookingdate=2025-12-01
...    input.bookingtime=09:30
...    select.doctor=Dr. Smith
...    input.reason=Initial consultation

&{EXPECTED_DATA}
...    booking_status=Booking created
...    confirmation_message=Booking successfully created for John Doe
...    error_message=All required fields must be filled in
