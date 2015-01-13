<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="et">
<head>
	{% include "SiteHeader" %}
	{{ blog.rss_link }}
  <title>{{site.name}} &raquo; {{page.title}}</title>
</head>
<body>
<div id="container">
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
  <div id="content-body" class="clearfix">
    {% addbutton class="add-article" %}

   {% for article in articles %}
    <h2><a href="{{ article.url }}" class="none">{{ article.title }}</a></h2>
    <div class="blog-info">{{ article.created_at | format_date:"long" }}, <span>{{ article.author.name }}</span>, <a href="{{ article.url }}#comments">{{"comments_for_count"|lc}}: {{ article.comments_count }}</a></div>
    {{ article.excerpt }} <a href="{{ article.url }}">{{"read_more"|lc}}</a>	
    {% unless forloop.last %}<div class="hr"></div>{% endunless %}
   {% endfor %}	
  </div>	
  <div class="clearer"></div>
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