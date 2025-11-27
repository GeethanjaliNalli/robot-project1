&{PATIENT_INFO_VALID_NEW_BOOKING}
...    input.firstname=Alice
...    input.lastname=Williams
...    input.idnumber=9001015009088
...    input.dateofbirth=1990-01-01
...    select.gender=Female
...    input.mobilenumber=0831234567
...    input.email=alice.williams@example.com
...    input.addressline1=45 Oak Avenue
...    input.addressline2=Rondebosch
...    input.city=Cape Town
...    input.postalcode=7700
...    select.patienttype=Private
...    select.fundingtype=Cash

&{PATIENT_INFO_EDGE_INVALID_ID}
...    input.firstname=Brian
...    input.lastname=Smith
...    input.idnumber=12345
...    input.dateofbirth=2005-12-31
...    select.gender=Male
...    input.mobilenumber=0849876543
...    input.email=brian.smith@example.com
...    input.addressline1=10 Boundary Street
...    input.addressline2=Observatory
...    input.city=Cape Town
...    input.postalcode=7925
...    select.patienttype=Private
...    select.fundingtype=Cash

&{PATIENT_INFO_MISSING_CONTACT_DETAILS}
...    input.firstname=Carla
...    input.lastname=Naidoo
...    input.idnumber=8205055009089
...    input.dateofbirth=1982-05-05
...    select.gender=Female
...    input.mobilenumber=
...    input.email=
...    input.addressline1=7 Green Lane
...    input.addressline2=Claremont
...    input.city=Cape Town
...    input.postalcode=7708
...    select.patienttype=Private
...    select.fundingtype=Cash

&{BOOKING_INFO_VALID_MORNING_SLOT}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Smith
...    select.diarytype=Consultation
...    input.bookingdate=2025-02-10
...    input.starttime=08:00
...    input.endtime=08:30
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Booked
...    check.firstvisit=True

&{BOOKING_INFO_VALID_AFTERNOON_SLOT}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Jones
...    select.diarytype=Consultation
...    input.bookingdate=2025-02-10
...    input.starttime=15:30
...    input.endtime=16:00
...    select.visitreason=Follow-up new patient
...    select.appointmentstatus=Booked
...    check.firstvisit=True

&{BOOKING_INFO_MISSING_REQUIRED_DATE}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Smith
...    select.diarytype=Consultation
...    input.bookingdate=
...    input.starttime=09:00
...    input.endtime=09:30
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Booked
...    check.firstvisit=True

&{BOOKING_INFO_INVALID_TIME_RANGE}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Smith
...    select.diarytype=Consultation
...    input.bookingdate=2025-02-11
...    input.starttime=10:30
...    input.endtime=10:00
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Booked
...    check.firstvisit=True

&{BOOKING_INFO_CLOSE_SCREEN_WITHOUT_SAVE}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Smith
...    select.diarytype=Consultation
...    input.bookingdate=2025-02-12
...    input.starttime=11:00
...    input.endtime=11:30
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Draft
...    check.firstvisit=True

&{BOOKING_INFO_PARTIAL_REQUIRED_FIELDS}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=
...    select.diarytype=Consultation
...    input.bookingdate=2025-02-13
...    input.starttime=12:00
...    input.endtime=12:30
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Booked
...    check.firstvisit=True

&{EXPECTED_DATA_NEW_PATIENT_BOOKING}
...    booking_created_when_all_required_filled_and_saved=True
...    booking_created_when_missing_required_fields=False
...    booking_created_when_screen_closed_without_save=False
...    booking_not_created_when_time_range_invalid=True
...    booking_not_created_when_practitioner_missing=True
