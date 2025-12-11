*** Settings ***
Documentation       This file has all type of locators for About Page

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}                  a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().info)"]
${tab.medical_aid_contracts}     a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().medicalaid_contracts)"]
${tab.user_manual}               a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().manual)"]
${tab.changelog}                 a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().changelog)"]
${tab.services}                  a[data-bind="click: $screen.selectedSubscreen($screen.subscreens().services)"]
${button.close}                  button.btn-close
${button.close_about}            button[data-bind="processEvent: { click: 'Close' }"]
