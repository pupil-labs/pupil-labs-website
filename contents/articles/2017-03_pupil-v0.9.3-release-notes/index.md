--- 
title: Pupil v0.9.3 release notes 
date: Mon Mar 21 2017 17:39:47 GMT+0200 (CEST) 
author: Pupil Dev Team 
subtitle: "We are pleased to announce the latest release of the Pupil Platform v0.9.3..."
tag: {"caption":"v0.9.3","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.9.3",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.9.3">Download v0.9.3</a>'  
        $('section[class~="content"]').html(html);
      }
    });
  });
});
</script>
