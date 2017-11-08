<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="model.Usuario"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- referencias de CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/material-dashboard.css" rel="stylesheet">
<link href="assets/css/cadastro.css" rel="stylesheet">

<title>Sem Barreiras | Cadastre-se</title>
</head>
<body>
	<div class="modal fade" id="modalCadastro" tabindex="-1" role="dialog"
		aria-labelledby="modalCadastroLabel" style="display: block; padding-left: 17px;">
		<div class="container-fluid">
			<div class="row">
				<!-- formulário -->
				<form action="controller.do" method="post">
					<div class="card">

						<!-- cabeçalho do card -->
						<div class="card-header" data-background-color="blue">
							<h4 class="title">Cadastre-se</h4>
						</div>

						<!-- corpo do card -->
						<div class="card-content">
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group is-empty">
										<input type="text" class="form-control" maxlength="50"
											name="nome" id="nome" placeholder="Nome"
											value="${usuario.nome}" /> <span class="material-input"></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12">
									<div class="form-group is-empty">
										<input type="text" class="form-control" maxlength="50"
											placeholder="Sobrenome" name="sobrenome" id="sobrenome"
											value="${usuario.sobrenome}" /> <span class="material-input"></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12">
									<div class="form-group is-empty">
										<input type="email" class="form-control"
											placeholder="Login (e-mail)" name="email" id="email"
											value="${usuario.email}" /> <span class="material-input"></span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xs-12">
									<div class="form-group is-empty">
										<input type="password" class="form-control"
											placeholder="Senha" name="senha" id="senha"
											value="${usuario.senha}"> <span
											class="material-input"></span>
									</div>
								</div>
							</div>
						</div>
						<!-- rodapé do modal -->
						<div class="modal-footer">

							<!-- verifica o retorno da mensagem e exibe o alert adequado. -->
							<c:if test="${mensagem == 'Cadastro realizado com sucesso.'}">
								<div class="alert alert-success">
									<p class="mensagem">
										<strong>${mensagem}</strong>
									</p>
								</div>
							</c:if>
							<c:if
								test="${mensagem == 'Este e-mail já existe, tente outro.' || mensagem == 'Ocorreu um erro.'}">
								<div class="alert alert-danger">
									<p class="mensagem">
										<strong>${mensagem}</strong>
									</p>
								</div>
							</c:if>
							<p class="message">
								Possui um login? <a href="login.jsp"><strong>Entre
										aqui.</strong></a>
							</p>
							<button type="submit" name="command" value="CriarUsuario"
								class="btn btn-primary">Cadastrar</button>
						</div>
					</div>
				</form>
				<!-- fim do formulario -->
			</div>
		</div>
		<!-- fim do container-fluid -->
	</div>
	<!-- fim do modal -->

</body>
<!--   Core JS Files   -->
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/material.min.js" type="text/javascript"></script>
<script src="assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="assets/js/material-dashboard.js?v=1.2.0"></script>
<script>

$('#modalCadastro').modal({
	  backdrop: 'static',
	  keyboard: false
	});

</script>
</html>