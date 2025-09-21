---
layout: default
title: Home
---

# Code & Culture

![Banner]({{ '/assets/index.png' | relative_url }})

Here I explore how AI is reshaping software development, share insights from
building systems at scale, and dive into the evolving landscape of engineering
leadership.

Whether you're navigating the shift from IC to management, adapting to
AI-powered development workflows, or just curious about the future of tech,
you'll find practical insights and honest perspectives here.

{% assign recent_posts_count = 0 %}

{% for post in site.posts %}
  {% if recent_posts_count < 5 %}
    {% assign recent_posts_count = recent_posts_count | plus: 1 %}

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

{% if recent_posts_count == 0 %}

<p>No recent posts. <a href="/archive">Check the archive →</a></p>
{% else %}
<p><a href="/archive">View archived posts →</a></p>
{% endif %}
