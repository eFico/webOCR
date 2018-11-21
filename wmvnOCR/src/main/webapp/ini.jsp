<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload Example in JSP and Servlet - Java web application</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
<script>
$(document).ready(function() {


	
	$("#uploadBtn").on("click", function() {
		var url = "upload";
		var form = $("#sampleUploadFrm")[0];
		var data = new FormData(form);
		/* var data = {};
		data['key1'] = 'value1';
		data['key2'] = 'value2'; */
		$.ajax({
			type : "POST",
			encType : "multipart/form-data",
			url : url,
			cache : false,
			processData : false,
			contentType : false,
			data : data,
			success : function(msg) {
				
				 $('#textRes').html(msg);

			},
			error : function(msg) {
				alert("Couldn't upload file");
			}
		});
	});
});




</script>
</head>
 
<body>

<div id="image_frame">fgfgg
   <div id='img_contain'>
    <img id="blah" align='middle' width="100" height="100" src="http://www.clker.com/cliparts/c/W/h/n/P/W/generic-image-file-icon-hi.png" alt="your image" title=''/>
    </div>
    
    </div>
    
    <div id="textRes">xxxxx

    
    </div>
    
			<form id="sampleUploadFrm" method="POST" action="#" enctype="multipart/form-data">
				<!-- COMPONENT START -->
				<div class="form-group">
				
				    <input type='file'  onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])" />
 


				</div>
				<!-- COMPONENT END -->
				<div class="form-group">
					<button type="button" class="btn btn-primary pull-right" id="uploadBtn">Submit</button>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</form>

</body>
</html>