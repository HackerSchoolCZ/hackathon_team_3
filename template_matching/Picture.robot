*** Settings ***
Library    api.py                               
Library    SeleniumLibrary           
Test Setup    Open Browser And Maximize
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
CompareImage
    
    Set Screenshot Directory    Screenshot  
	Capture Page Screenshot    Screenshot-Alza.png  

    ${result}=    api.Match Template   Screenshot/Screenshot-Alza.png    ${GoodPicture}
    BuiltIn.Should Be True    ${result}    msg=Template was found on the website  
         
      
Compare Image Fails
    
    Set Screenshot Directory    Screenshot  
	Capture Page Screenshot    Screenshot-Alza.png  
    ${result}=    api.Match Template   Screenshot/Screenshot-Alza.png    ${BadPicture}
    
    BuiltIn.Should Be True    ${result}    msg=Template not found on the website  
            
    
    
*** Keywords ***
Open Browser And Maximize
    Open Browser    ${WebPageURL}    ${Browser}
    # Maximize Browser Window  
Capture Screenshot And Close Browser   
    #Capture Page Screenshot    
    Close Browser

*** Variables ***
${GoodPicture}    logo.png   
${BadPicture}    bad.png  
${WebPageURL}    https://alza.cz
${Browser}    chrome  