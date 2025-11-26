*** Settings ***
Documentation    This file has dictionaries used in Test cases
Resource    ../common/super.resource

*** Variables ***
&{ABOUT_SECTION_VALID_USER}
    ...    input.username=AutomationUser
    ...    input.password=AutoPass123

&{ABOUT_SECTION_TABS}
    ...    tab.company=Company Info
    ...    tab.team=Team
    ...    tab.legal=Legal
    ...    tab.privacy=Privacy Policy
    ...    tab.contact=Contact Us

&{EXPECTED_DATA}
    ...    navigation_status=Success
    ...    closed_status=Section Closed
