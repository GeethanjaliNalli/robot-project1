*** Settings ***
Documentation    This file contains all the test cases related to the application, including navigation in the About section.
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource
Resource    ../../keywords/dashboard_page.resource
Resource    ../../keywords/login_page.resource
Resource    ../../Testdata/about_navigation_data.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application


*** Test Cases ***
TC_01 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate through all tabs in the About section and close it successfully.
    Navigate To About Section
    Navigate Through About Tabs    ${ABOUT_NAVIGATION_INFO.select.tabs}
    Close About Section
    Validate About Section Closed    ${ABOUT_NAVIGATION_INFO.expected.close_action}


*** Keywords ***
Navigate To About Section
    [Documentation]    Navigates to the About section from the dashboard.
    Select Menu In Navigation Wheel    ${ABOUT_NAVIGATION_INFO.select.module}

Navigate Through About Tabs
    [Arguments]    ${tabs}
    [Documentation]    Iterates through each tab in the About section and validates navigation.
    FOR    ${tab}    IN    @{tabs.split(",")}
        Select About Tab    ${tab.strip()}
        Validate About Tab Is Displayed    ${tab.strip()}
    END

Close About Section
    [Documentation]    Closes the About section.
    Close About Section Window

Validate About Section Closed
    [Arguments]    ${expected_message}
    [Documentation]    Validates that the About section is closed successfully.
    Validate About Section Is Closed    ${expected_message}
