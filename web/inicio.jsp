<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Caminhao"%>
<%@page import="modelo.DAO"%>
<%@page import="modelo.Entrega"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Bem-Vindo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="CSS/inicio.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="icon" href="IMG/favicon.png" />

        <style>
            .tbEntrega{
                width: 70%;
                margin-left: 20%;
                margin-top: 5%;
            }
        </style>
    </head>
    <body>
        <%
            DAO pr = new DAO();
            pr.conectar();
            ArrayList lista = pr.consultarEntregaInicio();
        %>


        <div class="sidenav">
            <div class="text-center">
                <img class="" src="IMG/favicon.png" height="100" width="100"/>
            </div>

            <a class="btn" href="#" style="border-top: 1px solid #3B4E77;">
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
            <div class="main">
                <h2>Bem-vindo</h2>
                <p>Gerencie todos sua entregas pelos menus ao lado, veja quais caminhões estão disponiveis para tais entregas</p>
            </div>


            <div class="tbEntrega">
                <div class="panel panel-primary " >
                    <div class="panel-heading">Ultimas Entregas</div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID da Entrega</th>
                                    <th>Nome da Entrega</th>
                                    <th>Descrição da entrega</th>
                                    <th>Data de cadastro</th>
                                    <th>Valor da entrega</th>
                                    <th>Peso da entrega</th>                                           
                                </tr>
                            </thead>
                            <%
                                for (int indice = 0; indice < lista.size(); indice++) {
                                    Entrega ent = (Entrega) lista.get(indice);
                            %>
                            <tr>
                                <td><%=ent.getIdEntrega()%></td>
                                <td><%=ent.getNomeEntrega()%></td>
                                <td><%=ent.getDescEntrega()%></td>
                                <td><%=ent.getDataCadastro()%></td>
                                <td>R$<%=ent.getValorEntrega()%></td>
                                <td><%=ent.getPesoEntrega()%> Toneladas</td>
                                <%
                                    }
                                %>   
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
