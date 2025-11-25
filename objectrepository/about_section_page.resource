*** Settings ***
Documentation    This file contains all locators for About section navigation and actions.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{ABOUT_SECTION_LOCATORS}
...    button.about=xpath=//button[@id="about"]
...    tab.general=xpath=//div[@role="tab" and text()="General"]
...    tab.license=xpath=//div[@role="tab" and text()="License"]
...    tab.thirdparty=xpath=//div[@role="tab" and text()="Third Party"]
...    button.close=xpath=//button[@aria-label="Close About"]
