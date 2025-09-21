---
layout: default
title: Home
---

# Building Systems & Leading Teams

Here I explore how AI is reshaping software development, share insights from
building systems at scale, and dive into the evolving landscape of engineering
leadership.

Whether you're navigating the shift from IC to management, adapting to
AI-powered development workflows, or just curious about the future of tech,
you'll find practical insights and honest perspectives here.

{% for post in site.posts limit:5 %}

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
{% endfor %}

{% if site.posts.size > 5 %}

<p><a href="/archive">View all posts →</a></p>
{% endif %}
