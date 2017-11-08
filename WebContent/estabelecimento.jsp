<%@ page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="UTF-8" import="java.sql.*" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--  Arquivo de inclusao padrao de JS e CSS  -->
<jsp:include page="config.jsp" />
<div class="card">
	<div class="card-header" data-background-color="blue">
		<h4 class="title">Novo Local</h4>
		<p class="category">Cadastre um novo estabelecimento</p>
	</div>
	<div class="card-content" style="height: auto;">
		<div id="wizard">
			<h2>Estabelecimento</h2>
			<section id="section1">
				<form id="formCadastroEst">
					<input type="hidden" name="command" value="CriarEstabelecimento" />
					<div class="row">
						<div class="col-md-6">
							<div class="form-group label-floating">
								<label class="control-label">Latitude</label> <input
									id="txtLatitude" name="txtLatitude" type="text"
									class="form-control" value="-14.235004">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group label-floating">
								<label class="control-label">Longitude</label> <input
									id="txtLongitude" name="txtLongitude" type="text"
									class="form-control" value="-51.925282">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group label-floating">
								<label class="control-label">Classifique o
									estabelecimento</label> <select class="form-control"
									name="optCategoria" id="optCategoria">
									<option value="1">Bar</option>
									<option value="2">Cinema</option>
									<option value="3">Restaurante</option>
									<option value="4">Hotel</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group label-floating">
								<label class="control-label">Endereço</label> <input
									id="cadastroEndereco" name="txtEndereco" type="text"
									class="form-control" value="">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group label-floating">
								<label class="control-label">Nome</label> <input
									id="cadastroNome" name="txtNome" type="text"
									class="form-control" value="">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group label-floating">
								<label class="control-label">Aberto das:</label> <input
									id="cadHrAbertura" name="txtHorario" type="text"
									class="form-control hora" placeholder="Ex: 08:00">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group label-floating">
								<label class="control-label">Até</label> <input
									id="cadHrFechamento" name="cadHrFechamento" type="text"
									class="form-control hora" placeholder="Ex: 23:59">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group label-floating">
								<label class="control-label">Telefone</label> <input
									id="txtTelefone" name="txtTelefone" type="text"
									class="form-control telefone">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group label-floating">
								<label class="control-label">E-mail</label> <input id="txtEmail"
									name="txtEmail" type="text" class="form-control email"
									value="teste">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group label-floating">
								<label class="control-label">Site</label> <input name="txtSite"
									id="txtSite" type="text" class="form-control" value="teste">
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</form>
			</section>
			<h2>Avaliar</h2>
			<section id="section2"></section>
		</div>
	</div>
	<script src="assets/js/mask.js"></script>
	<script src="assets/js/jquery.steps.js"></script>
	<link href="assets/css/jquery.steps.css" rel="stylesheet" />
	<script src="assets/js/modernizr-2.6.2.min.js"></script>
	<script src="assets/js/estabelecimento.js"></script>
	<script>
		$('.hora').mask('00:00');
		$('.telefone').mask('00000-0000');

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
			$
					.ajax({
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
	</script>