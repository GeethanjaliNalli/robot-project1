*** Variables ***

&{PATIENT_INFO_VALID}
...    input.firstname=John
...    input.lastname=Doe
...    input.idnumber=8001015009087
...    input.dateofbirth=1980-01-01
...    select.gender=Male
...    input.mobilenumber=0821234567
...    input.email=john.doe@example.com
...    input.addressline1=12 Main Road
...    input.addressline2=Gardens
...    input.city=Cape Town
...    input.postalcode=8001
...    select.patienttype=Private
...    select.fundingtype=Cash

&{PATIENT_INFO_MISSING_REQUIRED}
...    input.firstname=
...    input.lastname=Doe
...    input.idnumber=
...    input.dateofbirth=1980-01-01
...    select.gender=Male
...    input.mobilenumber=0821234567
...    input.email=john.doe@example.com
...    input.addressline1=12 Main Road
...    input.addressline2=Gardens
...    input.city=Cape Town
...    input.postalcode=8001
...    select.patienttype=Private
...    select.fundingtype=Cash

&{BOOKING_INFO_VALID}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Smith
...    select.diarytype=Consultation
...    input.bookingdate=2025-01-15
...    input.starttime=09:00
...    input.endtime=09:30
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Booked
...    check.firstvisit=True

&{BOOKING_INFO_CLOSE_WITHOUT_SAVE}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Smith
...    select.diarytype=Consultation
...    input.bookingdate=2025-01-15
...    input.starttime=10:00
...    input.endtime=10:30
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Draft
...    check.firstvisit=True

&{BOOKING_INFO_MISSING_REQUIRED}
...    select.diarylocation=Main Practice
...    select.diarypractitioner=Dr Smith
...    select.diarytype=Consultation
...    input.bookingdate=
...    input.starttime=11:00
...    input.endtime=11:30
...    select.visitreason=New patient consultation
...    select.appointmentstatus=Booked
...    check.firstvisit=True

&{EXPECTED_DATA}
...    booking_created_when_all_required_filled_and_saved=True
...    booking_created_when_missing_required_fields=False
...    booking_created_when_screen_closed_without_save=False
