	function likecheck(userid, photoid) {
				
				
				var likes = {
					photoId : photoid,
					usersUserId : userid,
					likeYn : false,
					buyYn : false
				}
				var jsonlikes = JSON.stringify(likes);
				
				$.ajax({
					url : "likecheck",
					dataType : 'json',
					type : "POST",
					data : jsonlikes,
					contentType : 'application/json; charset=UTF-8',
					success : function(data) {
					}
			
				})
			}

			
			function followcheck(followingid, usersuserid) {
				
				
				$.ajax({
					url: "photos/followcheck",
					type: "POST",
					data: {followingid: followingid, usersuserid: usersuserid},
					success: function(data) {
						
						
						console.log(data);
						if(data != ""){
							$('.sqdOPaB').text("팔로잉");
						}else {
							$('.sqdOPaB').text("팔로우");
						}
					}
				})
				
			}