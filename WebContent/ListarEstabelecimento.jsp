<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Buscar Estabelecimento</title>

<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">

</head>

<body>
	<!-- Modal -->
	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Fechar">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<!-- Container Principal -->
	<div id="main" class="container">
		<form action="controller.do" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h2>Estabelecimento</h2>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="data[search]" class="form-control" id="search"
							type="text" placeholder="Pesquisar Estabelecimento"> <span
							class="input-group-btn">
							<button class="btn btn-primary" type="submit" name="command"
								value="ListarEstabelecimentoBuscar">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>

				<div class="col-md-3">
					<a href="estabelecimento.jsp" class="btn btn-primary pull-right h2">Novo
						Estabelecimento</a>
				</div>
			</div>
			<!-- /#top -->
		</form>
		<hr />
		<c:if test="${not empty lista}">
			<div id="list" class="row">

				<div class="table-responsive col-md-12">
					<table class="table table-striped" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome</th>
								<th>Endereço</th>
								<th>Horário</th>
								<th>Telefone</th>
								<th>Email</th>
								<th>Site</th>
								<th>Categoria</th>
								<th class="actions">Ações</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="estabelecimento" items="${lista }">
								<tr>
									<td>${estabelecimento.id }</td>
									<td>${estabelecimento.nome }</td>
									<td>${estabelecimento.endereco }</td>
									<td>${estabelecimento.horario }</td>
									<td>${estabelecimento.telefone }</td>
									<td>${estabelecimento.email }</td>
									<td>${estabelecimento.site }</td>
									<td>${estabelecimento.categoria.nome }</td>

									<td class="actions"><a class="btn btn-primary btn-xs"
										href="controller.do?command=ListarAvaliacoesPorEstabelecimento&id=${estabelecimento.id}">Listar
											Avaliações</a> <a class="btn btn-danger btn-xs"
										href="controller.do?command=CriarAvaliacaoInicio&eId=${estabelecimento.id}">Avaliar</a>
										<a class="btn btn-success btn-xs"
										href="controller.do?command=VisualizarEstabelecimento&id=${estabelecimento.id }">Visualizar</a>
										<a class="btn btn-warning btn-xs"
										href="controller.do?command=EditarEstabelecimento&id=${estabelecimento.id }">Editar</a>

									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
			<!-- /#list -->

			<div id="bottom" class="row">
				<div class="col-md-12">
					<!-- paginação ainda não foi implementada -->
					<ul class="pagination">
						<li class="disabled"><a>&lt; Anterior</a></li>
						<li class="disabled"><a>1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li class="next"><a href="#" rel="next">Próximo &gt;</a></li>
					</ul>
					<!-- /.pagination -->
				</div>
			</div>
		</c:if>
		<!-- /#bottom -->
	</div>
	<!-- /#main -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#delete-modal").on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); //botao que disparou a modal
			var recipient = button.data('estabelecimento');
			$("#id_excluir").val(recipient);
		});
	</script>
</body>

</html>