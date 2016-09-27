---
 title: Pupil v0.8.5 release notes
 date: Tue Sep 27 2016 23:10:14 GMT+0700 (ICT)
 author: Pupil Dev Team
 subtitle: Release notes for v0.8.5 for the Pupil Platform. Includes updates for macOS 10.12 Sierra, new fixation detector, UI improvements, and more...
 featured_img: "../../../../media/images/blog/v0.8.0_release_tag.png"
 featured_img_thumb: "../../../../media/images/blog/thumb/v0.8.0_release_tag.png"
 ---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
	$(document).ready(function() {
		$.ajax({
			type: 'GET',
			url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.8.5",
			dataType: "jsonp",
			success: function(data, textStatus,jaXHR){
				var converter = new showdown.Converter();
				var text = data.data.body;
				var html = converter.makeHtml(text); 
				$('section[class~="content"]').html(html);
				$('a[href="#downloads"]').prop('href',data.data.html_url);
			}
		});
	});
});
</script>

<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.8.5">Download v0.8.5</a> 