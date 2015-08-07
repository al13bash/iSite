(function() {
  jQuery(function() {
    $("div.site").sortable({
      cursor: "move",
      axis: "y",
      update: function(event, ui) {
        var n;
        n = 1;
        return $('div.site > div.component').each(function() {
          $(this).find('input').val(n);
          return n = n + 1;
        });
      }
    }).disableSelection();
    $("div.site#edit").sortable("enable");
    return $("div.site#show").sortable("disable");
  });

}).call(this);
