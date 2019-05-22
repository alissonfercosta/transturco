<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Caminhao"%>
<%@page import="modelo.DAO"%>
<%@page import="modelo.Entrega"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Caminhões</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/caminhao.css">
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
            ArrayList listaCaminhao = pr.consultarCaminhao();
            ArrayList listaCaminhaoManuntencao = pr.consultarCaminhaoManuntencao();
            ArrayList listaCaminhaoEmEntregas = pr.consultarCaminhaoEmEntregas();
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
                    <h2>Gerencie seus caminhões</h2>
                    <p>Use as abas para navegar entre os menus</p>

                    <!--MODAL Adicionar Caminhao -->    

                    <div id="id04" class="modal" style="background: rgba(0,0,0,0.7);">

                        <form class="modal-content animate" method="post" action="Controle" id="FormCriar">
                            <input type="hidden" name="flag" value="adicionarCaminhao">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id04').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                            </div>
                            <!--<div class="container">-->

                            <fieldset>
                                <br>
                                <!-- Form Name -->
                                <legend style="padding: 15px;">Adicionar Caminhão</legend>

                                <!-- Text input-->
                                <div class="form-group" style="margin-bottom: 30px;">
                                    <label class="col-md-4 control-label" for="nomeEntrega">Marca do caminhão</label>  
                                    <div class="col-md-4">
                                        <input id="nomeEntrega" name="txtMarca" type="text" placeholder="ex: Volvo" class="form-control input-md" required="">
                                    </div>
                                </div>
                                <br>
                                <!-- Textarea -->
                                <div class="form-group" style="margin-bottom: 45px;">
                                    <label class="col-md-4 control-label" for="descEntrega">Modelo do caminhão</label>
                                    <div class="col-md-4">                     
                                        <input id="nomeEntrega" name="txtModelo" type="text" placeholder="ex: FH16" class="form-control input-md" required="">
                                    </div>
                                </div>
                                <br>
                                <!-- Text input-->
                                <div class="form-group" style="margin-bottom: 30px;">
                                    <label class="col-md-4 control-label" for="valorEntrega">Gasolina</label>  
                                    <div class="col-md-4">
                                        <input id="valorEntrega" name="txtGasolina" type="text" placeholder="100.000 litros" class="form-control input-md" required="">
                                    </div>
                                </div>
                                <br>

                                <div class="form-group" style="margin-bottom: 30px;">
                                    <label class="col-md-4 control-label" for="custoCaminhao">Custo por KM</label>  
                                    <div class="col-md-4">
                                        <input id="custoCaminhao" name="txtCusto" type="text" placeholder="5L/km Custo por KM" class="form-control input-md" required="">
                                    </div>
                                </div>
                                <br>

                                <div class="form-group" style="margin-bottom: 30px;">
                                    <label class="col-md-4 control-label" for="valorEntrega">Peso suportado</label>  
                                    <div class="col-md-4">
                                        <input id="valorEntrega" name="txtPesoSuportado" type="text" placeholder="10.000 kilos" class="form-control input-md" required="">
                                    </div>
                                </div>
                                <br>
                                <!-- Button (Double) -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="btnSalvaEntrega"></label>
                                    <div class="col-md-8">
                                        <input type="submit" id="btnSalvaCaminhao" name="btnSalvaCaminhao" class="btn btn-success" value="Salvar">
                                        <input type="button" id="btnDeletaEntrega" name="btnDeletaEntrega" onclick="document.getElementById('id04').style.display = 'none'" class="btn btn-danger" value="Cancelar">
                                    </div>
                                </div>

                            </fieldset>
                        </form>

                        </form>
                    </div> 
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
                        <li><a data-toggle="tab" href="#menu3">Caminhões ativos</a></li>
                        <li><a data-toggle="tab" href="#menu5">Caminhões em entrega</a></li>
                        <li><a data-toggle="tab" href="#menu4">Caminhões em manutenção</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <h3>Bem-vindo</h3>
                            <p>Gerencie seus caminhões pelos menus acima, veja quais caminhões estão disponíveis para tais entregas</p>
                            <p><input class="btn btn-primary" type="submit" name="btnEditar" value="Adicionar caminhão" onclick="document.getElementById('id04').style.display = 'block'"></p>
                        </div>

                        <div id="menu3" class="tab-pane fade">
                            <h3>Caminhões Ativos</h3>
                            <p>Abaixo todos os caminhões que estão ativos</p>
                            <div class="container">         
                                <table class="table table-hover" id="data">                                   
                                    <tr>
                                        <th>ID do caminhão</th>
                                        <th>Marca do caminhão</th>
                                        <th>Modelo do caminhão</th>
                                        <th>Combustivel</th>
                                        <th>Peso Suportado</th>
                                        <th>ID Entrega atual</th>
                                    </tr>                                    
                                    <%
                                        for (int indice3 = 0; indice3 < listaCaminhao.size(); indice3++) {
                                            Caminhao cam = (Caminhao) listaCaminhao.get(indice3);
                                            int x = cam.getIdEntregaAtual();
                                            if (x == 1) {
                                                x = 0;
                                            }
                                    %>
                                    <tbody>
                                        <tr>
                                            <td><%=cam.getIdCaminhao()%></td>
                                            <td><%=cam.getMarca()%></td>
                                            <td><%=cam.getModelo()%></td>
                                            <td><%=cam.getGasolina()%> Litros</td>
                                            <td><%=cam.getPesoSuportado()%> Toneladas</td>
                                            <td><%=cam.getIdEntregaAtual()%></td>
                                            <td>
                                                <form method="post" action="Controle" id="ModalEditar">
                                                    <input type="hidden" name="flag" value="editarCaminhaoBusca">
                                                    <input id="nomeEntrega" name="txtIdCaminhao" type="hidden" class="form-control input-md" value="<%=cam.getIdCaminhao()%>" required>
                                                    <input type="submit" id="btnEditaCaminhao" name="btnEditaCaminhao" class="btn btn-primary" value="Editar">
                                                </form>
                                            </td>

                                            <td>
                                                <input type="button" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" onclick="document.getElementById('id<%=cam.getIdCaminhao()%>').style.display = 'block'" value="Excluir">

                                                <form id="id<%=cam.getIdCaminhao()%>" class="modal" style="background: rgba(0,0,0,0.7);" method="post" action="Controle" id="ModalEditar">
                                                    <div class="modal-content animate" id="FormCriar2">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" onclick="document.getElementById('id<%=cam.getIdCaminhao()%>').style.display = 'none'">&times;</button>
                                                            <h4 class="modal-title">Excluir entrega <%=cam.getIdCaminhao()%> ?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja realmente excluir essa entrega <%=cam.getIdCaminhao()%> ?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="flag" value="excluirCaminhao">
                                                            <input id="nomeEntrega" name="txtIdCaminhao" type="hidden" class="form-control input-md" value="<%=cam.getIdCaminhao()%>" required>
                                                            <button type="button" class="btn btn-default" onclick="document.getElementById('id<%=cam.getIdCaminhao()%>').style.display = 'none'">Cancelar</button>
                                                            <input type="submit" id="btnExcluiCaminhao" name="btnExcluiCaminhao" class="btn btn-danger" value="Excluir">
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

                        <div id="menu4" class="tab-pane fade">
                            <h3>Caminhões em manunteção</h3>
                            <p>Abaixo todos caminhões que estão em Manutenção</p>
                            <div class="container">         
                                <table class="table table-hover" id="data2">
                                    <tr>
                                        <th>ID do caminhão</th>
                                        <th>Marca do caminhão</th>
                                        <th>Modelo do caminhão</th>
                                        <th>Descrição Manutenção</th>
                                    </tr> 
                                    <%
                                        for (int indice4 = 0; indice4 < listaCaminhaoManuntencao.size(); indice4++) {
                                            Caminhao cam2 = (Caminhao) listaCaminhaoManuntencao.get(indice4);
                                    %>
                                    <tbody id="tbodyx">
                                        <tr>
                                            <td><%=cam2.getIdCaminhao()%></td>
                                            <td><%=cam2.getMarca()%></td>
                                            <td><%=cam2.getModelo()%></td>
                                            <td><%=cam2.getDescManun()%></td>
                                            <td>
                                                <form method="post" action="Controle" id="ModalEditar">
                                                    <input type="hidden" name="flag" value="editarCaminhaoBuscaManun">
                                                    <input id="nomeEntrega" name="txtIdCaminhao" type="hidden" class="form-control input-md" value="<%=cam2.getIdCaminhao()%>" required>
                                                    <input type="submit" id="btnSalvaEntrega" name="btnEditaEntrega" class="btn btn-primary" value="Editar">
                                                </form>
                                            </td>
                                            <td>
                                                <input type="button" id="btnSalvaEntrega" name="btnExcluirEntrega" class="btn btn-danger" onclick="document.getElementById('id<%=cam2.getIdCaminhao()%>').style.display = 'block'" value="Excluir">

                                                <form id="id<%=cam2.getIdCaminhao()%>" class="modal" style="background: rgba(0,0,0,0.7);" method="post" action="Controle" id="ModalEditar">
                                                    <div class="modal-content animate" id="FormCriar2">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" onclick="document.getElementById('id<%=cam2.getIdCaminhao()%>').style.display = 'none'">&times;</button>
                                                            <h4 class="modal-title">Excluir entrega <%=cam2.getIdCaminhao()%> ?</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Deseja realmente excluir essa entrega <%=cam2.getIdCaminhao()%> ?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="hidden" name="flag" value="excluirCaminhao">
                                                            <input id="nomeEntrega" name="txtIdCaminhao" type="hidden" class="form-control input-md" value="<%=cam2.getIdCaminhao()%>" required>
                                                            <button type="button" class="btn btn-default" onclick="document.getElementById('id<%=cam2.getIdCaminhao()%>').style.display = 'none'">Cancelar</button>
                                                            <input type="submit" id="btnExcluiCaminhao" name="btnExcluiCaminhao" class="btn btn-danger" value="Excluir">
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
                            <h3>Caminhões com entrega em andamento</h3>
                            <p>Abaixo todos caminhões que estão com entregas em andamento</p>
                            <div class="container">         
                                <table class="table table-hover" id="data3">
                                    <tr>
                                        <th>ID do caminhão</th>
                                        <th>Marca do caminhão</th>
                                        <th>Modelo do caminhão</th>
                                        <th>Combustivel</th>
                                        <th>Peso Suportado</th>
                                        <th>ID Entrega atual</th>
                                    </tr> 
                                    <%
                                        for (int indice5 = 0; indice5 < listaCaminhaoEmEntregas.size(); indice5++) {
                                            Caminhao cam3 = (Caminhao) listaCaminhaoEmEntregas.get(indice5);
                                    %>
                                    <tbody id="tbodyx3">
                                        <tr>
                                            <td><%=cam3.getIdCaminhao()%></td>
                                            <td><%=cam3.getMarca()%></td>
                                            <td><%=cam3.getModelo()%></td>
                                            <td><%=cam3.getGasolina()%> Litros</td>
                                            <td><%=cam3.getPesoSuportado()%> Toneladas</td>
                                            <td><%=cam3.getIdEntregaAtual()%></td>
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
            //tabela Ativos
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

            //tabela Manuntencao
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

                    $('#nav a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data2 #tbodyx tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });

            //tabela Em entrega
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

                    $('#nav a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#data3 #tbodyx3 tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });
        </script>
    </body>
</html>
