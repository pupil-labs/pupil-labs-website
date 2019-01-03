---
title: Pupil Capture, Player, and Service Release v1.10
date: Thu Jan 03 2019 15:20:12 GMT+0700 (+07)
author: Pupil Dev Team
subtitle: "We are pleased to announce the latest release of Pupil software v1.10..."
tag: {"caption":"v1.10","icon":"local_offer"}
---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) {
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v1.10",
      dataType: "jsonp",
      success: function(data, textStatus,jaXHR){
        var converter = new showdown.Converter();
        var text = data.data.body;
        var html = converter.makeHtml(text);
        html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v1.9">Download v1.10</a>';
        $('section[class~="content"]').html(html);
        $('#features').css("padding-top", "28px");
        $('#realsensed400support1409httpsgithubcompupillabspupilpull1409').css("padding-top", "12px");
        $('#player').css("padding-top", "16px");
        $('#commandlinearguments1384httpsgithubcompupillabspupilpull1384').css("padding-top", "12px");
        $('#bugfixes').css("padding-top", "28px");
        $('#developersnotes').css("padding-top", "28px");
      }
    })
;  });
});
</script>
