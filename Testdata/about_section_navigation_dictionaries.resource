*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=AboutUser
    ...    input.password=AboutPass123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company
    ...    tab.team=Team
    ...    tab.careers=Careers
    ...    tab.contact=Contact
    ...    tab.legal=Legal

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    navigation_status=All tabs navigated
    ...    about_section_closed=True
