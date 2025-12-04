*** Settings ***
Documentation     Test data for New Patient Booking (TC00002_Diary_NPB): Contains all required and typical input values for booking a new patient appointment in the diary module.
Resource          ../common/super.resource

*** Variables ***
&{BOOKING_DATA}
...   input.patientFirstName=John
...   input.patientLastName=Doe
...   input.patientDOB=1990-05-15
...   input.patientGender=Male
...   input.patientEmail=john.doe@example.com
...   input.patientPhone=9876543210
...   input.patientAddress=123 Main Street, Springfield
...   input.bookingDate=2025-12-10
...   input.bookingTime=10:30
...   select.bookingType=New Patient
...   select.doctor=Dr. Smith
...   select.appointmentReason=General Consultation
...   input.insuranceNumber=INS12345678
...   select.insuranceProvider=HealthFirst
...   textarea.notes=First time visit, please bring previous medical records.
