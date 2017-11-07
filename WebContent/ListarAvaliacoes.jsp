<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Listar Avaliações</title>

 <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            

            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">
			<link href="assets/starRating/css/styles.css" rel="stylesheet">
			<link href="assets/starRating/css/star-rating.css" rel="stylesheet">
					
</head>
<body>
<h1>Listar Avaliações</h1>
 
       
            <div id="main" class="container">
                <div>
                	Estabelecimento:  ${estabelecimento.nome }<br>
                	Endereço:	${estabelecimento.endereco }<br>
                	Categoria: ${estabelecimento.categoria.nome }<br>
                	Horario: ${estabelecimento.horario }<br>
                	Telefone: ${estabelecimento.telefone }<br>
                	E-mail: ${estabelecimento.email }<br>
                	Site:  <a  href="${estabelecimento.site }" 	> ${estabelecimento.site }</a> <br>
                </div>
                <hr />                
               	<!-- #list -->
               <div style=" weith">
	                <c:if test="${not empty lista}">
	                <div>
						<% int i =1 ; %>
	                    <c:forEach var="lAS" items="${lista }" varStatus="id">
	                            <div>
	                            	${lAS.usuario.foto }   ${lAS.usuario.nome } ${lAS.usuario.sobrenome } <br>
	                            	Nota Geral: ${lAS.notaGeral } <br>
	                            	<div>
	                            	Acesso Cadeirante: 
	                            	<select id="star-rating-1${id.count}"   >
										<option  value="${lAS.notaAcessoCadeirante}" >${lAS.notaAcessoCadeirante}</option>
										<option  value="5">5</option>
										<option  value="4">4</option>
										<option  value="3">3</option>
										<option  value="2">2</option>
										<option  value="1">1</option>
									</select>
	                            	
	                            	</div>
	                            	<div>
	                            	 Sanitário Cadeirante: ${lAS.notaSanitarioCadeirante}
	                            	 <select id="star-rating-2${id.count}"   >
										<option  value="${lAS.notaSanitarioCadeirante}" >${lAS.notaSanitarioCadeirante}</option>
										<option  value="5">5</option>
										<option  value="4">4</option>
										<option  value="3">3</option>
										<option  value="2">2</option>
										<option  value="1">1</option>
									</select>
	                            	 </div>
	                            	
	                            	<div>
	                            	Instrução Braile:
	                            	 <select id="star-rating-3${id.count}"   >
										<option  value="${lAS.notaInstrucaoBraile}" >${lAS.notaInstrucaoBraile}</option>
										<option  value="5">5</option>
										<option  value="4">4</option>
										<option  value="3">3</option>
										<option  value="2">2</option>
										<option  value="1">1</option>
									</select>
	                            	</div>
	                            	
	                            	<div>
	                            	Sinalização Piso:
	                            	<select id="star-rating-4${id.count}"   >
										<option  value="${lAS.notaSinalizacaoPiso}" >${lAS.notaSinalizacaoPiso}</option>
										<option  value="5">5</option>
										<option  value="4">4</option>
										<option  value="3">3</option>
										<option  value="2">2</option>
										<option  value="1">1</option>
									</select>
	                            	
	                            	</div>
	                            	   	
	                            	Comentário: ${lAS.comentario } <br> <br>
	                       		
	                            </div>
	               	
										
                		</c:forEach>
                    </div>
                 </c:if>
                </div>
                <!-- /#list -->



               
                <!-- /#bottom -->
            </div>
            <!-- /#main -->
            <script src="assets/starRating/js/scale.fix.js"></script>
	<script src="assets/starRating/js/star-rating.min2.js"></script>

	<script>
	
		
		
		<c:forEach var="lAS" items="${lista }" varStatus="id">
		var starrating1${id.count } = new StarRating( document.getElementById( 'star-rating-1${id.count }' ));
 		var starrating2${id.count } = new StarRating( document.getElementById( 'star-rating-2${id.count }' ));
		var starrating3${id.count } = new StarRating( document.getElementById( 'star-rating-3${id.count }' ));
		var starrating4${id.count } = new StarRating( document.getElementById( 'star-rating-4${id.count }' ));
		</c:forEach>
	
	</script>
    

</body>
</html>