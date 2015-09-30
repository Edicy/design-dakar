<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
	{% include "SiteHeader" %}
  <title>{{ page.site_title }} &raquo; {{page.title}}</title>
</head>
<body>
<div id="container" class="content-hyphenate">
	<div id="lang-and-search">
   <div id="lang-and-search-inner">
   <div id="lang-and-search-inner2">
  {% include "Langmenu" %}
  {% include "Search" %}
  <div class="clearer"></div>
     </div>
   </div>
	</div>	
	<div id="heading" class="clearfix">
  <h1 class="clearfix">{% editable site.header %}</h1>
	</div>
	<div id="content">
  {% include "Menu" %}
  <div id="content-body" class="clearfix" data-search-indexing-allowed="true">
   {% content %}
  </div><div class="clearer"></div>
	</div>
	<div id="footer">
  <div class="left clearfix">
   {% content name="footer" xpage="true" %}
  </div>
  
  <div class="right" id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
  <div class="clearer"></div>
	</div>

</div>
{% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>