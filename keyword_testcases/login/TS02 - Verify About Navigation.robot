*** Settings ***
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource
Resource    ../../keywords/dashboard_page.resource
Resource    ../../keywords/login_page.resource
Resource    ../../objectrepository/dashboard_page.resource
Resource    ../../objectrepository/login_page.resource

Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Verify Navigation In About Section
    [Documentation]    TC00002 - LiLo: Verify that a user can login and navigate through each tab in the About section, then close the About section successfully.
    [Tags]    Regression    Smoke    About    Navigation
    [Setup]    Ensure User Is Logged In
    Navigate To About Section
    Navigate Through All About Tabs
    Close About Section
    Verify About Section Is Closed
    [Teardown]    Logout User
