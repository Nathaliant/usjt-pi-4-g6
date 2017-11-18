$(document).ready(function($){
	$('.hora').mask('00:00');
	$('.telefone').mask('00000-0000');

});
	
	$("#wizard").steps({
		headerTag : "h2",
		bodyTag : "section",
		transitionEffect : "slideLeft",
		onStepChanging : function(event, currentIndex, newIndex) {
			if (currentIndex == 0) {
				cadastraEst();
				return true;
			}
		},
		onFinishing : function(event, currentIndex) {
			cadastraAval();
			return true;
		}
	});




	function cadastraEst() {
		var form = $("#formCadastroEst");
		data = getFormData(form);
		var hrAberto = $("#cadHrAbertura").val();
		var hrFechado = $("#cadHrFechamento").val();
		var horarioFormatado = hrAberto + " - " + hrFechado;
		data.txtHorario = horarioFormatado;
		console.log(data);
		$.ajax({
			url : "controller.do",
			data : data,
			method : "POST",
			success : function(data) {
				data = JSON.parse(data);
				console.log(data);
				var urlAval = "controller.do?command=CriarAvaliacaoInicio&eId="
						+ data.id;
				console.log(urlAval);
				$.ajax({
					url : urlAval,
					method : "GET",
					success : function(data) {
						$("#wizard-p-1").html(data);
					}
				})
			}
		})
	}

	function cadastraAval() {
		var form = $("#formAvaliar");
		data = getFormData(form);
		$.ajax({
			url : "controller.do",
			data : data,
			method : "POST",
			success : function(data) {
				alert("Avaliação cadastrada com sucesso!'");
				window.location.replace("index.jsp")
				resetSteps();
			}
		})
	}

	function getFormData($form) {
		var unindexed_array = $form.serializeArray();
		var indexed_array = {};

		$.map(unindexed_array, function(n, i) {
			indexed_array[n['name']] = n['value'];
		});

		return indexed_array;
	}
