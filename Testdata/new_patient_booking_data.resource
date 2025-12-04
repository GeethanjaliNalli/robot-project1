*** Settings ***
Documentation     Test data for New Patient Booking (TC00002_Diary_NPB). Contains business-valid values for all editable booking fields required for a successful patient booking scenario.
Resource          ../common/super.resource

*** Variables ***
&{BOOKING_DATA}
...   input.patientFirstName=John
...   input.patientLastName=Doe
...   input.patientDOB=1990-05-15
...   select.patientGender=Male
...   input.patientPhone=9876543210
...   input.patientEmail=john.doe@example.com
...   input.patientAddress=123 Main Street, Springfield
...   input.bookingDate=2025-12-10
...   input.bookingTime=10:30
...   select.bookingType=New Patient
...   select.doctor=Dr. Smith
...   input.reasonForVisit=General Checkup
...   select.insuranceProvider=HealthPlus
...   input.policyNumber=HP123456789
...   input.emergencyContact=Jane Doe
...   input.emergencyContactPhone=9123456789
...   input.notes=First time visit, no known allergies
