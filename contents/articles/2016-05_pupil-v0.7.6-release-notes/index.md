---
 title: Pupil v0.7.6 release notes
 date: Wed May 11 2016 15:55:37 GMT+0700 (ICT)
 author: Pupil Dev Team
 subtitle: Release notes for v0.7.6 (minor release) of the Pupil platform. Includes improvements to the video backend, improved logging, and new plugins...
 featured_img: "../../../../media/images/blog/v0.7.6_release_tag.png" 
 ---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
	$(document).ready(function() {
		$.ajax({
			type: 'GET',
			url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.7.6",
			dataType: "jsonp",
			success: function(data, textStatus,jaXHR){
				var converter = new showdown.Converter();
				var text = data.data.body;
				var html = converter.makeHtml(text); 
				$('section[class="content"]').html(html);
				$('a[href="#downloads"]').prop('href',data.data.html_url);
			}
		});
	});
});
</script>
