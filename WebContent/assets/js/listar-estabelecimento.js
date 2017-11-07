$(document).ready(function() {

	if ($('.main-panel > .content').length == 0) {
		$('.main-panel').css('height', '100%');
	}
	
	$("#btnBuscarEstabelecimento").click(function(e){
		e.preventDefault();
		var form = $("#formBuscaEst");
		data = getFormData(form);
		console.log(data);
		$.ajax({
			url : "controller.do",
			data : data,
			method : "POST",
			success : function(data) {
				console.log(data);
				data = JSON.parse(data);
				console.log(data);
			}
		})
		
	});

	

});

function criarTabelaEstabelecimento(data){
	
	
}

function getFormData($form) {
	var unindexed_array = $form.serializeArray();
	var indexed_array = {};

	$.map(unindexed_array, function(n, i) {
		indexed_array[n['name']] = n['value'];
	});

	return indexed_array;
}