<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="model.Usuario"%>
<%@ page session="true"%>


<!-- referencias de CSS -->
<link href="assets/css/meus-dados.css" rel="stylesheet" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />

<!-- verifica se há um usuário logado. -->
<c:if test="${empty usuario}">
	<c:redirect url="index.jsp" />
</c:if>

<div class="card">
	<div class="card-header" data-background-color="blue">
		<h4 class="title">Meus dados</h4>
		<p class="category">Atualize seus dados</p>
	</div>
	<div class="card-content">
		<form action="controller.do" method="post">
			<div class="row">
				<div class="col-xs-8">
					<div class="row">
						<div class="col-xs-6">
							<input style="display: none;" type="text" name="id" id="id"
								value="${usuario.id}">
							<div class="form-group label-floating is-empty">
								<label class="control-label">Nome</label> <input type="text"
									class="form-control" name="nome" id="nome"
									value="${usuario.nome}" /> <span class="material-input"></span>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group label-floating is-empty">
								<label class="control-label">Sobrenome</label> <input
									type="text" class="form-control" name="sobrenome"
									id="sobrenome" value="${usuario.sobrenome}" /> <span
									class="material-input"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group label-floating is-empty">
								<label class="control-label">E-mail (login)</label> <input
									type="email" class="form-control" name="email" id="email"
									value="${usuario.email}" /> <span class="material-input"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="form-group label-floating is-empty">
								<label class="control-label">Senha</label> <input
									type="password" class="form-control" name="senha" id="senha"
									value="${usuario.senha}"> <span class="material-input"></span>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-4">
					<div class="card card-profile">
						<div class="card-avatar">
							<!-- verifica se há uma foto de usuário, senão preenche com uma imagem default -->
							<c:if test="${usuario.foto == ''}">
								<img id='output' class="img" src="assets\img\profile.jpg">
							</c:if>
							<c:if test="${usuario.foto != ''}">
								<img id='output' class="img" src="${usuario.foto}">
							</c:if>
						</div>
						<div class="content">
							<textarea style="display: none;" id='stringFoto' name="foto">
								${usuario.foto}
							</textarea>
							<p class="card-content">
								<input type='file' accept='image/*' class="btn"
									onchange="openFile(event)"><br>
							</p>
						</div>
					</div>
				</div>

				<!-- modal footer -->
				<!-- botões do modal -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					<button type="submit" name="command" value="EditarUsuario"
						class="btn btn-primary">Salvar alterações</button>
				</div>
				<div class="alertas">
					<!-- alerts de status -->
					<c:if
						test="${sessionScope.mensagem == 'Dados atualizados com sucesso.'}">
						<div class="alert alert-success">
							<p class="mensagem">
								<strong>${sessionScope.mensagem}</strong>
							</p>
						</div>
					</c:if>
					<c:if test="${sessionScope.mensagem == 'Ocorreu um erro.'}">
						<div class="alert alert-danger">
							<p class="mensagem">
								<strong>${sessionScope.mensagem}</strong>
							</p>
						</div>
					</c:if>
				</div>
			</div>
		</form>
	</div>
</div>

<!--   Core JS Files   -->
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/material.min.js" type="text/javascript"></script>
<script src="assets/js/meus-dados.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="assets/js/material-dashboard.js?v=1.2.0"></script>


