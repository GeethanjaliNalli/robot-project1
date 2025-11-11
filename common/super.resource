*** Settings ***
Resource    ../objectrepository/dashboard_page.resource
Resource    ../objectrepository/login_page.resource
Resource    ../objectrepository/about_page.resource
Resource    global_config.resource
Library     ../library/CustomLibrary.py

# Existing imports retained. Added import for about_page.resource for About section locators.
