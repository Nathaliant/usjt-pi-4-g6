<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="model.Usuario"%>
<%@ page session="true"%>


<!-- referencias de CSS -->
<link href="assets/css/listar-avaliacao.css" rel="stylesheet" />
<link href="assets/starRating/css/star-rating.css" rel="stylesheet">

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
								<label >Estabelecimento</label> <input
									type="text" class="form-control"
									value="${estabelecimento.nome }" readonly />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-group is-empty">
								<label >Endereço</label> <input type="text"
									class="form-control" value="${estabelecimento.endereco }"
									readonly />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<div class="form-group is-empty">
								<label >Categoria</label> <input
									type="text" class="form-control"
									value="${estabelecimento.categoria }" readonly />
							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group is-empty">
								<label >Horário de funcionamento</label> <input
									type="text" class="form-control"
									value="${estabelecimento.horario }" readonly />
							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group is-empty">
								<label >Telefone</label> <input type="text"
									class="form-control" value="${estabelecimento.horario }"
									readonly />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6">
							<div class="form-group is-empty">
								<label >E-mail</label> <input type="text"
									class="form-control" value="${estabelecimento.email }" readonly />
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group is-empty">
								<label >Site</label> <input type="text"
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

									<div class="cartao col-xs-12">
										<div class="row">
											<div class="col-xs-4">
												<label>Nome:</label>
												<h5>${lAS.usuario.nome} ${lAS.usuario.sobrenome}</h5>
											</div>
											<div class="col-xs-4">
												<label>Nota geral:</label>
												<h5>${lAS.notaGeral }</h5>
											</div>
											<div class="col-xs-4">
												<div class="cartao-foto card-profile">
													<div class="card-avatar">
														<!-- verifica se há uma foto de usuário, senão preenche com uma imagem default -->
														<c:if test="${lAS.usuario.foto == ''}">
															<img id='output' class="img" src="assets\img\profile.jpg">
														</c:if>
														<c:if test="${lAS.usuario.foto != ''}">
															<img id='output' class="img" src="${lAS.usuario.foto}">
														</c:if>
													</div>
												</div>
											</div>										
										</div>
										<div class="row">																				
											<div class="col-xs-3">
												<label>Acesso Cadeirante:</label> 
												<select id="star-rating-1${id.count}">
													<option value="${lAS.notaAcessoCadeirante}">${lAS.notaAcessoCadeirante}</option>
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>
	
											</div>
											<div class="col-xs-3">
												<label>Sanitário Cadeirante:</label> 
												<select id="star-rating-2${id.count}">
													<option value="${lAS.notaSanitarioCadeirante}">${lAS.notaSanitarioCadeirante}</option>
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>
											</div>
	
											<div class="col-xs-3">
												<label>Instrução Braile:</label> 
												 <select id="star-rating-3${id.count}">
													<option value="${lAS.notaInstrucaoBraile}">${lAS.notaInstrucaoBraile}</option>
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>
											</div>
	
											<div class="col-xs-3">
												<label>Sinalização Piso:</label> 
												<select id="star-rating-4${id.count}">
													<option value="${lAS.notaSinalizacaoPiso}">${lAS.notaSinalizacaoPiso}</option>
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<div class="form-group label-floating">
													<label>Comentário:</label>
													<textarea class="form-control" placeholder="Comentário"
														rows="2" readonly>${lAS.comentario }</textarea>
	
												</div>
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