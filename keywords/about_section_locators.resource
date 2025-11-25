*** Settings ***
Documentation    This file contains all locators for About section navigation and tab interaction.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
&{ABOUT_SECTION_LOCATORS}
...    button.about=xpath=//button[@id="about"]
...    tab.general=xpath=//div[@role="tablist"]//button[normalize-space(text())="General"]
...    tab.license=xpath=//div[@role="tablist"]//button[normalize-space(text())="License"]
...    tab.credits=xpath=//div[@role="tablist"]//button[normalize-space(text())="Credits"]
...    tab.version=xpath=//div[@role="tablist"]//button[normalize-space(text())="Version"]
...    button.about.close=xpath=//div[contains(@class,"about-dialog")]//button[@aria-label="Close"]
