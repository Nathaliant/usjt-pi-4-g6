<%@ page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="UTF-8" import="java.sql.*" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--  Arquivo de inclusao padrao de JS e CSS  -->
<jsp:include page="config.jsp" />
<script src="assets/js/mask.js"></script>
<script src="assets/js/estabelecimento.js"></script>

<div class="card">
	<div class="card-header" data-background-color="blue">
		<h4 class="title">Novo Local</h4>
		<p class="category">Cadastre um novo estabelecimento</p>
	</div>
	<div class="card-content">
		<form id="formCadastroEst">
		<input type="hidden" name="command" value="CriarEstabelecimento"/>
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
						<label class="control-label">Classifique o estabelecimento</label>
						<select class="form-control" name="optCategoria" id="optCategoria">
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
							class="form-control" value="testeEnde">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group label-floating">
						<label class="control-label">Nome</label> <input
							id="cadastroNome" name="txtNome" type="text"
							class="form-control" value="testeNome">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group label-floating">
						<label class="control-label">Aberto das:</label> <input
							id="cadHrAbertura" name="txtHorario" type="text"
							class="form-control hora" placeholder="Ex: 08:00" value="123">
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
							class="form-control" value="teste">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group label-floating">
						<label class="control-label">E-mail</label> <input id="txtEmail"
							name="txtEmail" type="text" class="form-control email" value="teste">
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
			<button type="submit" class="btn btn-primary pull-right">Avançar</button>
			<div class="clearfix"></div>
		</form>
	</div>
</div>
<script>

</script>