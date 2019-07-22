$(function() {
	var keyname = '';
	var appendUl = '';
	var keyword = '';
	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var isRun = false;
	
	/*$('#autocomplete').blur(function(){
		$('#searchDiv .dropdown-content').remove();
	});*/
	
	$('#autocomplete').keyup(function(){
		
		$('#searchDiv .dropdown-content').remove();
		
		keyword = $('#autocomplete').val();
		
		keyword = keyword.replace(/ /gi, '');
		

		console.log(keyword);
		
        console.log("before  " + keyword);
        

        
		if(keyword == null || keyword == ''){
			keyword = 'default';
		}
		
		
		var namePattern = /#/;
		var isTag = namePattern.test($('#autocomplete').val());     // true
		
		
		console.log("after  " + keyword);
		
		if(keyword === 'default'){ // 공백 null 거르기
			
			appendUl = '<ul class="autocomplete-content dropdown-content"><li><span>값을 넣어주세요</span></li></ui>';
			$('#searchDiv').append(appendUl);
			
		} else { //값이 있으면 비동기 !
			
			if(isTag){ // #이 있으면 실행 
					
					keyword = keyword.replace(regExp,"");
					
					if(keyword == null || keyword == ''){
						keyword = 'default';
					}
					console.log('searchTagName/' + keyword);
					if(keyword == 'default'){
						appendUl = '<ul class="autocomplete-content dropdown-content"><li><span>값을 넣어주세요</span></li></ui>';
						$('#searchDiv').append(appendUl);
					} else {
						
						if(isRun == true) {
				            return;
				        }
						isRun = true;
						
						$.ajax({
							type : "GET",
							url : ctx+'/searchTagName/' + keyword,
							success : function(data) {
								isRun = false;
								appendUl = '<ul class="autocomplete-content dropdown-content">';
								if(data.length < 1 || data == undefined){
									appendUl += '<li><span>일치하는 결과가 없습니다</span></li>';
								} else {
									$.each(data,function(index, item){
										appendUl += '<li><span>#' + item + '</span></li>';
									});
								}
								
								appendUl+='</ui>';
								$('#searchDiv').append(appendUl);
								
							}
						
						});

					}
					
					
			} else { // #이 없으면 실행 
				
				if(isRun == true) {
		            return;
		        }
				isRun = true;
				$.ajax({
					type : "GET",
					url : ctx+'/searchUserid/' + keyword,
					success : function(data) {
						
						isRun = false;
						
						appendUl = '<ul class="autocomplete-content dropdown-content">';
						if(data.length < 1 || data == undefined){
							appendUl += '<li><span>일치하는 결과가 없습니다</span></li>';
						} else {
							$.each(data,function(index, item){
								appendUl += '<li><span>' + item + '</span></li>';
							});
						}
						
						appendUl+='</ui>';
						$('#searchDiv').append(appendUl);
					}
				});					
			}
			
		}
		
			
				
			
		});
	
	$(document).on('click','.dropdown-content li',function(){
		$('#autocomplete').val($('span',this).text());
		$('#searchDiv .dropdown-content').remove();
	});
	
	$(document).on('click', function(e){
		$('#searchDiv .dropdown-content').remove();
	});
		
		
});


