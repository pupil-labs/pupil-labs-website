--- 
title: Pupil Capture, Player, and Service Release v1.9
date: Wed Nov 7 2018 10:30:00 GMT+0000 (+00) 
author: Pupil Dev Team 
subtitle: "We are pleased to announce the latest release of Pupil software v1.9..."
tag: {"caption":"v1.9","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v1.9",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v1.9">Download v1.9</a>';  
        $('section[class~="content"]').html(html);
      }
    })
;  });
});
</script>
