*** Settings ***
Documentation    This File has all the Test Cases related to the login page
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.

TC_02 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate to the About section, access each tab, and close the About dialog successfully.
    ...    Ensures the About section is accessible and all tabs (Overview, Details, Licenses, Acknowledgements) are visible and functional.
    ...    Confirms the About dialog can be closed after navigation.
    Navigate To About Section
    Navigate Through About Tabs
    Validate About Section Closed
