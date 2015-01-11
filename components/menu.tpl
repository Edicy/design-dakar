   <ul id="menu">
   {% unless site.root_item.hidden? %}<li {% if site.root_item.current? %} class="selected"{% endif %}><div><a href="{{ site.root_item.url }}">{{site.root_item.title}}</a></div></li>{% endunless %}
   {% for item in site.visible_menuitems %}
   
{% if item.translated? %}
   <li{% if item.selected? %} class="selected"{% endif %}>
    <div><a href="{{ item.url }}">{{ item.title }}</a></div>
{% else %}
   <li class="untranslated {% if item.selected? %}selected{% endif %}">
    <div><a href="{{ item.url }}" class=" fci-editor-menuadd">{{ item.title }}</a></div>  
   
{% endif %}
    {% if item.selected? %}
	{% if editmode %}
         <ul class="submenu">
         {% for level2 in item.visible_children %}
           <li{% unless level2.translated? %} class="untranslated"{% endunless %}><a href="{{ level2.url }}" {% unless level2.translated? %}class="fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active"{% endif %}>{{ level2.title}}</a></li>
         {% endfor %}
             <li>{% menubtn item.hidden_children %}</li>
      <li>{% menuadd parent="item" %}</li>
         </ul>
	{% else %}
	{% if item.children? %}
         <ul class="submenu">
         {% for level2 in item.all_children %}
           <li{% unless level2.translated? %} class="untranslated  fci-editor-menuadd"{% endunless %}><a href="{{ level2.url }}" {% unless level2.translated? %}class="fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active"{% endif %}>{{ level2.title}}</a></li>
         {% endfor %}
         </ul>
	{% endif %}
	{% endif %}
    {% endif %}
   </li>
   
   {% endfor %}
             {% if editmode %}<li>{% menubtn site.hidden_menuitems %}</li>{% endif %}
   {% if editmode %}<li>{% menuadd %}</li>{% endif %}	
  </ul>
