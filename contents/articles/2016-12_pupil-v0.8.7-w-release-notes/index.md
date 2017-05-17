--- 
title: Pupil Capture and Pupil Player release for Windows 10
date: Wed Dec 14 2016 14:27:10 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "We are very happy to announce that Pupil support is now supported on Windows 10! Release notes for v0.8.7-w for the Pupil Platform..."
tag: {"caption":"v0.8.7-w","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.8.7-w",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        $('section[class~="content"]').html(html);
        $('a[href="#downloads"]').prop('href',data.data.html_url);
      }
    });
  });
});
</script>
