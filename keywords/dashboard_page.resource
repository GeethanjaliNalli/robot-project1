*** Settings ***
Documentation    This dashboard page Resource file has all the dashboard keywords
Resource    ../Common/super.resource


*** Keywords ***
Validate Dashboard Is Displayed
    [Documentation]    Verifies that the Dashboard page is successfully loaded.
    ...  Checks that the Diary link is visible to confirm page display.
    Get Element States    ${link.diary}     contains    visible

Logout From The Application
    [Documentation]    Logs out from the application by clicking the logout button.
    ...  Ensures the user session ends and the application returns to the login page.
    Click    ${button.logout}
