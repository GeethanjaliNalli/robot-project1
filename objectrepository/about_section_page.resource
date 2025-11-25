*** Settings ***
Documentation    This file contains all locators for About section navigation and tab actions.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{ABOUT_SECTION_LOCATORS}
...    button.about=css=button#about-section
...    tab.overview=css=div.about-tabs > button#overview
...    tab.details=css=div.about-tabs > button#details
...    tab.history=css=div.about-tabs > button#history
...    button.close=css=button#about-close
