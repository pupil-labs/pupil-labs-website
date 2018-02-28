--- 
title: Pupil Capture, Player, and Service Release v1.5
date: Wed Feb 28 2018 17:38:07 GMT+0700 (ICT) 
author: Pupil Dev Team 
subtitle: "We are pleased to announce the latest release of the Pupil Platform v1.5..."
tag: {"caption":"v1.5","icon":"local_offer"} 
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v1.5",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v1.5">Download v1.5</a>';  
        $('section[class~="content"]').html(html);
        var _img = document.getElementsByTagName('img')[0];
        var _parent = _img.parentElement;
        var _parent_p = _parent.parentElement;
        _img.className = "u-padBottom--1";
        _parent.setAttribute('style','display:grid;');
        _img.setAttribute('style','width:80%;justify-self:center;');
      }
    })
;  });
});
</script>