---
layout: default
title: Archive
---

# All Posts

Here's a complete list of all blog posts:

{% assign eleven_months_ago = site.time | date: '%s' | minus: 28512000 | date:
'%Y-%m-%d' %} {% for post in site.posts %} {% assign post_date = post.date |
date: '%Y-%m-%d' %} {% if post_date < eleven_months_ago %}

<article class="post">
    <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    <div class="post-meta">
        <time datetime="{{ post.date | date_to_xmlschema }}">
            {{ post.date | date: "%B %d, %Y" }}
        </time>
    </div>
    {% if post.description %}
    <div class="excerpt">
        {{ post.description }}
    </div>
    {% endif %}
    <a href="{{ post.url }}" class="read-more">Read more →</a>
</article>
  {% endif %}
{% endfor %}
