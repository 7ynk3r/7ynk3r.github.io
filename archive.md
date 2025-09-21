---
layout: default
title: Archive
---

# Archive

All posts from the vault — insights from the past worth revisiting.

{% assign one_month_ago = site.time | date: '%s' | minus: 2592000 %}
{% assign has_old_posts = false %}

{% for post in site.posts %}
  {% assign post_date_seconds = post.date | date: '%s' | plus: 0 %}
  {% if post_date_seconds < one_month_ago %}
    {% assign has_old_posts = true %}
    {% break %}
  {% endif %}
{% endfor %}

{% if has_old_posts %}
{% assign current_year = "" %}
{% for post in site.posts %}
  {% assign post_date_seconds = post.date | date: '%s' | plus: 0 %}
  {% if post_date_seconds < one_month_ago %}
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
No archived posts yet. Check back later!
{% endif %}