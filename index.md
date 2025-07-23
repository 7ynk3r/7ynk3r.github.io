---
layout: default
title: Home
---

# Welcome to My Blog

This is where I share my thoughts, experiences, and insights about technology,
life, and everything in between.

<br/>

{% for post in site.posts limit:5 %}

<article class="post">
    <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    <div class="post-meta">
        <time datetime="{{ post.date | date_to_xmlschema }}">
            {{ post.date | date: "%B %d, %Y" }}
        </time>
        {% if post.author %}
        <span class="author">by {{ post.author }}</span>
        {% endif %}
    </div>
    {% if post.description %}
    <div class="excerpt">
        {{ post.description }}
    </div>
    {% endif %}
    <a href="{{ post.url }}" class="read-more">Read more →</a>
</article>
{% endfor %}

{% if site.posts.size > 5 %}

<p><a href="/archive">View all posts →</a></p>
{% endif %}
