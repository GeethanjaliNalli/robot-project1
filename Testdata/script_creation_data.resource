*** Settings ***
Documentation    This file contains the test data dictionaries for Script Creation (Prescription) scenarios, supporting TC00007_Diary_Script.
Resource    ../common/super.resource

*** Variables ***
&{PRESCRIPTION_DATA}
...    patient_name=John Doe
...    patient_id=PAT123456
...    booking_id=BOOK987654
...    practitioner_name=Dr. Alice Smith
...    practitioner_id=PRAC001
...    script_type=Basic
...    medication_list=[{'name': 'Amoxicillin', 'dose': '500mg', 'frequency': '3 times a day', 'duration': '5 days', 'route': 'Oral', 'directions': 'Take after meals'}, {'name': 'Paracetamol', 'dose': '500mg', 'frequency': '2 times a day', 'duration': '3 days', 'route': 'Oral', 'directions': 'As needed for pain'}]
...    diagnosis=Acute Pharyngitis
...    directions=Complete the full course of antibiotics. Use Paracetamol for fever or pain.
...    signature_required=True
...    signature_configured=True
...    email_to_patient=True
...    print_script=True
...    output_qr_code_expected=True
...    status=Completed
...    script_date=2024-06-15
...    entity_settings={'signature_on_script': True, 'qr_code_enabled': True}
...    email_address=john.doe@example.com
...    print_copies=1
...    expected_output_fields=['Medication', 'Directions', 'Signature', 'QR Code']
