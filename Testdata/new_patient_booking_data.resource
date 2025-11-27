*** Variables ***

&{PATIENT_INFO_VALID}
...    input.firstname=John
...    input.lastname=Smith
...    input.idnumber=8001015009087
...    input.dateofbirth=1980-01-01
...    select.gender=Male
...    input.mobile=0821234567
...    input.email=john.smith@example.com
...    input.addressline1=12 Main Road
...    input.addressline2=Unit 4
...    input.suburb=Sandton
...    input.city=Johannesburg
...    input.postalcode=2196
...    select.province=Gauteng
...    select.patienttype=Private
...    select.fundingtype=Cash

&{DEBTOR_INFO_PRIVATE}
...    input.debtorname=John Smith
...    select.debortype=Private
...    input.debtoridnumber=8001015009087
...    input.debtorcontactnumber=0111234567
...    input.debtorreference=JS-PRIVATE-001

&{BOOKING_INFO_VALID}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr John Doe
...    select.diaryroom=Room 1
...    input.bookingdate=2025-01-15
...    input.bookingtime=09:00
...    select.bookingtype=Consultation
...    select.visitreason=New patient assessment
...    select.medicalaidplan=None
...    input.notes=New patient booking created via automation

&{PATIENT_INFO_MISSING_REQUIRED}
...    input.firstname=
...    input.lastname=Smith
...    input.idnumber=
...    input.dateofbirth=
...    select.gender=Male
...    input.mobile=0821234567
...    input.email=john.smith+missing@example.com

&{BOOKING_INFO_MISSING_REQUIRED}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=
...    select.diaryroom=Room 1
...    input.bookingdate=
...    input.bookingtime=09:00
...    select.bookingtype=Consultation
...    select.visitreason=New patient assessment

&{BOOKING_INFO_CLOSE_WITHOUT_SAVE}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr John Doe
...    select.diaryroom=Room 2
...    input.bookingdate=2025-01-16
...    input.bookingtime=10:30
...    select.bookingtype=Consultation
...    select.visitreason=New patient assessment
...    input.notes=User closes the booking screen without saving

&{EXPECTED_DATA}
...    booking_created_message=Booking successfully created
...    booking_not_created_message=No booking was created
...    required_fields_error_message=Please fill in all required fields before saving
...    diary_module_name=DIARY
...    scenario_valid_booking=Booking should be created and visible in the diary
...    scenario_missing_required_fields=System should not create a booking and should indicate missing required fields
...    scenario_close_without_save=System should not create a booking when the user closes the screen without saving
