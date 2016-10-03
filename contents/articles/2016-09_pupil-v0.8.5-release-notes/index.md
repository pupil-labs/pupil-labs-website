---
 title: Pupil v0.8.5 release notes
 date: Tue Sep 30 2016 23:10:14 GMT+0700 (ICT)
 author: Pupil Dev Team
 subtitle: Release notes for v0.8.5 for the Pupil Platform. Includes updates for macOS 10.12 Sierra, new fixation detector, UI improvements, and more...
 featured_img_thumb: "../../../../media/images/blog/thumb/v0.8.5_release_tag.png"
 tag: {"caption":"v0.8.5","icon":"local_offer"}
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
				html += '<a href="https://github.com/pupil-labs/pupil/releases/tag/v0.8.5">Download v0.8.5</a>'  
				$('section[class~="content"]').html(html);
			}
		});
	});
});
</script>

