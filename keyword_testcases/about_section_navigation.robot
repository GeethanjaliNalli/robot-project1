*** Settings ***
Documentation     Test suite for verifying navigation in the About section. Logs in, opens About, navigates all tabs, and closes the section.
Resource          ../common/super.resource
Suite Setup       # Optionally add suite setup if required
Suite Teardown    # Optionally add suite teardown if required

*** Test Cases ***
Verify Navigation In The About Section
    [Documentation]    TC00002 - Verify that a user can login, open the About section, navigate through each tab, and close the About section successfully.
    [Tags]    Smoke    About    Navigation    Medium
    Login And Navigate Through About Section
