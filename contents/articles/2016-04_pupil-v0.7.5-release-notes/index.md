---
 title: Pupil v0.7.5 release notes
 date: Tue Apr 19 2016 00:00:00 GMT+0700 (ICT)
 author: Pupil Dev Team
 subtitle: Release notes for v0.7.5 (minor release) of the Pupil platform. Includes improvements to the surface tracker, bug fixes, and performance improvements... 
 ---

<script src="//cdn.rawgit.com/showdownjs/showdown/1.3.0/dist/showdown.min.js"></script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(event) { 
	$(document).ready(function() {
		$.ajax({
			type: 'GET',
			url: "https://api.github.com/repos/pupil-labs/pupil/releases/tags/v0.7.5",
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
