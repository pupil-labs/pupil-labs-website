--- 
title: Pupil Capture, Player, and Service Release v0.9.12
date: Fri May 23 2017 17:34:00 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "We are pleased to announce the latest release of the Pupil Platform v0.9.12..."
tag: {"caption":"v0.9.12","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.9.12",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.9.12">Download v0.9.12</a>'  
        $('section[class~="content"]').html(html);
      }
    });
  });
});
</script>