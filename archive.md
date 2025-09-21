---
layout: default
title: Archive
---

# Archive

All posts from the vault — insights from the past worth revisiting.

{% assign posts_to_skip = 5 %}
{% assign has_archive_posts = false %}

{% if site.posts.size > posts_to_skip %}
  {% assign has_archive_posts = true %}
{% endif %}

{% if has_archive_posts %}
{% assign current_year = "" %}
{% assign post_index = 0 %}
{% for post in site.posts %}
  {% assign post_index = post_index | plus: 1 %}
  {% if post_index > posts_to_skip %}
    {% assign post_year = post.date | date: '%Y' %}
    {% if post_year != current_year %}
      {% if current_year != "" %}</div>{% endif %}

## {{ post_year }}

<div class="archive-year">
      {% assign current_year = post_year %}
    {% endif %}

<article class="archive-post">
    <div class="archive-meta">
        <time datetime="{{ post.date | date_to_xmlschema }}">
            {{ post.date | date: "%b %d" }}
        </time>
    </div>
    <div class="archive-content">
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        {% if post.description %}
        <p class="archive-excerpt">{{ post.description }}</p>
        {% endif %}
    </div>
</article>
  {% endif %}
{% endfor %}

{% if current_year != "" %}</div>{% endif %}

{% else %}
No archived posts yet. All posts are recent!
{% endif %}