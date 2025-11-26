*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=aboutuser
    ...    input.password=About@123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.terms=Terms & Conditions
    ...    tab.privacy=Privacy Policy
    ...    tab.help=Help
    ...    tab.contact=Contact Us

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    navigation_status=All tabs navigated
    ...    about_closed=True
