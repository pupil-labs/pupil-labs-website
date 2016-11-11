--- 
title: Pupil v0.8.6 release notes
date: Fri Nov 04 2016 12:20:39 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "Release notes for v0.8.6 for the Pupil Platform. Includes updates for improved surface tracker performance and interface, UI improvements, and more..." 
tag: {"caption":"v0.8.6","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.8.6",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.8.6">Download v0.8.6</a>'  
        $('section[class~="content"]').html(html);
      }
    });
  });
});
</script>