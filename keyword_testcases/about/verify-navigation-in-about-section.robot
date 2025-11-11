*** Settings ***
Documentation     Test suite for verifying navigation in the About section.
...               Test Case ID: TC00002 - About
...               Objective: Login and navigate to each tab in 'About' Module.
...               Preconditions: A valid user name and password combination.
...               Expected Result: Site log in page should open with fields to enter username and password. Buttons on the page: Login button, Login with face recognition and Login with keyfob buttons; Login to GoodX and open on Diary; About section will be open with the first tab - App info; User should be navigated to Medical Aid Contracts tab; User should be navigated to User Manual tab; User should be navigated to Changelog tab; User should be navigated to Services tab; About Section will be closed.
Resource          ../../common/super.resource
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Verify Navigation in the About section
    [Documentation]    Login and navigate through all tabs in the About section, verifying each navigation.
    [Tags]    smoke    regression    about    navigation
    Login With Valid Credentials
    Go To Dashboard
    Open About Section
    About Section Should Be Opened
    Navigate To About Tab    App Info
    About Tab Should Be Opened    App Info
    Navigate To About Tab    Medical Aid Contracts
    About Tab Should Be Opened    Medical Aid Contracts
    Navigate To About Tab    User Manual
    About Tab Should Be Opened    User Manual
    Navigate To About Tab    Changelog
    About Tab Should Be Opened    Changelog
    Navigate To About Tab    Services
    About Tab Should Be Opened    Services
    Close About Section
    About Section Should Be Closed
