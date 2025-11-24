*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=alex.smith
    ...    input.password=Password123!

&{ABOUT_SECTION_TABS}
    ...    tab.overview=Overview
    ...    tab.team=Team
    ...    tab.mission=Mission
    ...    tab.history=History
    ...    tab.contact=Contact

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    navigation_status=All tabs navigated
    ...    about_section_closed=True
