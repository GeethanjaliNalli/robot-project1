*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{ABOUT_SECTION_VALID_USER}
    ...    input.username=AutomationUser
    ...    input.password=SecurePass123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.team=Team Members
    ...    tab.licenses=Licenses
    ...    tab.privacy=Privacy Policy
    ...    tab.terms=Terms & Conditions

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    navigation_status=All tabs navigated
    ...    about_section_closed=True
