*** Settings ***
Documentation    This file contains all locators for the About section navigation page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{ABOUT_PAGE_LOCATORS}
...    tab.company=xpath=//a[@id="about-company-tab"]
...    tab.team=xpath=//a[@id="about-team-tab"]
...    tab.careers=xpath=//a[@id="about-careers-tab"]
...    tab.contact=xpath=//a[@id="about-contact-tab"]
...    button.close=xpath=//button[@id="about-close-button"]
