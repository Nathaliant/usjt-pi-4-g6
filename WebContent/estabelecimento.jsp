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
						<div class="col-md-6" style="display: none;">
							<div class="form-group label-floating">
								<label class="control-label">Latitude</label> <input
									id="txtLatitude" name="txtLatitude" type="hidden"
									class="form-control" value="">
							</div>
						</div>
						<div class="col-md-6" style="display: none;">
							<div class="form-group label-floating">
								<label class="control-label">Longitude</label> <input
									id="txtLongitude" name="txtLongitude" type="hidden"
									class="form-control" value="">
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
</div>
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.steps.js"></script>
<link href="assets/css/jquery.steps.css" rel="stylesheet" />
<script src="assets/js/modernizr-2.6.2.min.js"></script>
<script src="assets/js/mask.js"></script>
<script src="assets/js/estabelecimento.js"></script>
<script>
</script>