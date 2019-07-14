<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chart.css">
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->
	<!-- ##### Blog Wrapper Area Start ##### -->
    <div class="single-blog-wrapper">

        <!-- Single Blog Post Thumb -->
        <div class="single-blog-post-thumb">
            <img src="${pageContext.request.contextPath}/resources/img/bg-img/bg-7.jpg" alt="">
        </div>

        <!-- Single Blog Content Wrap -->
        <div class="single-blog-content-wrapper d-flex">

            <!-- Blog Content -->
            <div class="single-blog--text">

                <div id="chartdiv"></div>
                <table class="table" id="tagTable">
               </table> 
            </div>

            <!-- Related Blog Post -->
            <div class="related-blog-post">
                <!-- Single Related Blog Post -->
                <div class="single-related-blog-post" id="ko">
                    <img src="${pageContext.request.contextPath}/resources/img/bg-img/rp1.jpg" alt="">
                    <a href="#">
                        <h5>한국어</h5>
                    </a>
                    
                </div>
                <!-- Single Related Blog Post -->
                <div class="single-related-blog-post" id="en">
                    <img src="${pageContext.request.contextPath}/resources/img/bg-img/rp2.jpg" alt="">
                    <a href="#">
                        <h5>English</h5>
                    </a>
                </div>
                <!-- Single Related Blog Post -->
                <div class="single-related-blog-post" id="zh">
                    <img src="${pageContext.request.contextPath}/resources/img/bg-img/rp3.jpg" alt="">
                    <a href="#">
                        <h5>中國語</h5>
                    </a>
                </div>
                <!-- Single Related Blog Post -->
                <div class="single-related-blog-post" id="ja">
                    <img src="${pageContext.request.contextPath}/resources/img/bg-img/rp4.jpg" alt="">
                    <a href="#">
                        <h5>日本語</h5>
                    </a>
                </div>
            </div>

        </div>
    </div>
    <!-- ##### Blog Wrapper Area End ##### -->
	
	<!-- 본문 끝 -->
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <!-- js파일 ! -->
        
    <!-- chart -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/plugins/wordCloud.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/dataviz.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

	<!-- Chart code -->
	<script>
    am4core.ready(function() {
    		var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    		
    		var curl = ctx + "/shops" +"/tagrank";
    		
    		var param = {"country" : "KO"}
    		
    		$.getTagCloud = function (param) {
    		   	 $.ajax({
    					type : "GET",
    					data : param,
    					url : curl,
    					success : function(data) {
    						
    						console.log(data);
    					    // Themes begin
    					    am4core.useTheme(am4themes_dataviz);
    					    am4core.useTheme(am4themes_animated);
    					    // Themes end
    					    
    					    var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
    					    chart.fontFamily = "Courier New";
    					    var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());
    					    series.randomness = 0.1;
    					    series.rotationThreshold = 0.5;
    					   
    					    series.data = data;
    					    
    					    
    					    series.dataFields.word = "tag";
    					    series.dataFields.value = "count";
    					    
    					    series.heatRules.push({
    					        "target": series.labels.template,
    					        "property": "fill",
    					        "min": am4core.color("#0000CC"),
    					        "max": am4core.color("#CC00CC"),
    					        "dataField": "value"
    					    });

    					    
    					    series.labels.template.url = "https://stackoverflow.com/questions/tagged/{word}";
    					    series.labels.template.urlTarget = "_blank";
    					    series.labels.template.tooltipText = "{word}: {value}";
    					    
    					    var hoverState = series.labels.template.states.create("hover");
    					    hoverState.properties.fill = am4core.color("#FF0000");
    					    
    					    var subtitle = chart.titles.create();
    					    subtitle.text = "";
    					    
    					    var title = chart.titles.create();
    					    title.text = "Tag Check";
    					    title.fontSize = 30;
    					    title.fontWeight = "800";

    					} //success : function(data) {
    			}); // $.ajax({

    		}
 		   		
    		$.getTagTable = function (param) {
    			var curl2 = ctx + "/shops" +"/tagtable";
    		   	$.ajax({
    					type : "GET",
    					data : param,
    					url : curl2,
    					success : function(tabledata) {
    						$('#tagTable *').remove();
    						console.log(tabledata);
    						
    						var jsonTable="<tr><th>순위</th><th>전주순위</th><th>전주대비</th><th>태그</th><th>태그가격</th></tr>";
    						
    						$.each(tabledata,function(index, item){
    	                        jsonTable += '<tr><td>' + item.rank +'</td>' +
    										'<td>' + item.previous +'</td>' +
    										'<td>' + item.differ +'</td>' +
    										'<td>' + item.tagsName +'</td>' +
    										'<td>' + item.price +'</td></tr>';
    	                        
    	                        
    						});
    						$('#tagTable').append(jsonTable);

    					} //success : function(data) {
    			}); // $.ajax({

    		}
    			

		$.getTagCloud(param);
		$.getTagTable(param);

    		$("#ko").click(function(){
    			var param = {"country" : "KO"}
    			$.getTagCloud(param);
    			$.getTagTable(param);
    		});		
    		
    		$("#en").click(function(){
    			var param = {"country" : "EN"}
    			$.getTagCloud(param);
    			$.getTagTable(param);
    		});		

    		$("#zh").click(function(){
    			var param = {"country" : "ZH"}
    			$.getTagCloud(param);
    			$.getTagTable(param);
    		});		
    		
    		$("#ja").click(function(){
    			var param = {"country" : "JA"}
    			$.getTagCloud(param);
    			$.getTagTable(param);
    		});		

    }); // end am4core.ready()
    </script>