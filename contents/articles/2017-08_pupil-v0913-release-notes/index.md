--- 
title: Pupil Capture, Player, and Service Release v0.9.13
date: Thu Aug 03 2017 14:36:00 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "We are pleased to announce the latest release of the Pupil Platform v0.9.13..."
tag: {"caption":"v0.9.13","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.9.13",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var regex = /(https...w).+/g;
        var embed_link = '<div class="Feature-video-container-16by9"><iframe class="Feature-video u-padTop--2" src="https://www.youtube.com/embed/lPtwAkjNT2Q?rel=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>';
        var embed_text = text.replace(regex, embed_link);
        var html = converter.makeHtml(embed_text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.9.13">Download v0.9.13</a>'  
        $('section[class~="content"]').html(html);
      }
    });
  });
});
</script>