---
 title: Pupil v0.7 release notes
 date: Thr Mar 24 2016 00:00:00 GMT+0700 (ICT)
 author: Pupil Dev Team
 subtitle: We are happy to release v.0.7 of the Pupil platform. This is a major release with lots of changes. Including the 3d pupil detector...
 featured_img: "../../../../media/images/blog/v0.7.0_release_tag.png"
 featured_img_thumb: "../../../../media/images/blog/thumb/v0.7.0_release_tag.png"
 tag: {"caption":"v0.7.0","icon":"local_offer"}
 ---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
	$(document).ready(function() {
		$.ajax({
			type: 'GET',
			url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.7.4",
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
