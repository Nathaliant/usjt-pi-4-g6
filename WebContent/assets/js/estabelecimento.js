$(document).ready(function(){
	var form = $("#formCadastroEst");
	
	form.on("submit", function(e){
		
		e.preventDefault();
		data = getFormData($(this));
		
		var hrAberto = $("#cadHrAbertura").val();
		var hrFechado = $("#cadHrFechamento").val();
		
		var horarioFormatado = hrAberto + " - " + hrFechado;
		data.txtHorario = horarioFormatado;
		console.log(data);
		$.ajax({
			url: "controller.do",
			data: data,
			method: "POST",
			success: function(data){
				data = JSON.parse(data);
				console.log(data);
			}
		})
	})
	
	function getFormData($form){
	    var unindexed_array = $form.serializeArray();
	    var indexed_array = {};

	    $.map(unindexed_array, function(n, i){
	        indexed_array[n['name']] = n['value'];
	    });

	    return indexed_array;
	}
	
});