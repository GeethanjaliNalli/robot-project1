*** Settings ***
Documentation    This file has dictionaries for booking data used in test cases
Resource    ../common/super.resource

*** Variables ***

&{BOOKING_INFO}
    ...    input.time=09:00
    ...    input.duration=30
    ...    input.reason=General Consultation

&{DEBTOR_INFO}
    ...    input.debtor.title=MR
    ...    input.debtor.firstname=Alex
    ...    input.debtor.surname=Carey
    ...    input.debtor.initials=AC
    ...    input.debtor.gender=Male
    ...    input.debtor.idnumber=8001015009087
    ...    input.debtor.cellno=0823456789
    ...    input.debtor.email=alex.carey@example.com

&{PATIENT_INFO}
    ...    input.patient.firstname=Alex
    ...    input.patient.surname=Carey
    ...    input.patient.gender=Male
    ...    input.patient.dob=1980-01-01
    ...    input.patient.idnumber=8001015009087
    ...    input.patient.cellno=0823456789

&{EXPECTED_DATA}
    ...    debtor_name=MR Carey, AC, Alex
    ...    cell_no=0823456789
    ...    timeslot=09:00
