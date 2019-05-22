<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Caminhao"%>
<%@page import="modelo.DAO"%>
<%@page import="modelo.Entrega"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Entregas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/entregas.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/jquery-3.3.1.js">
        <link rel="icon" href="IMG/favicon.png" />

        <style>
            #data tr {
                display: none;
            }

            .tbEntrega{
                width: 70%;
                margin-left: 20%;
                margin-top: 5%;
            }

            .form-control{
                width: 185%;
            }

            #FormCriar{
                height: 52%;
                width: 32%;
                margin-left: 35%;
                margin-top: 10%;
            }

            #FormCriar2{
                width: 32%;
                margin-left: 35%;
                margin-top: 10%;
            }

            @media screen and (min-width: 
            1024px) {
                #FormCriar{
                    height: 52%;
                    width: 32%;
                    margin-left: 35%;
                    margin-top: 10%;
                }

                #FormCriar2{
                    width: 32%;
                    margin-left: 35%;
                    margin-top: 10%;
                }

                .container{
                    width: 60%;
                    margin-left: 0;
                    position: fixed;
                }
            }

            @media screen and (min-width: 1200px){
                #FormCriar{
                    height: 66%;
                    width: 32%;
                    margin-left: 35%;
                    margin-top: 10%;
                }

                .container {
                    width: 70%;
                    margin-left: 0;
                }
            }
        </style>
    </head>
    <body>
        <%
            DAO pr = new DAO();
            pr.conectar();
            ArrayList lista = pr.consultarEntrega();
            ArrayList listaAprovada = pr.consultarEntregaAprovadas();
            ArrayList listaAndamento = pr.consultarEntregaAndamento();
            ArrayList listaConcluida = pr.consultarEntregaConcluida();
            ArrayList listaErro = pr.consultarEntregaErro();
        %>

        <div class="sidenav">
            <div class="text-center">
                <img class="" src="IMG/favicon.png" height="100" width="100"/>
            </div>

            <a class="btn" href="inicio.jsp" style="border-top: 1px solid #3B4E77;">
                <i class="fas fa-home"></i>
                Inicio                   
            </a>

            <a class="btn"  href="entregas.jsp">
                <i class="fas fa-pallet"></i>
                Entregas
            </a>

            <a class="btn"  href="caminhao.jsp">
                <i class="fas fa-truck"></i>
                Caminhão
            </a>

            <a class="btn"  href="relatorio.jsp">
                <i class="fas fa-scroll"></i>
                Relatório
            </a>

        </div>

        <div class="blocoBranco">

            <div class="tbEntrega">
                <div class="container divTotal" >
                    <h2>Gerencie suas entregas</h2>
                    <p>Use as abas para navegar entre os menus</p>

                    <div id="id01" class="modal" style="background: rgba(0,0,0,0.7);">

                        <form class="modal-content animate" method="post" action="Controle" id="FormCriar" style="">
                            <input type="hidden" name="flag" value="criarEntrega">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                            </div>
                            <!--<div class="container">-->
                            <form class="form-horizontal" method="post" action="Controle">
                                <fieldset>
                                    <br>
                                    <!-- Form Name -->
                                    <legend style="padding: 15px;">Criar Entrega</legend>

                                    <!-- Text input-->
                                    <div class="form-group" style="margin-bottom: 30px;">
                                        <label class="col-md-4 control-label" for="nomeEntrega">Nome da entrega</label>  
                                        <div class="col-md-4">
                                            <input id="nomeEntrega" name="txtNomeEntrega" type="text" placeholder="Entrega Padrão...." class="form-control input-md" required="">

                                        </div>
                                    </div>
                                    <br>
                                    <!-- Textarea -->
                                    <div class="form-group" style="margin-bottom: 45px;">
                                        <label class="col-md-4 control-label" for="descEntrega">Descrição da entrega</label>
                                        <div class="col-md-4">                     
                                            <textarea class="form-control" id="descEntrega" name="txtDescEntrega"></textarea>
                                        </div>
                                    </div>
                                    <br>
                                    <!-- Text input-->
                                    <div class="form-group" style="margin-bottom: 30px;">
                                        <label class="col-md-4 control-label" for="valorEntrega">Valor da entrega</label>  
                                        <div class="col-md-4">
                                            <input id="valorEntrega" name="txtValorEntrega" type="text" placeholder="1.000.00" class="form-control input-md" required="">

                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group" style="margin-bottom: 30px;">
                                        <label class="col-md-4 control-label" for="distanciaEntrega">Distancia da entrega</label>  
                                        <div class="col-md-4">
                                            <input id="distanciaEntrega" name="txtDistanciaEntrega" type="text" placeholder="1.500 km" class="form-control input-md" required="">

                                        </div>
                                    </div>
                                    <br>
                                    <!-- Text input-->
                                    <div class="form-group" style="margin-bottom: 30px;">
                                        <label class="col-md-4 control-label" for="pesoEntrega">Peso</label>  
                                        <div class="col-md-4">
                                            <input id="pesoEntrega" name="txtPesoEntrega" type="text" placeholder="10.000 toneladas" class="form-control input-md" required="">

                                        </div>
                                    </div>
                                    <br>
                                    <!-- Button (Double) -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="btnSalvaEntrega"></label>
                                        <div class="col-md-8">
                                            <input type="submit" id="btnSalvaEntrega" name="btnSalvaEntrega" class="btn btn-success" value="Salvar">
                                            <input type="button" id="btnDeletaEntrega" name="btnDeletaEntrega" onclick="document.getElementById('id01').style.display = 'none'" class="btn btn-danger" value="Cancelar">
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                            <!--</div>-->

                        </form>
                    </div>

                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
                        <li><a data-toggle="tab" href="#menu1">Entregas pendentes</a></li>
                        <li><a data-toggle="tab" href="#menu2">Entregas confirmadas</a></li>
                        <li><a data-toggle="tab" href="#menu3">Entregas em andamento</a></li>
                        <li><a data-toggle="tab" href="#menu4">Entregas concluida</a></li>
                        <li><a data-toggle="tab" href="#menu5">Entregas com erro</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <h3>Bem-vindo</h3>
                            <p>Gerencie todos sua entregas pelos menus acima</p>
                            <p><input class="btn btn-primary" type="submit" name="btnNovaEntrega" value="Criar nova entrega" onclick="document.getElementById('id01').style.display = 'block'"> </p>
                        </div>

                        <div id="menu1" class="tab-pane fade">
                            <h3>Entregas pendentes</h3>
                            <p>Abaixo todas as entregas que precisarão ser confirmadas</p>
                            <div class="container">         
                                <table  class="table table-hover" id="data"  data-show-header="true" data-pagination="true"
                                        data-id-field="identrega"
                                        data-page-list="[5, 10, 25, 50, 100, ALL]"
                                        data-page-size="5">
                                    <tr>
                                        <th>ID da Entrega</th>
                                        <th>Nome da Entrega</th>
                                        <th>Descrição da entrega</th>
                                        <th>Data de criação</th>
                                        <th>Valor da entrega</th>
                                        <th>Peso da entrega</th>                                           
                                    </tr>
                                    <%
                                        for (int indice = 0; indice < lista.size(); indice++) {
                                            Entrega ent = (Entrega) lista.get(indice);
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=ent.getIdEntrega()%></td>
                                            <td><%=ent.getNomeEntrega()%></td>
                                            <td><%=ent.getDescEntrega()%></td>
                                            <td><%=ent.getDataCadastro()%></td>
                                            <td>R$<%=ent.getValorEntrega()%></td>
                                            <td><%=ent.getPesoEntrega()%> Toneladas</td>
                                            <td>
                                                <form class="form-horizontal" method="post" action="Controle">
                                                    <input type="hidden" name="flag" value="editarEntrega">
                                                    <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent.getIdEntrega()%>" required>
                                                    <input type="submit" id="btnSalvaEntrega" name="btnEditaEntrega" class="btn btn-primary" value="Editar">
                                                </form>
                                            </td>
                                            <td>
                                                <input type="button" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" onclick="document.getElementById('id<%=ent.getIdEntrega()%>').style.display = 'block'" value="Excluir">

                                                <form id="id<%=ent.getIdEntrega()%>" class="modal" style="background: rgba(0,0,0,0.7);" method="post" action="Controle" id="ModalExcluir">
                                                    <div class="modal-content animate" id="FormCriar2">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" onclick="document.getElementById('id<%=ent.getIdEntrega()%>').style.display = 'none'">&times;</button>
                                                            <h4 class="modal-title">Excluir entrega <%=ent.getIdEntrega()%> ?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja realmente excluir essa entrega <%=ent.getIdEntrega()%> ?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="flag" value="excluirEntrega">
                                                            <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent.getIdEntrega()%>" required>
                                                            <button type="button" class="btn btn-default" onclick="document.getElementById('id<%=ent.getIdEntrega()%>').style.display = 'none'">Cancelar</button>
                                                            <input type="submit" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" value="Excluir">
                                                        </div>
                                                    </div>
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>                                
                                    </tbody>
                                </table>
                            </div>                
                        </div>

                        <div id="menu2" class="tab-pane fade">
                            <h3>Entregas confirmadas</h3>
                            <p>Abaixo todas as entregas que estão confirmadas</p>
                            <div class="container">         
                                <table class="table table-hover" id="data2">
                                    <tr>
                                        <th>ID da Entrega</th>
                                        <th>Nome da Entrega</th>
                                        <th>Descrição da entrega</th>
                                        <th>Data de criação</th>
                                        <th>Valor da entrega</th>
                                        <th>Peso da entrega</th>                                           
                                    </tr>
                                    <%
                                        for (int indice2 = 0; indice2 < listaAprovada.size(); indice2++) {
                                            Entrega ent2 = (Entrega) listaAprovada.get(indice2);
                                    %>
                                    <tbody id="tbodyx">
                                        <tr>
                                            <td><%=ent2.getIdEntrega()%></td>
                                            <td><%=ent2.getNomeEntrega()%></td>
                                            <td><%=ent2.getDescEntrega()%></td>
                                            <td><%=ent2.getDataCadastro()%></td>
                                            <td>R$<%=ent2.getValorEntrega()%></td>
                                            <td><%=ent2.getPesoEntrega()%> Toneladas</td>
                                            <td>
                                                <form class="form-horizontal" method="post" action="Controle">
                                                    <input type="hidden" name="flag" value="editarEntrega">
                                                    <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent2.getIdEntrega()%>" required>
                                                    <input type="submit" id="btnSalvaEntrega" name="btnEditaEntrega" class="btn btn-primary" value="Editar">
                                                </form>
                                            </td>
                                            <td>
                                                <input type="button" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" onclick="document.getElementById('id<%=ent2.getIdEntrega()%>').style.display = 'block'" value="Excluir">

                                                <form id="id<%=ent2.getIdEntrega()%>" class="modal" style="background: rgba(0,0,0,0.7);" method="post" action="Controle" id="ModalExcluir">
                                                    <div class="modal-content animate" id="FormCriar2">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" onclick="document.getElementById('id<%=ent2.getIdEntrega()%>').style.display = 'none'">&times;</button>
                                                            <h4 class="modal-title">Excluir entrega <%=ent2.getIdEntrega()%> ?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja realmente excluir essa entrega <%=ent2.getIdEntrega()%> ?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="flag" value="excluirEntrega">
                                                            <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent2.getIdEntrega()%>" required>
                                                            <button type="button" class="btn btn-default" onclick="document.getElementById('id<%=ent2.getIdEntrega()%>').style.display = 'none'">Cancelar</button>
                                                            <input type="submit" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" value="Excluir">
                                                        </div>
                                                    </div>
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>                                
                                    </tbody>
                                </table>
                            </div>               
                        </div>

                        <div id="menu3" class="tab-pane fade">
                            <h3>Entregas em andamento</h3>
                            <p>Abaixo todas as entregas que estão em andamento</p>
                            <div class="container">         
                                <table class="table table-hover" id="data3">
                                    <tr>
                                        <th>ID da Entrega</th>
                                        <th>Nome da Entrega</th>
                                        <th>Descrição da entrega</th>
                                        <th>Data de criação</th>
                                        <th>Valor da entrega</th>
                                        <th>Peso da entrega</th>                                           
                                    </tr>
                                    <%
                                        for (int indice3 = 0; indice3 < listaAndamento.size(); indice3++) {
                                            Entrega ent3 = (Entrega) listaAndamento.get(indice3);
                                    %>
                                    <tbody id="tbodyx3">
                                        <tr>
                                            <td><%=ent3.getIdEntrega()%></td>
                                            <td><%=ent3.getNomeEntrega()%></td>
                                            <td><%=ent3.getDescEntrega()%></td>
                                            <td><%=ent3.getDataCadastro()%></td>
                                            <td>R$<%=ent3.getValorEntrega()%></td>
                                            <td><%=ent3.getPesoEntrega()%> Toneladas</td>
                                            <td>
                                                <form class="form-horizontal" method="post" action="Controle">
                                                    <input type="hidden" name="flag" value="ConcluirEntrega">
                                                    <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent3.getIdEntrega()%>" required>
                                                    <input type="submit" id="btnSalvaEntrega" name="btnConcluiEntrega" class="btn btn-success" value="Concluir">
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>                                
                                    </tbody>
                                </table>
                            </div>               
                        </div>  


                        <div id="menu4" class="tab-pane fade">
                            <h3>Entregas concluidas</h3>
                            <p>Abaixo todas as entregas que estão concluidas</p>
                            <div class="container">         
                                <table class="table table-hover" id="data4">
                                    <tr>
                                        <th>ID da Entrega</th>
                                        <th>Nome da Entrega</th>
                                        <th>Descrição da entrega</th>
                                        <th>Data de criação</th>
                                        <th>Valor da entrega</th>
                                        <th>Peso da entrega</th>                                           
                                    </tr>
                                    <%
                                        for (int indice4 = 0; indice4 < listaConcluida.size(); indice4++) {
                                            Entrega ent4 = (Entrega) listaConcluida.get(indice4);
                                    %>
                                    <tbody id="tbodyx4">
                                        <tr>
                                            <td><%=ent4.getIdEntrega()%></td>
                                            <td><%=ent4.getNomeEntrega()%></td>
                                            <td><%=ent4.getDescEntrega()%></td>
                                            <td><%=ent4.getDataCadastro()%></td>
                                            <td>R$<%=ent4.getValorEntrega()%></td>
                                            <td><%=ent4.getPesoEntrega()%> Toneladas</td>
                                            <td>
                                                <input type="button" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" onclick="document.getElementById('id<%=ent4.getIdEntrega()%>').style.display = 'block'" value="Excluir">

                                                <form id="id<%=ent4.getIdEntrega()%>" class="modal" style="background: rgba(0,0,0,0.7);" method="post" action="Controle" id="ModalExcluir">
                                                    <div class="modal-content animate" id="FormCriar2">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" onclick="document.getElementById('id<%=ent4.getIdEntrega()%>').style.display = 'none'">&times;</button>
                                                            <h4 class="modal-title">Excluir entrega <%=ent4.getIdEntrega()%> ?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja realmente excluir essa entrega <%=ent4.getIdEntrega()%> ?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="flag" value="excluirEntrega">
                                                            <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent4.getIdEntrega()%>" required>
                                                            <button type="button" class="btn btn-default" onclick="document.getElementById('id<%=ent4.getIdEntrega()%>').style.display = 'none'">Cancelar</button>
                                                            <input type="submit" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" value="Excluir">
                                                        </div>
                                                    </div>
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>                                
                                    </tbody>
                                </table>
                            </div>               
                        </div> 


                        <div id="menu5" class="tab-pane fade">
                            <h3>Entregas com erro</h3>
                            <p>Abaixo todas as entregas que tiveram erro</p>
                            <div class="container">         
                                <table class="table table-hover" id="data5">
                                    <tr>
                                        <th>ID da Entrega</th>
                                        <th>Nome da Entrega</th>
                                        <th>Descrição da entrega</th>
                                        <th>Data de criação</th>
                                        <th>Valor da entrega</th>
                                        <th>Peso da entrega</th>                                           
                                    </tr>
                                    <%
                                        for (int indice5 = 0; indice5 < listaErro.size(); indice5++) {
                                            Entrega ent5 = (Entrega) listaErro.get(indice5);
                                    %>
                                    <tbody id="tbodyx5">
                                        <tr>
                                            <td><%=ent5.getIdEntrega()%></td>
                                            <td><%=ent5.getNomeEntrega()%></td>
                                            <td><%=ent5.getDescEntrega()%></td>
                                            <td><%=ent5.getDataCadastro()%></td>
                                            <td>R$<%=ent5.getValorEntrega()%></td>
                                            <td><%=ent5.getPesoEntrega()%> Toneladas</td>
                                            <td>
                                                <form class="form-horizontal" method="post" action="Controle">
                                                    <input type="hidden" name="flag" value="editarEntrega">
                                                    <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent5.getIdEntrega()%>" required>
                                                    <input type="submit" id="btnSalvaEntrega" name="btnEditaEntrega" class="btn btn-primary" value="Editar">
                                                </form>
                                            <td>
                                                <input type="button" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" onclick="document.getElementById('id<%=ent5.getIdEntrega()%>').style.display = 'block'" value="Excluir">

                                                <form id="id<%=ent5.getIdEntrega()%>" class="modal" style="background: rgba(0,0,0,0.7);" method="post" action="Controle" id="ModalExcluir">
                                                    <div class="modal-content animate" id="FormCriar2">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" onclick="document.getElementById('id<%=ent5.getIdEntrega()%>').style.display = 'none'">&times;</button>
                                                            <h4 class="modal-title">Excluir entrega <%=ent5.getIdEntrega()%> ?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja realmente excluir essa entrega <%=ent5.getIdEntrega()%> ?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="flag" value="excluirEntrega">
                                                            <input id="nomeEntrega" name="txtIdEntrega" type="hidden" class="form-control input-md" value="<%=ent5.getIdEntrega()%>" required>
                                                            <button type="button" class="btn btn-default" onclick="document.getElementById('id<%=ent5.getIdEntrega()%>').style.display = 'none'">Cancelar</button>
                                                            <input type="submit" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" value="Excluir">
                                                        </div>
                                                    </div>
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>                                
                                    </tbody>
                                </table>
                            </div>               
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <script>
            //tabela pendentes
            $(document).ready(function () {
                $('#data').after('<div id="nav"></div>');
                var rowsShown = 5;
                var rowsTotal = $('#data tbody tr').length;
                var numPages = rowsTotal / rowsShown;
                for (i = 0; i < numPages; i++) {
                    var pageNum = i + 1;
                    $('#nav').append('<ul class="pagination"><li class="page-item"><a class="page-link" rel="' + i + '">' + pageNum + '</a> </li></ul>');
                }
                $('#data tbody tr').hide();
                $('#data tbody tr').slice(0, rowsShown).show();
                $('#nav a:first').addClass('active');
                $('#nav a').bind('click', function () {

                    $('#nav a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data tbody tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });

            //tabela confirmadas
            $(document).ready(function () {
                $('#data2').after('<div id="nav2"></div>');
                var rowsShown = 5;
                var rowsTotal = $('#data2 #tbodyx tr').length;
                var numPages = rowsTotal / rowsShown;
                for (i = 0; i < numPages; i++) {
                    var pageNum = i + 1;
                    $('#nav2').append('<ul class="pagination"><li class="page-item"><a class="page-link2" rel="' + i + '">' + pageNum + '</a> </li></ul>');
                }
                $('#data2 #tbodyx tr').hide();
                $('#data2 #tbodyx tr').slice(0, rowsShown).show();
                $('#nav2 a:first').addClass('active');
                $('#nav2 a').bind('click', function () {

                    $('#nav2 a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data2 #tbodyx tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });

            //tabela andamento
            $(document).ready(function () {
                $('#data3').after('<div id="nav3"></div>');
                var rowsShown = 5;
                var rowsTotal = $('#data3 #tbodyx3 tr').length;
                var numPages = rowsTotal / rowsShown;
                for (i = 0; i < numPages; i++) {
                    var pageNum = i + 1;
                    $('#nav3').append('<ul class="pagination"><li class="page-item"><a class="page-link2" rel="' + i + '">' + pageNum + '</a> </li></ul>');
                }
                $('#data3 #tbodyx3 tr').hide();
                $('#data3 #tbodyx3 tr').slice(0, rowsShown).show();
                $('#nav3 a:first').addClass('active');
                $('#nav3 a').bind('click', function () {

                    $('#nav3 a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data3 #tbodyx3 tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });

            //tabela concluida
            $(document).ready(function () {
                $('#data4').after('<div id="nav4"></div>');
                var rowsShown = 5;
                var rowsTotal = $('#data4 #tbodyx4 tr').length;
                var numPages = rowsTotal / rowsShown;
                for (i = 0; i < numPages; i++) {
                    var pageNum = i + 1;
                    $('#nav4').append('<ul class="pagination"><li class="page-item"><a class="page-link2" rel="' + i + '">' + pageNum + '</a> </li></ul>');
                }
                $('#data4 #tbodyx4 tr').hide();
                $('#data4 #tbodyx4 tr').slice(0, rowsShown).show();
                $('#nav4 a:first').addClass('active');
                $('#nav4 a').bind('click', function () {

                    $('#nav4 a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data4 #tbodyx4 tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });

            //tabela erro
            $(document).ready(function () {
                $('#data5').after('<div id="nav5"></div>');
                var rowsShown = 5;
                var rowsTotal = $('#data5 #tbodyx5 tr').length;
                var numPages = rowsTotal / rowsShown;
                for (i = 0; i < numPages; i++) {
                    var pageNum = i + 1;
                    $('#nav5').append('<ul class="pagination"><li class="page-item"><a class="page-link2" rel="' + i + '">' + pageNum + '</a> </li></ul>');
                }
                $('#data5 #tbodyx5 tr').hide();
                $('#data5 #tbodyx5 tr').slice(0, rowsShown).show();
                $('#nav5 a:first').addClass('active');
                $('#nav5 a').bind('click', function () {

                    $('#nav5 a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data5 #tbodyx5 tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });
        </script>
    </body>


</html>
