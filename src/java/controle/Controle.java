package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Caminhao;

import modelo.DAO;
import modelo.Entrega;

@WebServlet(name = "Controle", urlPatterns = {"/Controle"})
public class Controle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            RequestDispatcher rd = request.getRequestDispatcher("exibir.jsp");
            DAO pr = new DAO();
            pr.conectar();
            String flag = request.getParameter("flag");

            if (flag.equals("criarEntrega")) {

                String nomeEntrega = request.getParameter("txtNomeEntrega");
                String descEntrega = request.getParameter("txtDescEntrega");
                float distanciaEntrega = Float.parseFloat(request.getParameter("txtDistanciaEntrega"));
                float valorEntrega = Float.parseFloat(request.getParameter("txtValorEntrega"));
                float pesoEntrega = Float.parseFloat(request.getParameter("txtPesoEntrega"));

                Entrega e = new Entrega();
                e.setNomeEntrega(nomeEntrega);
                e.setDescEntrega(descEntrega);
                e.setDistanciaEntrega(distanciaEntrega);
                e.setValorEntrega(valorEntrega);
                e.setPesoEntrega(pesoEntrega);

                int r = pr.criarEntrega(nomeEntrega, descEntrega, distanciaEntrega, valorEntrega, pesoEntrega);

                if (r == 1) {
                    request.setAttribute("flag", "criarEntrega");
                    rd.forward(request, response);
                } else if (r == 0) {
                    request.setAttribute("flag", "erro");
                    rd.forward(request, response);
                }
            } else if (flag.equals("editarEntrega")) {
                int idEntrega = Integer.parseInt(request.getParameter("txtIdEntrega"));
                ArrayList lista = pr.buscarEntregas(idEntrega);

                if (!lista.isEmpty()) {
                    RequestDispatcher rd2 = request.getRequestDispatcher("editarEntrega.jsp");
                    request.setAttribute("lista", lista);
                    rd2.forward(request, response);
                } else {
                    RequestDispatcher rd2 = request.getRequestDispatcher("exibir.jsp");
                    request.setAttribute("msg", "Erro ao inserir entrega");
                    rd2.forward(request, response);
                }
            } else if (flag.equals("editaCadastroOk")) {
                int idEntrega = Integer.parseInt(request.getParameter("txtIdEntrega"));
                String nomeEntrega = request.getParameter("txtNomeEntrega");
                String descEntrega = request.getParameter("txtDescEntrega");
                float distanciaEntrega = Float.parseFloat(request.getParameter("txtDistanciaEntrega"));
                float pesoEntrega = Float.parseFloat(request.getParameter("txtPesoEntrega"));
                float valorEntrega = Float.parseFloat(request.getParameter("txtValorEntrega"));
                int comboEdit = Integer.parseInt(request.getParameter("comboEdit"));

                int r = pr.updateEntrega(nomeEntrega, descEntrega, valorEntrega, distanciaEntrega, pesoEntrega, idEntrega, comboEdit);

                if (r == 1) {
                    request.setAttribute("flag", "entregaEditada");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("flag", "erro");
                    rd.forward(request, response);
                }
            } else if (flag.equals("excluirEntrega")) {
                int idEntrega = Integer.parseInt(request.getParameter("txtIdEntrega"));

                int r = pr.removerEntrega(idEntrega);

                if (r == 1) {
                    request.setAttribute("flag", "removido");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("flag", "erro");
                    rd.forward(request, response);
                }
            } else if (flag.equals("adicionarCaminhao")) {
                String marca = request.getParameter("txtMarca");
                String modelo = request.getParameter("txtModelo");
                float gasolina = Float.parseFloat(request.getParameter("txtGasolina"));
                float custokm = Float.parseFloat(request.getParameter("txtCusto"));
                float pesoSuportado = Float.parseFloat(request.getParameter("txtPesoSuportado"));

                int r = pr.adicionarCaminhao(marca, modelo, gasolina, custokm, pesoSuportado);

                if (r == 1) {
                    request.setAttribute("flag", "adicionarCaminhao");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("flag", "erro");
                    rd.forward(request, response);
                }
            } else if (flag.equals("editarCaminhaoBusca")) {
                int idCaminhao = Integer.parseInt(request.getParameter("txtIdCaminhao"));
                ArrayList lista = pr.buscarCaminhaoEditar(idCaminhao);

                Caminhao cam = (Caminhao) lista.get(0);

                if (cam.getManuntencao() == 1) {
                    RequestDispatcher rd3 = request.getRequestDispatcher("exibir.jsp");
                    request.setAttribute("flag", "erroManun");
                    rd3.forward(request, response);
                } else {
                    if (!lista.isEmpty()) {
                        RequestDispatcher rd3 = request.getRequestDispatcher("editarCaminhao.jsp");
                        request.setAttribute("lista", lista);
                        rd3.forward(request, response);
                    } else {
                        RequestDispatcher rd3 = request.getRequestDispatcher("exibir.jsp");
                        request.setAttribute("flag", "erro");
                        rd3.forward(request, response);
                    }
                }

            } else if (flag.equals("editarCaminhaoBuscaManun")) {
                int idCaminhao = Integer.parseInt(request.getParameter("txtIdCaminhao"));
                ArrayList lista = pr.buscarCaminhaoEditar(idCaminhao);

                Caminhao cam = (Caminhao) lista.get(0);

                if (cam.getManuntencao() == 0) {
                    RequestDispatcher rd3 = request.getRequestDispatcher("exibir.jsp");
                    request.setAttribute("flag", "erroNaoManun");
                    rd3.forward(request, response);
                } else {
                    if (!lista.isEmpty()) {
                        RequestDispatcher rd3 = request.getRequestDispatcher("editarCaminhao.jsp");
                        request.setAttribute("lista", lista);
                        rd3.forward(request, response);
                    } else {
                        RequestDispatcher rd3 = request.getRequestDispatcher("exibir.jsp");
                        request.setAttribute("flag", "erro");
                        rd3.forward(request, response);
                    }
                }

            } else if (flag.equals("editaCaminhaoOk")) {
                int idCaminhao = Integer.parseInt(request.getParameter("txtIdCaminhao"));
                String marca = request.getParameter("txtMarca");
                String modelo = request.getParameter("txtModelo");
                double gasolina = Float.parseFloat(request.getParameter("txtGasolina"));
                double custokm = Float.parseFloat(request.getParameter("txtCusto"));
                float pesoSuportado = Float.parseFloat(request.getParameter("txtPesoSuportado"));
                int manuntencao = Integer.parseInt(request.getParameter("comboEdit"));
                String descManun = request.getParameter("manunDesc");
                int idEntrega = Integer.parseInt(request.getParameter("comboIdEntrega"));

                if (manuntencao == 0) {

                    if (idEntrega > 0) {
                        ArrayList lista = pr.buscarEntregas(idEntrega);
                        Entrega ent = (Entrega) lista.get(0);
                        double custo = ent.getDistanciaEntrega() / custokm;
                        gasolina = gasolina - custo;

                        if (gasolina > 0) {

                            int r = pr.updateCaminhao(marca, modelo, gasolina, custokm, pesoSuportado, manuntencao, idCaminhao, descManun, idEntrega);

                            if (r == 1) {
                                request.setAttribute("flag", "sucessoEditaCaminhao");
                                rd.forward(request, response);
                            } else {
                                request.setAttribute("flag", "erro");
                                rd.forward(request, response);
                            }
                        } else {
                            request.setAttribute("flag", "erroGasolina");
                            rd.forward(request, response);
                        }
                    } else {
                        int r = pr.updateCaminhao(marca, modelo, gasolina, custokm, pesoSuportado, manuntencao, idCaminhao, descManun, idEntrega);

                        if (r == 1) {
                            request.setAttribute("flag", "sucessoEditaCaminhao");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("flag", "erro");
                            rd.forward(request, response);
                        }
                    }

                } else {
                    if (idEntrega > 0 && manuntencao == 1) {
                        request.setAttribute("flag", "erroManunEnt");
                        rd.forward(request, response);
                    } else {
                        int r = pr.updateCaminhao(marca, modelo, gasolina, custokm, pesoSuportado, manuntencao, idCaminhao, descManun, idEntrega);
                        if (r == 1) {
                            request.setAttribute("flag", "sucessoEditaCaminhao");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("flag", "erro");
                            rd.forward(request, response);
                        }
                    }

                }

            } else if (flag.equals("excluirCaminhao")) {
                int idCaminhao = Integer.parseInt(request.getParameter("txtIdCaminhao"));

                int r = pr.removerCaminhao(idCaminhao);

                if (r == 1) {
                    request.setAttribute("flag", "ExcluiCaminhao");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("flag", "erro");
                    rd.forward(request, response);
                }
            } else if (flag.equals("relatorio")) {
                String dataInicio = request.getParameter("dataInicial");
                String dataFinal = request.getParameter("dataFinal");
                int situacao = Integer.parseInt(request.getParameter("comboRelatorio"));

                ArrayList lista = pr.buscarRelatorio(dataInicio, dataFinal, situacao);

                if (!lista.isEmpty()) {
                    RequestDispatcher rd4 = request.getRequestDispatcher("resultadoRelatorio.jsp");
                    request.setAttribute("lista", lista);
                    rd4.forward(request, response);
                } else {
                    RequestDispatcher rd3 = request.getRequestDispatcher("exibir.jsp");
                    request.setAttribute("flag", "erroRelatorio");
                    rd3.forward(request, response);
                }
            } else if (flag.equals("ConcluirEntrega")) {
                int idEntrega = Integer.parseInt(request.getParameter("txtIdEntrega"));

                int r = pr.concluirEntrega(idEntrega);

                if (r == 1) {
                    request.setAttribute("flag", "ConcluiEntrega");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("flag", "erro");
                    rd.forward(request, response);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
