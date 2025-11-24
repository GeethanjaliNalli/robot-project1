*** Settings ***
Documentation    This file contains all locators for the About section navigation page.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    xpath=//button[normalize-space(text())="About"]
${tab.company}    xpath=//div[contains(@class,"about-tabs")]//a[normalize-space(text())="Company"]
${tab.team}    xpath=//div[contains(@class,"about-tabs")]//a[normalize-space(text())="Team"]
${tab.careers}    xpath=//div[contains(@class,"about-tabs")]//a[normalize-space(text())="Careers"]
${button.close.about}    xpath=//div[contains(@class,"about-section")]//button[@aria-label="Close"]
