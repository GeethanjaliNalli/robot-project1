*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=AutomationUser
    ...    input.password=AutoPass123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.team=Team Members
    ...    tab.careers=Careers
    ...    tab.contact=Contact Us
    ...    tab.legal=Legal Notices

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    about_section_navigation=All tabs visited and closed
