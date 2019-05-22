<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="modelo.Relatorio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Caminhao"%>
<%@page import="modelo.DAO"%>

<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Resultado Relatório</title>
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

            String directory = System.getProperty("user.home");
            new File(directory+"/relatoriosTransturco").mkdir();
            directory = directory+"/relatoriosTransturco";
            String data = pr.dataAgora();

            String fileName = "relatorio_" + data + ".csv";
            String absolutePath = directory + File.separator + fileName;
            FileWriter fileWriter = new FileWriter(absolutePath);
            fileWriter.write("ID da Entrega;Nome da Entrega;Data de cadastro;Valor da entrega;Situação da entrega\n");
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
            <div class="row main" style="margin-right: 0;padding: 5%">
                <div class="main-login main-center">
                    <center>
                        <h3>Edite sua encomenda!</h3>
                        <legend align="right">
                            <a class="btn"  href="<%=absolutePath%>" target="_blank" >
                                <input type="button" class="btn btn-success btn-lg btn-block" style="color: #fff" value="Exportar para CSV" data-toggle="modal" data-target="#ModalRelatorio"/>
                            </a>
                            <a class="btn"  href="relatorio.jsp">
                                <input type="button" class="btn btn-light btn-lg btn-block" style="color: #fff " value="Voltar"/>
                            </a>
                        </legend>
                    </center>
                    <div class="container">         
                        <table  class="table table-hover" id="data"  data-show-header="true" data-pagination="true"
                                data-id-field="identrega"
                                data-page-list="[5, 10, 25, 50, 100, ALL]"
                                data-page-size="5">
                            <tr>
                                <th>ID da Entrega</th>
                                <th>Nome da Entrega</th>
                                <th>Data de cadastro</th>
                                <th>Valor da entrega</th>
                                <th>Situação da entrega</th>                                           
                            </tr>

                            <%   for (int indice = 0; indice < lista.size(); indice++) {
                                    Relatorio rel = (Relatorio) lista.get(indice);
                                    String x = rel.getIdEntrega() + ";" + rel.getNomeEntrega() + ";" + rel.getDataCadastro() + ";" + rel.getValorEntrega() + ";" + rel.getSituacaoEntrega() + "\n";
                                    fileWriter.write(x);

                            %>
                            <tbody>
                                <tr>
                                    <td><%=rel.getIdEntrega()%></td>
                                    <td><%=rel.getNomeEntrega()%></td>
                                    <td><%=rel.getDataCadastro()%></td>
                                    <td>R$<%=rel.getValorEntrega()%></td>
                                    <td><%=rel.getSituacaoEntrega()%></td>
                                </tr>
                                <%
                                    }
                                    fileWriter.close();
                                %>                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="ModalRelatorio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Lugar do relatório</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Relatório gerado !!
                        <br/><br/>
                        Entre no caminhao: <span style="color:#3B4E77"><%=absolutePath%></span> do seu computador, e veja o relatorio gerado !!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
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

        $(document).ready(function () {
            $('#data').after('<div id="nav"></div>');
            var rowsShown = 10;
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
    </script>
</html>
