*** Settings ***
Documentation       This file contains About Page locators.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{ABOUT_SECTION_LOCATORS}
...    button.close=.btn.btn-sm.btn-danger.pull-left.btn-close
...    button.about.topright=a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
...    tab.medicalaid=a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().medicalaid_contracts)"]
...    tab.manual=a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().manual)"]
...    tab.changelog=a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().changelog)"]
...    tab.services=a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().services)"]
...    button.close.dialog=button[data-bind="processEvent: { click: 'Close' }"]

${button.close}    .pull-left.btn-close
