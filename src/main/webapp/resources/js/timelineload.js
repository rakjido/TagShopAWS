$(function() {
	console.log($('.photo-grid .grid').length);
	$('.photo-grid .grid').slice(0, 6).show(); // 최초 10개 선택
	$(".load-more").click(function(e) { // Load More를 위한 클릭 이벤트e
		e.preventDefault();
		$(".photo-grid .grid:hidden").slice(0, 3).show(); // 숨김 설정된 다음 10개를 선택하여 표시
		if ($(".photo-grid .grid:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
			alert("더 이상 항목이 없습니다"); // 더 이상 로드할 항목이 없는 경우 경고
		}
	});
});