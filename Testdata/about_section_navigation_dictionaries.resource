*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=AutomationUser
    ...    input.password=AutoPass123

&{ABOUT_SECTION_TABS}
    ...    tab.overview=Overview
    ...    tab.license=License
    ...    tab.privacy=Privacy Policy
    ...    tab.terms=Terms of Service
    ...    tab.contact=Contact Us

&{EXPECTED_DATA}
    ...    navigation.success=User is able to navigate through all tabs in the About section and close it successfully.
