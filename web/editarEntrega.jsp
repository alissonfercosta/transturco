<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Caminhao"%>
<%@page import="modelo.DAO"%>
<%@page import="modelo.Entrega"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Editação de entrega</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/Editar.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .tbEntrega{
                width: 70%;
                margin-left: 20%;
                margin-top: 2%;
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

                .container{
                    width: 870px;
                }
            }

            @media screen and (min-width: 1440px){
                .container {
                    width: 1200px;
                }
            }
        </style>
    </head>
    <body>
        <%
            DAO pr = new DAO();
            pr.conectar();
            ArrayList lista = (ArrayList) request.getAttribute("lista");
            Entrega ent = (Entrega) lista.get(0);
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
            <div class="row main" style="margin-right: 0;">
                <div class="main-login main-center">
                    <center>
                        <h3>Edite sua encomenda!</h3>
                        <legend align="right">
                            <a class="btn"  href="entregas.jsp">
                                <input type="button" class="btn btn-light btn-lg btn-block" style="color: #000" value="Voltar"/>
                            </a>
                        </legend>
                    </center>

                    <form class="inputsLimit" method="post" action="Controle">
                        <input type="hidden" name="flag" value="editaCadastroOk">

                        <div class="form-group">
                            <label for="nome" class="cols-sm-2 control-label">ID Entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span>
                                    <input readonly="true" type="text" required class="form-control" name="txtIdEntrega" id="name"  value="<%=ent.getIdEntrega()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="nomeEmpresa" class="cols-sm-2 control-label">Nome da Entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtNomeEntrega" id="nomeEmpresa"  value="<%=ent.getNomeEntrega()%>"/>
                                </div>
                            </div>
                        </div>                        

                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Descrição entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-file" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtDescEntrega" id="email"  value="<%=ent.getDescEntrega()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Peso entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtPesoEntrega" id="usuario"  value="<%=ent.getPesoEntrega()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Distancia entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fas fa-road" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtDistanciaEntrega" id="usuario"  value="<%=ent.getDistanciaEntrega()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="cols-sm-2 control-label">Valor entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fas fa-dollar-sign" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtValorEntrega" id="senha"  value="<%=ent.getValorEntrega()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="cols-sm-2 control-label">Situação entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <select class="form-control" name="comboEdit" value="<%=ent.getSituacaoEntrega()%>">
                                        <option value="0">Pendente</option>
                                        <option value="1">Aprovada</option>
                                        <option value="4">Erro</option>
                                    </select>
                                </div>
                            </div>
                        </div>                                    

                        <div class="form-group ">
                            <input type="submit" class="btn btn-success btn-lg btn-block" name="btnEdita" value="Editar">
                        </div>
                    </form>
                    </fieldset>
                </div>
            </div>
        </div>
    </body>

    <script>
        function nameFormatter(value) {
            return '<a href="https://github.com/wenzhixin/' + value + '">' + value + '</a>';
        }

        function starsFormatter(value) {
            return '<i class="glyphicon glyphicon-star"></i> ' + value;
        }

        function forksFormatter(value) {
            return '<i class="glyphicon glyphicon-cutlery"></i> ' + value;
        }
        $(function () {
            $('#table').bootstrapTable({
                data: data
            });
        });
    </script>
</html>
