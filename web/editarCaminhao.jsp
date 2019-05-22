<%@page import="modelo.Entrega"%>
<%@page import="modelo.Caminhao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Editação de Caminhões</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/EditarCaminhao.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
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
            Caminhao cam = (Caminhao) lista.get(0);
            ArrayList lista2 = pr.consultarEntregaAprovadas();
            Entrega ent1 = (Entrega) lista2.get(0);
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
                        <h3>Edite seus Caminhões!</h3>
                        <legend align="right">
                            <a class="btn"  href="caminhao.jsp">
                                <input type="button" class="btn btn-light btn-lg btn-block" style="color: #000" value="Voltar"/>
                            </a>
                        </legend>
                    </center>   
                    <form class="inputsLimit" method="post" action="Controle">
                        <input type="hidden" name="flag" value="editaCaminhaoOk">

                        <div class="form-group">
                            <label for="nome" class="cols-sm-2 control-label">ID Caminhão</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span>
                                    <input readonly="true" type="text" required class="form-control" name="txtIdCaminhao" id="name"  value="<%=cam.getIdCaminhao()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="nomeEmpresa" class="cols-sm-2 control-label">Marca</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtMarca" id="nomeEmpresa"  value="<%=cam.getMarca()%>"/>
                                </div>
                            </div>
                        </div>                        

                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Modelo</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-file" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtModelo" id="email"  value="<%=cam.getModelo()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Combustivel</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-thermometer-quarter" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtGasolina" id="usuario"  value="<%=cam.getGasolina()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Consumo por KM</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-thermometer-quarter" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtCusto" id="usuario"  value="<%=cam.getCustokm()%>"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Peso suportado</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-balance-scale" aria-hidden="true"></i></span>
                                    <input type="text" required class="form-control" name="txtPesoSuportado" id="usuario"  value="<%=cam.getPesoSuportado()%>"/>
                                </div>
                            </div>
                        </div>                                    

                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Qual entrega este caminhão vai fazer ?</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></span>
                                    <select class="form-control" name="comboIdEntrega" value="<%=cam.getIdEntregaAtual()%>">
                                        <option value="0">nenhuma</option>
                                        <% for (int indice1 = 0; indice1 < lista2.size(); indice1++) {
                                                Entrega ent2 = (Entrega) lista2.get(indice1);
                                        %>
                                        <option value="<%=ent2.getIdEntrega()%>"><%=ent2.getNomeEntrega()%></option>
                                        <%
                                            }
                                        %>  
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="cols-sm-2 control-label">Manutenção ?</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <select class="form-control"id="comboEdit" name="comboEdit" value="<%=cam.getManuntencao()%>">
                                        <option value="0">Não</option>
                                        <option value="1">Sim</option>
                                    </select>
                                </div>
                                <div id="textarea">
                                    <div class="form-group  ">
                                        <div class="col-md-6">
                                            <textarea class="textarea form-control" id="manunDesc" name="manunDesc" cols="60" rows="7" placeholder="Descrição manutenção"  style="margin-bottom: 5%;"> </textarea>
                                        </div>
                                    </div>
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
        jQuery(function () {
            jQuery("textarea").hide()
            jQuery("#comboEdit").change(function () {
                //  jQuery(this).val() == 'select' ? jQuery("#textarea").hide() : jQuery("#textarea").show();
                var value = jQuery(this).val();
                jQuery("textarea").hide()
                if (value == "1") {
                    jQuery("#manunDesc").show();
                }
            });
        });

        $(function () {
            $('#table').bootstrapTable({
                data: data
            });
        });
    </script>
</html>