
	
	$(document).on('click','.btn-sm', function() {
		
		$('#editphoto').click();
		
	});
	
	$(document).on('change','#editphoto', function() {
		
		const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		var file = $(this)[0].files[0];
		
		console.log(file);
		var location = $('#url-import').attr('href').split('/');
		var url = ctx+"/"+location[2]+"/profile/photo";
		console.log(url);
		var data = new FormData();
		data.append("photofile", file);
		
		console.log(data);
		
		var src = ctx+"/uploads/"+file.name;
		
		$.ajax({
			url: url,
			type: 'POST',
			data: data,
			processData: false,
			contentType: false,
			success : function(data) {
				
				console.log(data);
				
				$('.profile-img img').attr('src', src);
			}
		});
	});
