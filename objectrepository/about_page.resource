*** Settings ***
Documentation    This file contains all locators for the About section navigation page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{ABOUT_PAGE_LOCATORS}
...    tab.company=xpath=//div[@role="tab" and text()="Company"]
...    tab.privacy=xpath=//div[@role="tab" and text()="Privacy"]
...    tab.terms=xpath=//div[@role="tab" and text()="Terms"]
...    tab.licenses=xpath=//div[@role="tab" and text()="Licenses"]
...    button.close=xpath=//button[@aria-label="Close" or text()="Close"]
