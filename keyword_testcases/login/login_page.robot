*** Settings ***
Documentation    This File has all the Test Cases related to the login page
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Handle Attention Alert    dismiss
    Validate Dashboard Is Displayed
    Logout From The Application
    Handle Attention Alert    dismiss
    Logout From The Application
    Handle Attention Alert    accept

TC_02 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate to the About section, access all tabs, and close the About dialog successfully.
    ...    Ensures About section navigation works as expected after login.
    ...    Confirms all About tabs are accessible and About dialog can be closed.
    Open About Section
    Navigate Through All About Tabs
    Close About Section
