*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=alex.smith
    ...    input.password=Password123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company
    ...    tab.team=Team
    ...    tab.careers=Careers
    ...    tab.contact=Contact
    ...    tab.legal=Legal

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    about_tabs_navigated=All tabs navigated successfully
    ...    about_section_closed=True
