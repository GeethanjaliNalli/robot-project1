*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=AutomationUser
    ...    input.password=AutoPass123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.privacy=Privacy Policy
    ...    tab.terms=Terms of Service
    ...    tab.contact=Contact Us
    ...    tab.version=Version Info

&{EXPECTED_DATA}
    ...    navigation.status=Success
    ...    navigation.message=User navigated all About section tabs and closed About dialog successfully
