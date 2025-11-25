*** Settings ***
Documentation    This file contains all locators for the About section navigation and actions.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{ABOUT_PAGE_LOCATORS}
...    button.about=xpath=//button[contains(@aria-label, "About") or contains(text(), "About")]
...    tab.overview=xpath=//div[contains(@class, "about-tabs")]//button[contains(text(), "Overview")]
...    tab.license=xpath=//div[contains(@class, "about-tabs")]//button[contains(text(), "License")]
...    tab.credits=xpath=//div[contains(@class, "about-tabs")]//button[contains(text(), "Credits")]
...    button.close=xpath=//button[contains(@aria-label, "Close") or contains(text(), "Close")]
