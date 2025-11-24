*** Settings ***
Documentation    This file contains all locators for About section navigation and actions.

*** Variables ***
# robocop: disable=section-variable-not-uppercase
${button.about}    css=button[aria-label="About"]
${dialog.about}    css=div[role="dialog"][aria-label="About"]
${tab.overview}    xpath=//div[@role="tablist"]//button[.="Overview"]
${tab.license}     xpath=//div[@role="tablist"]//button[.="License"]
${tab.credits}     xpath=//div[@role="tablist"]//button[.="Credits"]
${button.close.about}    css=div[role="dialog"][aria-label="About"] button[aria-label="Close"]
