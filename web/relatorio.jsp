<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Caminhões</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/relatorio.css">
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
                    height: 51%;
                    width: 32%;
                    margin-left: 35%;
                    margin-top: 10%;
                }

                .container{
                    width: 870px;
                }
            }

            @media screen and (min-width: 1200px){
                #FormCriar{
                    height: 53%;
                    width: 32%;
                    margin-left: 35%;
                    margin-top: 10%;
                }
                .container {
                    width: 1200px;
                }
            }
        </style>
    </head>
    <body>

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
            <form class="modal-content animate" method="post" action="Controle" id="FormCriar" style="">
                <input type="hidden" name="flag" value="relatorio">
                <form class="form-horizontal" method="post" action="Controle">
                    <fieldset>
                        <br>
                        <!-- Form Name -->
                        <legend style="padding: 15px;">Gerar relatorio das entregas</legend>

                        <!-- Text input-->
                        <div class="form-group" style="margin-bottom: 30px;">
                            <label class="col-md-4 control-label" for="dataInicial">Data de inicio</label>  
                            <div class="col-md-4">
                                <input id="dataInicial" name="dataInicial" type="date" placeholder="01/05/2019" class="form-control input-md" required="">
                            </div>
                        </div>
                        <br>
                        <!-- Textarea -->
                        <div class="form-group" style="margin-bottom: 45px;">
                            <label class="col-md-4 control-label" for="dataFinal">Data de final</label>
                            <div class="col-md-4">
                                <input id="dataFinal" name="dataFinal" type="date" placeholder="05/05/2019" class="form-control input-md" required="">
                            </div>
                        </div>

                        <div class="form-group" style="padding:2%">
                            <label for="password" class="cols-sm-2 control-label">Filtrar por situação de entrega</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-check" aria-hidden="true"></i></span>
                                    <select class="form-control" name="comboRelatorio" value="0">
                                        <option value="0">Pendente</option>
                                        <option value="1">Aprovada</option>
                                        <option value="2">Em andamento</option>
                                        <option value="3">Concluida</option>
                                        <option value="4">Erro</option>
                                    </select>
                                </div>
                            </div>
                        </div>   
                                        
                        <br>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="btnBuscaRelatorio"></label>
                            <div class="col-md-8">
                                <input type="submit" id="btnBuscaRelatorio" name="btnSalvaEntrega" class="btn btn-success" value="Buscar">
                            </div>
                        </div>

                    </fieldset>
                </form>
            </form>
        </div>

    </body>
</html>
