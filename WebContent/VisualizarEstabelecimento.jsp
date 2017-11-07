<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title> Visualizar Estabelecimento</title>

            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
            <link href="assets/css/style.css" rel="stylesheet">
        </head>

        <body>
                <!-- Modal -->
                <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.modal -->
                <!-- Container Principal -->
                <div id="main" class="container">
                    <h3 class="page-header">Visualizar Estabelecimento #${estabelecimento.id }</h3>


                          <div class="col-md-12">
                           <p><strong>Nome</strong>
                            </p>
                            <p>
                                ${estabelecimento.nome}
                            </p>
                        </div>
                        <div class="col-md-12">
                           <p><strong>Endereço</strong>
                            </p>
                            <p>
                                ${estabelecimento.endereco}
                            </p>
                        </div>
                        <div class="col-md-12">
                           <p><strong>Horário</strong>
                            </p>
                            <p>
                                ${estabelecimento.horario}
                            </p>
                        </div>
                           <div class="col-md-12">
                            <p><strong>Telefone</strong>
                            </p>
                            <p>
                                ${estabelecimento.telefone }
                            </p>
                        </div>
                          <div class="col-md-12">
                            <p><strong>E-mail</strong>
                            </p>
                            <p>
                                ${estabelecimento.email }
                            </p>
                        </div>
                               <div class="col-md-12">
                            <p><strong>Site</strong>
                            </p>
                            <p>
                                ${estabelecimento.site }
                            </p>
                        </div> 
                             <div class="col-md-12">
                            <p><strong>Categoria</strong>
                            </p>
                            <p>
                                ${categoria.nome }
                            </p>
                        </div>  
                             
                                  
                    <hr />
             
                         <div id="actions" class="row">
                        <div class="col-md-12">
                            <a href="controller.do?command=EditarEstabelecimento&id=${estabelecimento.id }" class="btn btn-primary">Editar</a>
							<a class="btn btn-primary" href="controller.do?command=EditarEstabelecimento&id=${estabelecimento.id }">Avaliar</a>
							<a href="ListarEstabelecimento.jsp" class="btn btn-default">Voltar</a>
							                        
                        </div>
                    </div>
                </div>

                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
        </body>

        </html>