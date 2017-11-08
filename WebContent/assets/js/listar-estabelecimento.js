$(document).ready(function() {

	if ($('.main-panel > .content').length == 0) {
		$('.main-panel').css('height', '100%');
	}	

});

function getFormData($form) {
	var unindexed_array = $form.serializeArray();
	var indexed_array = {};

	$.map(unindexed_array, function(n, i) {
		indexed_array[n['name']] = n['value'];
	});

	return indexed_array;
}