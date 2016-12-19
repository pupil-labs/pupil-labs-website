$('#country_b').relevantDropdown({
	change: function(new_text){
		$("#country_b").trigger('change');
	}
});

$('#country_s').relevantDropdown();
