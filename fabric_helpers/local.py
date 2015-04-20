import sys
from datetime import datetime

TEMPLATE = """
Title: {title}
Hashes: {hashes}
Date: {year}-{month}-{day} {hour}:{minute:02d}
Tags:
Category:
Slug: {slug}
Summary:
Status: draft

"""


def new_post(title):
    today = datetime.today()
    slug = title.lower().strip().replace(' ', '-')
    fname = "content/blog/{}-{:0>2}-{:0>2}-{}.md".format(
        today.year, today.month, today.day, slug)
    t = TEMPLATE.strip().format(title=title,
                                hashes='#' * len(title),
                                year=today.year,
                                month=today.month,
                                day=today.day,
                                hour=today.hour,
                                minute=today.minute,
                                slug=slug)
    with open(fname, 'w') as w:
        w.write(t)
    return fname
