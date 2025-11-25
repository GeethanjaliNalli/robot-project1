*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{BOOKING_INFO}
    ...    input.date=2025-12-01
    ...    input.time=09:30
    ...    input.duration=30
    ...    select.reason=Consultation
    ...    input.notes=First time booking

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.surname=Carey
    ...    input.debtor.firstname=Alex
    ...    input.debtor.initials=AC
    ...    input.debtor.idnumber=8501015009087
    ...    input.debtor.cellno=0823456789

&{PATIENT_INFO}
    ...    input.patient.title=MR
    ...    input.patient.surname=Carey
    ...    input.patient.firstname=Alex
    ...    input.patient.initials=AC
    ...    input.patient.gender=Male
    ...    input.patient.dob=1985-01-01

&{DEBTOR_WITHOUT_NAME}
    ...    input.debtor.title=MR
    ...    input.debtor.idnumber=8501015009087
    ...    input.debtor.cellno=0823456789

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0823456789
    ...    timeslot=2025-12-01 09:30
