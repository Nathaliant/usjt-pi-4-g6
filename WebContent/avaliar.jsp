<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="model.Usuario"%>
<%@ page session="true"%>


<!-- referencias de CSS -->
<link href="assets/starRating/css/star-rating.css" rel="stylesheet">
<!--  Arquivo de inclusao padrao de JS e CSS  -->
<jsp:include page="config.jsp" />
<form id="formAvaliar" name="form1" action="controller.do" method="post"
	onsubmit="return validar()">
	<input type="hidden" name="command" value="CriarAvaliacao"/>
	<input id="eId" name="eId" value="${avaliacao.id_Estabelecimento }"
		type="hidden">
	<div>
		<div id="aNotaAcessoCadeirante">
			<p>
				<label id="aNotaAcessoCadeirante">Acesso cadeirante: </label> <select
					id="star-rating-1" name="aNotaAcessoCadeirante">
					<option value="">Select a rating</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</p>
		</div>
	</div>

	<div>
		<div id="aNotaSanitarioCadeirante">
			<p>
				<label id="aNotaSanitarioCadeirante">Sanitário cadeirante: </label>
				<select id="star-rating-2" name="aNotaSanitarioCadeirante">
					<option value="">Select a rating</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</p>
		</div>
	</div>

	<div>
		<div id="aNotaInstrucaoBraile">
			<p>
				<label id="aNotaInstrucaoBraile">Instrução em Braile: </label> <select
					id="star-rating-3" name="aNotaInstrucaoBraile">
					<option value="">Select a rating</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</p>

		</div>
	</div>

	<div>
		<div id="aNotaSinalizacaoPiso">
			<p>
				<label id="aNotaSinalizacaoPiso">Sinalização de Piso: </label> <select
					id="star-rating-4" name="aNotaSinalizacaoPiso">
					<option value="">Select a rating</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</p>
		</div>
	</div>

	<br>
	<div>
		<textarea class="form-control" placeholder="Comentário"
			name="aComentario" id="aComentario"></textarea>
	</div>
	<br>
</form>
<!--   Core JS Files   -->
<script src="assets/starRating/js/scale.fix.js"></script>
<script src="assets/starRating/js/star-rating.min.js"></script>

<script>
	var starrating1 = new StarRating(document.getElementById('star-rating-1'));
	var starrating2 = new StarRating(document.getElementById('star-rating-2'));
	var starrating3 = new StarRating(document.getElementById('star-rating-3'));
	var starrating4 = new StarRating(document.getElementById('star-rating-4'));

	//validando rating
	function validar() {

		if (document.getElementById("star-rating-1").selectedIndex == "") {
			alert('Esta faltando a nota de Acesso Cadeirante.');
			return false;
		} else if (document.getElementById("star-rating-2").selectedIndex == "") {
			alert('Esta faltando a nota de Sanitário Cadeirante.');
			return false;
		} else if (document.getElementById("star-rating-3").selectedIndex == "") {
			alert('Esta faltando a nota de Instrução em Braile.');
			return false;
		} else if (document.getElementById("star-rating-4").selectedIndex == "") {
			alert('Esta faltando a nota de Sinalização de Piso.');
			return false;
		} else {
			return true;
		}
	}
</script>





