*** Settings ***
Documentation       This file contains Booking Page locators.

*** Variables ***

&{booking.locators}
...    button.new_booking=css:button.new-booking
...    dialog.add_edit_booking=css:span#ui-id-61
...    select.diary=css:select.diary
...    select.type=css:select.type
...    select.status=css:select.status
...    textarea.reason=css:textarea.reason
...    select.location=css:select.location
...    input.date=css:input.date
...    input.time=css:input.time
...    input.duration=css:input[name='duration']
...    button.save=css:button.btn-save
...    button.close=css:button.btn-close
...    button.delete_booking=css:button.btn-delete
...    button.repeat_booking=css:button.btn-repeat-booking

&{debtor_patient.locators}
...    input.search_debtor_patient=xpath=//input[@placeholder='Search Debtor by *File no., +MA Scheme, #MA no., Account, Name, Surname, ID or Mobile.']
...    button.clear_debtor_info=xpath=//button[text()='Clear Debtor Info']
...    input.name=css:input.name
...    input.surname=css:input[name='debtor_surname']
...    input.cellphone=css:input.cellnr
...    select.id_type=css:select.idtype
...    input.id_number=css:input.idnumber
...    input.email=css:input.email
...    input.medical_aid=css:input.ma_schemename
...    input.ma_option=css:input.ma_optionname
...    input.ma_number=css:input.ma_number
...    select.gender=css:select.gender
...    input.initials=css:input.initials
...    select.title=css:select.title
