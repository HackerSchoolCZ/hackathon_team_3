*** Settings ***
Library    ../Libraries/api.py                                       
Library    SeleniumLibrary           
Test Setup    Open Browser And Maximize
Test Teardown    Capture Screenshot And Close Browser
    

*** Test Cases ***

Test Front Page
    Compare Image   Screenshot-Alza.png    wrong.png    alza-logo.png        

    
*** Keywords ***
Open Browser And Maximize
    Open Browser    ${WebPageURL}    ${Browser}
    # Maximize Browser Window  
    
Capture Screenshot And Close Browser
    Set Screenshot Directory    ../Screenshot   
    Capture Page Screenshot    
    Close Browser

Compare Image
    [Arguments]    ${screenshot_name}     @{file_paths}
    [Documentation]     Takes in screenshot_name and list of picture names to compare the screenshot with.
    Set Screenshot Directory    ../Screenshot
    Capture Page Screenshot    ${screenshot_name}
    :FOR    ${filename}     IN    @{file_paths}  
    \    ${result}=    api.Match Template    ../Screenshot/${screenshot_name}    ../Pictures/${filename}
    \    BuiltIn.Log    Testing ${filename}    console=True
    \    BuiltIn.Run Keyword And Continue On Failure    BuiltIn.Should Be True    ${result}    msg=Template not found on the website ${filename}    
    

*** Variables *** 
${WebPageURL}    https://alza.cz
${Browser}    chrome  
