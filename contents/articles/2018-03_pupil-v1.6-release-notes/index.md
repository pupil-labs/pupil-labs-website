--- 
title: Pupil Capture, Player, and Service Release v1.6
date: Mon Mar 21 2018 10:19:23 GMT+0700 (+07) 
author: Pupil Dev Team 
subtitle: "We are pleased to announce the latest release of the Pupil Platform v1.6..."
tag: {"caption":"v1.6","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v1.6",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v1.6">Download v1.6</a>';  
        $('section[class~="content"]').html(html);
      }
    })
;  });
});
</script>
