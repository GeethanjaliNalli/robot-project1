*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=AutomationUser
    ...    input.password=AutoPass123

&{ABOUT_NAVIGATION_TABS}
    ...    tab.company_profile=Company Profile
    ...    tab.team=Team
    ...    tab.careers=Careers
    ...    tab.contact_us=Contact Us
    ...    tab.legal=Legal

&{EXPECTED_DATA}
    ...    navigation_status=Success
    ...    closed_status=About Section Closed
