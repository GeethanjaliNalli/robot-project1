*** Settings ***
Documentation    This file contains the dictionary for Sick Note (Medical Certificate) data used in Diary - Add Sick note test cases.
Resource    ../common/super.resource

*** Variables ***
&{SICK_NOTE_INFO}
...    patient_name=John Doe
...    patient_id=PAT123456
...    booking_id=BOOK987654
...    practitioner_name=Dr. Alice Smith
...    practitioner_id=PRAC001
...    note_type=Sick Note
...    diagnosis=Acute bronchitis
...    certificate_date=2024-06-01
...    start_date=2024-06-01
...    end_date=2024-06-05
...    duration=5
...    comments=Patient is unfit for work during the above period due to illness.
...    doctor_signature=enabled
...    email_to_patient=enabled
...    print_certificate=enabled
...    qr_code=enabled
...    email_subject=Your Medical Certificate
...    email_body=Dear John Doe,\nPlease find attached your Sick Note as requested.\nRegards,\nDr. Alice Smith
...    print_copies=1
