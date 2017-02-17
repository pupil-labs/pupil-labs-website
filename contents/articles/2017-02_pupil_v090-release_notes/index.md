--- 
title: Pupil Capture, Player, and Service Release v0.9.0
date: Friday Feb 17 2017 18:44:00 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "We are very happy to announce the latest release of the Pupil Platform v0.9.0..."
tag: {"caption":"v0.9.0","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.9.0",
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
