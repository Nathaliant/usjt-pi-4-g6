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
<!--  Arquivo de inclusao padrao de JS e CSS  -->
<jsp:include page="config.jsp" />
<!--  JS  -->

<c:if test="${not empty lista}">
	<div id="list" class="row">
		<div class="table-responsive col-xs-12">
			<table class="table table-striped">
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
				<tbody id="tBodyBuscaEst">
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

							<td class="actions"><a class="btn btn-info btn-xs"
								href="controller.do?command=ListarAvaliacoesPorEstabelecimento&id=${estabelecimento.id}">Listar
									Avaliações</a> <c:if test="${not empty usuario}">
									<a class="btn btn-warning btn-xs"
										href="controller.do?command=CriarAvaliacaoInicio&eId=${estabelecimento.id}">Avaliar</a>
								</c:if> <!-- <a class="btn btn-success btn-xs"
											href="controller.do?command=VisualizarEstabelecimento&id=${estabelecimento.id }">Visualizar</a>
											<a class="btn btn-warning btn-xs"
											href="controller.do?command=EditarEstabelecimento&id=${estabelecimento.id }">Editar</a>-->
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
	<!-- /#list -->

	<div id="bottom" class="row">
		<div class="col-xs-12">
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

<!--   Core JS Files   -->
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="assets/js/material-dashboard.js?v=1.2.0"></script>