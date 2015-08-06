# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$("div.site").sortable({
		cursor: "move",
		axis: "y",
		update: ( event, ui ) -> 
			n = 1
			$('div.site > div.component').each ->
				$(this).find('input').val(n)
				n = n + 1
		}).disableSelection()
	$("div.site#edit").sortable("enable")
	$("div.site#show").sortable("disable")
	