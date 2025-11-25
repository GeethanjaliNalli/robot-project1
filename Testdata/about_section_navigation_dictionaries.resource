*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=AutomationUser
    ...    input.password=autoPass123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.team=Team Members
    ...    tab.privacy=Privacy Policy
    ...    tab.terms=Terms & Conditions
    ...    tab.contact=Contact Us

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    about_tabs_navigated=All
    ...    about_section_closed=True
