*** Settings ***
Documentation       This file contains Booking Page locators.

*** Variables ***

&{BOOKING_LOCATORS}    
...    button.new_booking=css:button.new-booking
...    dialog.add_edit_booking=css:div[aria-labelledby='ui-id-61']
...    select.diary=css:select.diary
...    select.type=css:select.type
...    select.status=css:select.status
...    textarea.reason=css:textarea.reason
...    select.location=css:select.location
...    input.date=css:input.date
...    input.time=css:input.time
...    input.duration=css:input[name='duration']
...    input.treating_practitioner=css:input.treating-doc
...    input.referring_practitioner=css:input.referring-doc
...    select.service_center=css:select.service-center
...    button.repeat_booking=css:button.btn-repeat-booking
...    button.save=css:button.btn-save
...    button.close=css:button.btn-close
...    button.history=css:button:contains('History')

&{DEBTOR_LOCATORS}
...    input.debtor_search=css:input[title*='Search Debtor']
...    button.clear_debtor_info=css:button:contains('Clear Debtor Info')
...    input.debtor_name=css:input.name
...    input.debtor_surname=css:input[name='debtor_surname']
...    input.debtor_cellphone=css:input.cellnr
...    select.debtor_id_type=css:select.idtype
...    input.debtor_id_number=css:input.idnumber
...    input.debtor_email=css:input.email
...    select.debtor_title=css:select.title
...    select.debtor_gender=css:select.gender
...    input.debtor_initials=css:input.initials
...    input.medical_aid=css:input.ma_schemename
...    input.ma_option=css:input.ma_optionname
...    input.ma_number=css:input.ma_number

&{PATIENT_LOCATORS}
...    input.patient_name=css:input.name
...    input.patient_surname=css:input.surname
...    input.patient_cellphone=css:input.cellnr
...    select.patient_id_type=css:select.idtype
...    input.patient_id_number=css:input.idnumber
...    input.patient_email=css:input.email
...    input.patient_date_of_birth=css:input.dateofbirth
...    input.patient_initials=css:input.initials
...    input.patient_dependant_number=css:input.dependant-nr
...    select.patient_dependant_type=css:select.type
...    select.patient_gender=css:select.gender
...    select.patient_title=css:select.title
