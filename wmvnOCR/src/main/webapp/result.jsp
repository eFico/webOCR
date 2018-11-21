 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado</title>
    </head>
 
    <body> 
        <div id="result">
            <h3>${requestScope["message"]}</h3>
             <h6>${requestScope["ruta"]}</h6>
        </div>
        
       <!-- comment 
        <img src="uploads/${requestScope["name"]}" width="300" height="300" alt="Girl in a jacket">
        -->
        
        <div>
        <h4>${requestScope["texto"]}</h4>
        </div>
      
    </body>
</html>
