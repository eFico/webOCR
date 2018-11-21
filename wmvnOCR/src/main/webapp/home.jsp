<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OCR & ICR</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		function bs_input_file() {
			$(".input-file").before(
				function() {
					if ( ! $(this).prev().hasClass('input-ghost') ) {
						var element = $("<input type='file'  name='imagen' class='input-ghost' style='visibility:hidden; height:0'>");
						element.attr("name",$(this).attr("name"));
						element.change(function(){
							element.next(element).find('input').val((element.val()).split('\\').pop());
							document.getElementById('blah').src = window.URL.createObjectURL(this.files[0]);
						});
						$(this).find("button.btn-choose").click(function(){
							element.click();
						});
						$(this).find("button.btn-reset").click(function(){
							element.val(null);
							$(this).parents(".input-file").find('input').val('');
						});
						$(this).find('input').css("cursor","pointer");
						$(this).find('input').mousedown(function() {
							$(this).parents('.input-file').prev().click();
							return false;
						});
						return element;
					}
				}
			);
		}
		
		bs_input_file();
		
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
					
					 $('#image_frame').html(msg);

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


	<div class="container">
	
<div class="col-md-8 col-md-offset-2">
	  <div id="imagenPre" class="col-xs-12 col-md-6">

 <img id="blah" align='middle' width="300" height="300" src="http://www.clker.com/cliparts/c/W/h/n/P/W/generic-image-file-icon-hi.png" alt="your image" title=''/>


	</div>
	<div id="image_frame" class="col-md-6">fgfgg


	</div>
</div>
	

	
	
	
		<div class="col-md-8 col-md-offset-2">
			<h3>OCR & ICR</h3>
			<form id="sampleUploadFrm" method="POST" action="#" enctype="multipart/form-data">
				<!-- COMPONENT START -->
				<div class="form-group">
					<div class="input-group input-file" name="file">
						<span class="input-group-btn">
							<button  id="imgInp" class="btn btn-default btn-choose" type="button">Choose</button>
						</span> <input type="text" class="form-control"
							placeholder='Choose a file...' /> <span class="input-group-btn">
							<button class="btn btn-warning btn-reset" type="button">Reset</button>
						</span>
					</div>
					<select name="lenguaje" id="lenguaje">
					  <option value="eng">eng</option>
					  <option value="icr">icr</option>

					</select>
				</div>
				<!-- COMPONENT END -->
				<div class="form-group">
					<button type="button" class="btn btn-primary pull-right" id="uploadBtn">Submit</button>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>