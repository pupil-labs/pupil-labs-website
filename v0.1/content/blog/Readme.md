# Adding Posts to the blog
We're using a hierarchial directory structure:
  * Year (e.g. 2013)
    * Month (e.g. 10)
      * post-title.html

You can just make a new folder for the month and then add the post title.  

# Writing a new post
  * Posts are written in markdown.  
  * Write the body of the posts between `{% mark body -%}` and `{%- endmark %}`
  * We are not currently using the excerpt marks, but could in the future, so put something within that that summarizes the post or the first few lines of the post.