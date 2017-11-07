<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="model.Usuario"%>
<%@ page session="true"%>


<!-- referencias de CSS -->
<link href="assets/starRating/css/star-rating.css" rel="stylesheet">
<link href="assets/css/listar-avaliacao.css" rel="stylesheet" />
<!--  Arquivo de inclusao padrao de JS e CSS  -->
<jsp:include page="config.jsp" />

<div class="card">
	<div class="card-header" data-background-color="blue">
		<h4 class="title">Visualizar avaliações</h4>
		<p class="category">Veja todas as avaliações deste estabelecimento</p>
	</div>
	<div class="card-content">
		<div id="main" class="container">
			<div id="main" class="container">
				<div class="card-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group is-empty">
								<label class="control-label">Estabelecimento</label> <input
									type="text" class="form-control"
									value="${estabelecimento.nome }" readonly />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group is-empty">
								<label class="control-label">Endereço</label> <input type="text"
									class="form-control" value="${estabelecimento.endereco }"
									readonly />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<div class="form-group is-empty">
								<label class="control-label">Categoria</label> <input
									type="text" class="form-control"
									value="${estabelecimento.categoria }" readonly />
							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group is-empty">
								<label class="control-label">Horário de funcionamento</label> <input
									type="text" class="form-control"
									value="${estabelecimento.horario }" readonly />
							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group is-empty">
								<label class="control-label">Telefone</label> <input type="text"
									class="form-control" value="${estabelecimento.horario }"
									readonly />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="form-group is-empty">
								<label class="control-label">E-mail</label> <input type="text"
									class="form-control" value="${estabelecimento.email }" readonly />
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group is-empty">
								<label class="control-label">Site</label> <input type="text"
									class="form-control" value="${estabelecimento.site }" readonly />
							</div>
						</div>
					</div>
				</div>
				<hr />
				<!-- #list -->
				<div class="cartoes">
					<c:if test="${not empty lista}">
						<div>
							<%
								int i = 1;
							%>
							<div class="row">
								<c:forEach var="lAS" items="${lista }" varStatus="id">

									<div class="cartao col-xs-3">
										${lAS.usuario.foto } ${lAS.usuario.nome }
										${lAS.usuario.sobrenome } <br> Nota Geral:
										${lAS.notaGeral } <br>
										<div class="col-xs-12">
											Acesso Cadeirante: <select id="star-rating-1${id.count}">
												<option value="${lAS.notaAcessoCadeirante}">${lAS.notaAcessoCadeirante}</option>
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>
											</select>

										</div>
										<div class="col-xs-12">
											Sanitário Cadeirante: ${lAS.notaSanitarioCadeirante} <select
												id="star-rating-2${id.count}">
												<option value="${lAS.notaSanitarioCadeirante}">${lAS.notaSanitarioCadeirante}</option>
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>
											</select>
										</div>

										<div class="col-xs-12">
											Instrução Braile: <select id="star-rating-3${id.count}">
												<option value="${lAS.notaInstrucaoBraile}">${lAS.notaInstrucaoBraile}</option>
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>
											</select>
										</div>

										<div class="col-xs-12">
											Sinalização Piso: <select id="star-rating-4${id.count}">
												<option value="${lAS.notaSinalizacaoPiso}">${lAS.notaSinalizacaoPiso}</option>
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>
											</select>
										</div>

										<div class="col-xs-12">
											<div class="form-group label-floating">
												<label class="control-label">Nome</label>
												<textarea class="form-control" placeholder="Comentário"
													rows="2" readonly>${lAS.comentario }</textarea>

											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</div>
				<!-- /#list -->
			</div>
		</div>
	</div>
</div>

<!--   Core JS Files   -->
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/material.min.js" type="text/javascript"></script>
<script src="assets/starRating/js/scale.fix.js"></script>
<script src="assets/starRating/js/star-rating.min2.js"></script>

<script>
		
		<c:forEach var="lAS" items="${lista }" varStatus="id">
		var starrating1${id.count} = new StarRating( document.getElementById( 'star-rating-1${id.count }' ));
 		var starrating2${id.count} = new StarRating( document.getElementById( 'star-rating-2${id.count }' ));
		var starrating3${id.count} = new StarRating( document.getElementById( 'star-rating-3${id.count }' ));
		var starrating4${id.count} = new StarRating( document.getElementById( 'star-rating-4${id.count }' ));
		</c:forEach>
	
	</script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="assets/js/material-dashboard.js?v=1.2.0"></script>