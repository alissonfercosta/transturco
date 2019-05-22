<%@page import="java.util.List"%>
<%@page import="modelo.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <style>
            .total{
                position: absolute;
                left: 5%;
                height: 100%;
                width: 90%;
                background-color: #fff; 
            }
            body{
                background-image: url("IMG/index.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                opacity: 0.90;
                display: block;
                height: 100%; 
            }
        </style>
    </head>
    <body>
        <%
            DAO pr = new DAO();
            String flag = (String) request.getAttribute("flag");

            if (flag.equals("entregaEditada")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Entrega Editada!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Entrega editada com sucesso, clique em Continuar para voltar ao menu de entregas</p>"
                        + "<p style='position: relative;top:20px'><a href='entregas.jsp'><button class='btn btn-primary' type='button'>Continuar para entregas</button></a></p>"
                        + "</fieldset></div>");
            } else if (flag.equals("ConcluiEntrega")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:10%'>"
                        + "<fieldset><legend><h1>Entrega Concluida!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Entrega concluida com sucesso, entrega movida para aba de entregas concluidas e caminhão pronto para nova entrega,clique em Continuar para voltar ao menu de entregas</p>"
                        + "<p style='position: relative;top:20px'><a href='entregas.jsp'><button class='btn btn-primary' type='button'>Continuar para entregas</button></a></p>"
                        + "</fieldset></div>");
            } else if (flag.equals("criarEntrega")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Entrega criada com sucesso!!</h1></legend>"
                        + "<center><p class='col-md-11' style='text-align: justify;'>Sucesso ao criar a entrega</p></center>"
                        + "<p style='position: relative;top:20px'><a href='entregas.jsp'><button class='btn btn-primary' type='button'>Continuar para entregas</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("erro")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>ERRO!!</h1></legend>"
                        + "<center><p class='col-md-11' style='text-align: justify;'>Houve um erro verifique os dados e tente novamente</p></center>"
                        + "<p style='position: relative;top:20px'><a href='inicio.jsp'><button class='btn btn-primary' type='button'>Voltar para gerenciar</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("erroRelatorio")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:21%'>"
                        + "<fieldset><legend><h1>Erro relatorio!!</h1></legend>"
                        + "<center><p class='col-md-11' style='text-align: justify;'>Houve um erro ou não teve dados na busca desse relatorio, verifique os dados e tente novamente</p></center>"
                        + "<p style='position: relative;top:20px'><a href='relatorio.jsp'><button class='btn btn-primary' type='button'>Voltar aos relatorios</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("removido")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Entrega excluida com sucesso!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Sucesso ao remover essa entrega</p>"
                        + "<p style='position: relative;top:20px'><a href='inicio.jsp'><button class='btn btn-primary' type='button'>Voltar para gerenciar</button></a></p>"
                        + "</fieldset></div>");
            } else if (flag.equals("adicionarCaminhao")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Caminhão adicionado com sucesso!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Sucesso ao adicionar esse caminhão</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("sucessoEditaCaminhao")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Caminhão editado com sucesso!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Sucesso ao editar esse caminhão</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("ExcluiCaminhao")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Caminhão excluido com sucesso!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Sucesso ao remover esse caminhão</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("erroPeso")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Carga não suportada!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Peso do caminhão não suporta esta carga, escolha outra carga ou outro caminhão para o mesmo</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("erroGasolina")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Combustivel insuficiente!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>O Combustivel neste caminhão é insuficiente para essa entrega, escolha outro caminhão para esta entrega</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("erroManun")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Caminhão em manuntenção!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Este caminhão esta em manuntenção, escolha outro caminhão para esta entrega</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("erroNaoManun")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Caminhão não esta manuntenção!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Este caminhão não esta em manuntenção, escolha outro caminhão que esteja em manuntenção</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            } else if (flag.equals("erroManunEnt")) {
                out.print("<div class='total'><center style='padding:5%;position: absolute;left:26%'>"
                        + "<fieldset><legend><h1>Caminhão em manuntenção!!</h1></legend>"
                        + "<p class='col-md-11' style='text-align: justify;'>Este caminhão esta em manuntenção, escolha outro caminhão para atribuir novas entregas</p>"
                        + "<p style='position: relative;top:20px'><a href='caminhao.jsp'><button class='btn btn-primary' type='button'>Continuar para caminhões</button></a></p>"
                        + "</fieldset>");
            }
        %>

    </body>
</html>
