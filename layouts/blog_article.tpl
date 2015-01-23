<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
	{% include "SiteHeader" %}
{{ blog.rss_link }}
  <title>{{article.title}} &laquo; {{page.title}} | {{site.name}}</title>
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
   <h2>{% editable article.title plain="true" %}</h2>
   <div class="blog-info">{{ article.created_at | format_date:"long" }}, <span>{{ article.author.name }}</span>, <a href="#comments">{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></a></div>
   <div data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
   <br /><br />
   <div data-search-indexing-allowed="true">{% editable article.body %}</div>
   <div class="hr"></div>

   <div id="comments">
    <h3>{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h3>
    <div class="hr"></div>
    {% for comment in article.comments %}
     <div class="edy-site-blog-comment">
     {{ comment.body }}
     <div class="blog-info">{{ comment.created_at | format_date:"long" }}.<span>{{ comment.author }}</span>{% removebutton %}</div>
     <div class="hr"></div>
     </div>  
    {% endfor %}	
    <h3>{{"add_a_comment"|lc}}</h3>
    <div class="hr"></div>
     {% commentform %}
      {% unless comment.valid? %}<div><ul>
      {% for error in comment.errors %}
      <li>{{ error | lc }}</li>
      {% endfor %}
      </ul></div>{% endunless %}
      <div class="formtitle left">{{"name"|lc}}</div>
      <div class="left"><input type="text" name="comment[author]" class="textbox" value="{{comment.author}}" /></div>
      <div class="clearer"></div>	
      <div class="formtitle left">{{"email"|lc}}</div>
      <div class="left"><input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" /></div>
      <div class="clearer"></div>  
      <div class="formtitle left">{{"comment"|lc}}</div>
      <div class="left"><textarea rows="7" cols="25" name="comment[body]">{{comment.body }}</textarea></div>
      <div class="clearer"></div>
      <div class="add left"><input type="submit" class="submit" value="{{"add_a_comment"|lc}}" /></div>
      <div class="clearer"></div>
     {% endcommentform %}
   </div>
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