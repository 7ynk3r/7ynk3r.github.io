---
layout: default
title: Archive
---

# All Posts

Here's a complete list of all blog posts:

{% for post in site.posts %}

<article class="post" data-pubdate="{{ post.date | date_to_xmlschema }}">
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
{% endfor %}
