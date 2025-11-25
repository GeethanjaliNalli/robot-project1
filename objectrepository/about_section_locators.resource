*** Settings ***
Documentation    This file contains all locators for About section navigation and tab actions.

*** Variables ***
# robocop: disable=section-variable-not-uppercase

&{about_section}
...    tab.overview=xpath=//div[@role="tab" and text()="Overview"]
...    tab.details=xpath=//div[@role="tab" and text()="Details"]
...    tab.licenses=xpath=//div[@role="tab" and text()="Licenses"]
...    tab.acknowledgements=xpath=//div[@role="tab" and text()="Acknowledgements"]
...    tab.close=css=button.about-close
...    content.overview=xpath=//div[contains(@class,"about-content") and .//h2[text()="Overview"]]
...    content.details=xpath=//div[contains(@class,"about-content") and .//h2[text()="Details"]]
...    content.licenses=xpath=//div[contains(@class,"about-content") and .//h2[text()="Licenses"]]
...    content.acknowledgements=xpath=//div[contains(@class,"about-content") and .//h2[text()="Acknowledgements"]]
...    dialog=css=div.about-dialog

&{dashboard}
...    menu.about=xpath=//nav//a[text()="About"]
