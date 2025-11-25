*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{ABOUT_SECTION_NAVIGATION}
    ...    input.username=automation
    ...    input.password=auto123
    ...    button.login=Login
    ...    link.about=About
    ...    tab.company=Company
    ...    tab.team=Team
    ...    tab.careers=Careers
    ...    tab.contact=Contact
    ...    button.close=Close

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    about_tabs_navigated=Company, Team, Careers, Contact
    ...    about_closed=True
