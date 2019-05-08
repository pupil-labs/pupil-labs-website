---
title: Pupil Capture, Player, and Service Release v1.12
date: Tue May 07 2019 10:10:10 GMT+0700 (+07)
author: Pupil Dev Team
subtitle: "We are pleased to announce the latest release of Pupil software v1.12..."
tag: {"caption":"v1.12","icon":"local_offer"}
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) {
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v1.12",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v1.12">Download v1.12</a>';
        $('section[class~="content"]').html(html);
      }
    })
;  });
});
</script>
