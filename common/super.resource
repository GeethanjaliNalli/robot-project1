*** Settings ***
Documentation       This super.resource file has all imported Libraries and Resources
Library             Collections
Library             DateTime
Library             OperatingSystem
Library             String
Library             Browser
Library             ../library/CustomLibrary.py
Resource            ../common/global_config.resource
Resource            ../keywords/common_keywords.resource
Resource            ../keywords/login_page.resource
Resource            ../keywords/dashboard_page.resource
Resource            ../objectrepository/login_page.resource
Resource            ../objectrepository/dashboard_page.resource
