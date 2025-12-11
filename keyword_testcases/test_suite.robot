*** Settings ***
Documentation    Test suite for login and About section navigation scenarios
Resource         ../common/super.resource
Test Setup       Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***

# TC_01 Validate User Is Able To Login The Application With Valid Username And Password
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

TC00002 - Verify Navigation in the About section
    [Documentation]    Login and navigate to each tab in 'About' Module. User should be able to log in and navigate through each tab in the About section successfully, and then close the About section.
    # Step 1: Click on the About button from dashboard
    Open About Section    ${button.about}
    # Step 2: Navigate to Medical Aid Contracts tab
    Navigate To About Tab    ${tab.medical_aid_contracts}
    # Step 3: Navigate to User Manual tab
    Navigate To About Tab    ${tab.user_manual}
    # Step 4: Navigate to Changelog tab
    Navigate To About Tab    ${tab.changelog}
    # Step 5: Navigate to Services tab
    Navigate To About Tab    ${tab.services}
    # Step 6: Close the About section
    Close About Section    ${button.close_about}
