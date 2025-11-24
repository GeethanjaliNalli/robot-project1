*** Settings ***
Documentation    This file contains all locators for the About section page, including navigation tabs and controls.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    xpath=//button[normalize-space(text())="About"]
${tab.company}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Company"]
${tab.team}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Team"]
${tab.careers}    xpath=//div[@role="tablist"]//button[normalize-space(text())="Careers"]
${button.close.about}    xpath=//div[contains(@class,"about-section")]//button[@aria-label="Close"]
