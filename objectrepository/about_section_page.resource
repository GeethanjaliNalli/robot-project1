*** Settings ***
Documentation    This file contains all locators for the About section navigation page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{ABOUT_SECTION_LOCATORS}
...    button.menu.about=xpath=//button[@id="about-menu"]
...    tab.overview=xpath=//div[@role="tablist"]//button[normalize-space(text())="Overview"]
...    tab.license=xpath=//div[@role="tablist"]//button[normalize-space(text())="License"]
...    tab.privacy=xpath=//div[@role="tablist"]//button[normalize-space(text())="Privacy Policy"]
...    tab.terms=xpath=//div[@role="tablist"]//button[normalize-space(text())="Terms & Conditions"]
...    button.about.close=xpath=//div[contains(@class,"about-section")]//button[@aria-label="Close"]
