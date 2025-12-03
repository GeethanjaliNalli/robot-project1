*** Settings ***
Documentation     Test data for New Patient Booking (TC00002_Diary_NPB): contains all required and optional fields for positive and negative booking scenarios.
Resource          ../common/super.resource

*** Variables ***
&{BOOKING_DATA}
...   select_booking_type=New Patient
...   select_booking_status=Confirmed
...   select_date=2025-01-15
...   select_time=10:30
...   select_duration=30
...   add_reason_for_appointment=General Consultation
...   complete_name=John
...   complete_surname=Doe
...   complete_cellphone=0821234567
...   select_id_type=South African ID
...   complete_id_number=9001015800081
...   complete_medical_aid_option=Discovery Health
...   complete_ma_number=1234567890
...   select_gender=Male
...   complete_initials=J
...   select_title=Mr
