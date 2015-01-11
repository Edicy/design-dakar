		<ul id="lang">			
			{% if site.has_many_languages? %}
			{% for language in site.languages %}
			<li><a href="{{ language.url }}" {% if language.selected? %}class="active"{% endif %}>{{ language.title }}</a>{% unless forloop.last %} |{% endunless %}</li> 
			{% endfor %}	
			{% endif %}
			<li>&nbsp;{% if editmode %}{%languageadd%}{% endif %}</li>
		</ul>