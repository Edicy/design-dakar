		{% if site.search.enabled %}
<!--[if IE]>
<style type="text/css">
#search input.submit {
position: relative;
top: 1px;
}
</style>
<![endif]-->	
		<form action="" id="search" class="edys-search">
			<div class="right"><input type="submit" class="submit" value="" /></div>
			<div class="right"><input type="text" class="textbox" id="onpage_search" placeholder="{{  "search" | lc }}" /></div>
		</form>
		{% endif %}