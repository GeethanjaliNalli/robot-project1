*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{LOGIN_INFO}
    ...    input.username=AlexUser
    ...    input.password=SecurePass123

&{ABOUT_TABS}
    ...    tab.company=Company Info
    ...    tab.team=Team Members
    ...    tab.mission=Mission Statement
    ...    tab.careers=Careers
    ...    tab.contact=Contact Us

&{EXPECTED_DATA}
    ...    login_status=Success
    ...    navigation_status=All tabs navigated successfully
    ...    visible_tabs=Company Info, Team Members, Mission Statement, Careers, Contact Us
