         

CompareImageTrue
    
    Set Screenshot Directory    Screenshot  
	Capture Page Screenshot    Screenshot-Alza.png  

    ${result}=    api.Match Template   Screenshot/Screenshot-Alza.png    ${GoodPicture}
    BuiltIn.Should Be True    ${result}    msg=Template was found on the website  
         
      
Compare Image Fails
    
    Set Screenshot Directory    Screenshot  
	Capture Page Screenshot    Screenshot-Alza.png  
    ${result}=    api.Match Template   Screenshot/Screenshot-Alza.png    ${BadPicture}
    
    BuiltIn.Should Be True    ${result}    msg=Template not found on the website  
            

