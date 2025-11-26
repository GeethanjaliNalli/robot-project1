*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=automation
    ...    input.password=auto123

&{ABOUT_TABS}
    ...    tab.company=Company Information
    ...    tab.team=Team
    ...    tab.careers=Careers
    ...    tab.contact=Contact Us
    ...    tab.legal=Legal

&{EXPECTED_DATA}
    ...    navigation_status=Success
    ...    closed_status=All tabs closed
