*** Settings ***
Documentation     Test suite to verify navigation in the About section
Resource          ../common/super.resource
Resource          ../keywords/about_page.resource

Suite Setup       # Optionally, add suite setup if needed
Suite Teardown    # Optionally, add suite teardown if needed

*** Test Cases ***
Verify Navigation in the About Section
    [Documentation]    Verify that the About section can be opened, validated, and closed successfully
    [Tags]    Smoke    Regression    AboutSection
    Open About Section
    Verify About Section Is Displayed
    Close About Section
    Verify About Section Is Closed
