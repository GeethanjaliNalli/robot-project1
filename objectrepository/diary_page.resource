*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***

&{BOOKING_LOCATORS}
...    button.new_booking=css:button.new-booking
...    dialog.add_edit_booking=css:div[aria-labelledby='ui-id-61']
...    button.close=css:button.ui-dialog-titlebar-close
...    select.diary=css:select.diary
...    select.type=css:select.type
...    select.status=css:select.status
...    textarea.reason=css:textarea.reason
...    select.location=css:select.location
...    input.date=css:input.date
...    input.time=css:input.time
...    input.duration=css:input[name='duration']
...    select.service_center=css:select.service-center
...    input.treating_practitioner=css:input.treating-doc
...    input.referring_practitioner=css:input.referring-doc
...    button.repeat_booking=css:button.btn-repeat-booking
...    button.save=css:button.btn-save
...    button.close_footer=css:button.btn-close

&{PATIENT_LOCATORS}
...    input.name=xpath=//input[contains(@class, 'name') and not(contains(@data-bind, 'debtor'))]
...    input.surname=xpath=//input[contains(@class, 'surname') and not(contains(@data-bind, 'debtor'))]
...    input.cell_no=xpath=//input[contains(@class, 'cellnr') and not(contains(@data-bind, 'debtor'))]
...    select.id_type=xpath=//select[contains(@class, 'idtype') and not(contains(@data-bind, 'debtor'))]
...    input.id_no=xpath=//input[contains(@class, 'idnumber') and not(contains(@data-bind, 'debtor'))]
...    input.email=xpath=//input[contains(@class, 'email') and not(contains(@data-bind, 'debtor'))]
...    input.date_of_birth=css:input.dateofbirth
...    input.initials=xpath=//input[contains(@class, 'initials') and not(contains(@data-bind, 'debtor'))]
...    input.dependant_no=css:input.dependant-nr
...    select.dependant_type=xpath=//select[contains(@class, 'type') and contains(@data-bind, 'dependant_type')]
...    select.gender=xpath=//select[contains(@class, 'gender') and not(contains(@data-bind, 'debtor'))]
...    select.title=xpath=//select[contains(@class, 'title') and not(contains(@data-bind, 'debtor'))]
