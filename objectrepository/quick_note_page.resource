*** Settings ***
Documentation    This file has all type of locators for Quick Note Page

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.booking}                       .btn.booking-display.btn-primary
${button.clinical}                      .btn-sidebar.btn.btn-sm.clinical
${dropdown.forms_library}               .form-control.event-type.mb20
${option.quick_note}                    //option[normalize-space()='QUICK NOTE']
${button.add_image}                     .btn.btn-sm.btn-primary.w100.mt5[data-bind="processEvent: { click: ['HarmonyViewLauncher', 'image_viewer_timeline'] }"]
${button.save}                          .btn.btn-sm.btn-primary.w100.mb5[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${textbox.quick_note_text}              .input-sm
${button.print}                         .btn.btn-sm.btn-success.btn-print
${link.select_clinical_subscreen}       .ui-dialog.ui-corner-all a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().clinical)"]
${dropdown.forms_library_button}        button[data-toggle="dropdown"]
${button.patient}                       button.patient-btn
${button.debtor_add_edit}               button[data-bind="enable: $button.debtor_edit.enable, processEvent: { click: 'DebtorAddEdit' }"]
${button.upload_from_file}              //button[normalize-space(.)="mygc"]
${button.choose_file}                   button.btn.btn-file
${button.select_picture}                button.patient-btn
${button.save_quick_note}               button[data-bind="processEvent: { click: ['Save', undefined, { close: $data.close }] }"]
${input.quick_note_description}         input[data-bind="enable: unwrap(type().setup(), 'description_overrideable'), textInput: subtype_searchfilter.search_term, autoComplete: subtype_searchfilter.options_text()"]
${button.upload_pdf}                    button.btn.btn-file
${button.select_pdf}                    button.btn.booking-display
${button.print_quick_note}              button[data-bind="processEvent: { click: 'Print' }"]
