var countryB = new autoComplete({
  selector: '#country_b',
  minChars: 1,
  source: function(term, suggest){
    term = term.toLowerCase();
    var suggestions = [];
    for (var i=0;i<choices.length;i++)
      if (~choices[i].toLowerCase().indexOf(term)) suggestions.push(choices[i]);
      suggest(suggestions);
  }
});

var countryS = new autoComplete({
  selector: '#country_s',
  minChars: 1,
  source: function(term, suggest){
    term = term.toLowerCase();
    var suggestions = [];
    for (var i=0;i<choices.length;i++)
      if (~choices[i].toLowerCase().indexOf(term)) suggestions.push(choices[i]);
      suggest(suggestions);
  }
});