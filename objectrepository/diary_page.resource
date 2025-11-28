*** Settings ***
Documentation       This file contains Diary Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{DIARY_PAGE_LOCATORS}
...    button.new_booking=.btn.btn-sm.btn-primary.new-booking
...    button.add_sick_note=//button[span[contains(text(),'SICK NOTE')]]
...    button.save=button.btn-success.btn-save
...    button.print=button.btn-success.btn-print
...    dialog.sick_note_title=//div[contains(@class,'ui-dialog')]//span[contains(@class,'ui-dialog-title') and contains(text(),'Sick Note')]
...    input.reason_for_absence=//label[t[text()='Reason for Absence']]/following-sibling::input
...    select.duration=[name="duration"]
...    button.finalize=button.btn-finalize
...    button.email=button.btn-success:has(icon.fa-envelope)
...    button.close=.btn-close

${button.close}    .pull-left.btn-close
