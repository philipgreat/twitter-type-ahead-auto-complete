<%
response.setCharacterEncoding("UTF-8");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="/WEB-INF/shopizer-tags.tld" prefix="sm" %>
<%@ taglib uri="/WEB-INF/shopizer-functions.tld" prefix="display" %> 

<!-- TT Typeahead js files -->
<script src="<c:url value="/resources/templates/bootstrap3/js/bloodhound.min.js" />"></script>
<script src="<c:url value="/resources/templates/bootstrap3/js/typeahead.bundle.min.js" />"></script>
<script src="<c:url value="/resources/js/navbar.js" />"></script>
<style>


.twitter-typeahead, .tt-hint, .tt-input, .tt-menu,.tt-dropdown-menu { width: 100%; }

.tt-menu,.tt-dropdown-menu { width: 100%; background-color:black }

</style>
<script type="text/javascript">

   $(document).ready(function() { 	
	getMobileNavMenu('<c:url value="/shop/category/"/>');
    //post search form
	$("#searchButton").click(function(){
		var searchQuery = $('#searchField').val();
		$('#hiddenQuery').val(searchQuery);
		log('Search string : ' + searchQuery);
        $('#hiddenSearchForm').submit();
   });

   var typeSuggests = new Bloodhound({
				datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name);},
				queryTokenizer: Bloodhound.tokenizers.whitespace,
				prefetch: '/m/services/public/search/default/zh/autocomplete.html?q=cck-8',
				remote: {
					url: '/m/services/public/search/default/zh/autocomplete.html?q=%QUERY',
					wildcard: '%QUERY'
				}
			});

			typeSuggests.initialize();

			$('#searchInput').typeahead({
						hint: false,
						highlight: true,
						minLength: 1
					},{
						name: 'students',
						displayKey: 'name',
						source: typeSuggests.ttAdapter(),
					});

});

</script>

<c:set var="req" value="${request}" />
 
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<div style="padding:10px 0px;">
	<div class="content-padding-lr">
		<form id="searchForm" style="margin-bottom:0px;" method="post" action="<c:url value="/shop/search/search.html"/>" >
			<div class="input-group " >
				<input id ="searchInput" name="q" type="text" class="form-control" style="border: 1px solid #3c78d8;" placeholder="<s:message code="label.search.searchQuery" text="Search query" />" autocomplete="off" spellcheck="false" dir="auto" value="<c:out value="${q}"/>"/>
				 <span class="input-group-btn">
					<button class="btn btn-default"  style="border: 1px solid #3c78d8;" type="button" onClick="doEzybioSearch()"><img style="height:26px" src="<c:url value="/resources/img/search24.png"/>"/></button>
				  </span>
			</div>	  
		</form>
	</div>	
</div>
<div class="pull-left"  id="topmenu"></div>
					
		



