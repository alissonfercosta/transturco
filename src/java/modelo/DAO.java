package modelo;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

//Classe DAO de conexão com o Banco de dados
public class DAO {

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    DateFormat dateFormat2 = new SimpleDateFormat("yyyy/MM/dd");
    String dateAgora = dateFormat.format(new Date());
    
    public String dataAgora(){
        DateFormat dateFormat3 = new SimpleDateFormat("yyyyMMdd_HHmmss");
        String dateAgora2 = dateFormat3.format(new Date());
        return dateAgora2;
    }

    //configuração de acesso do banco de dados
    private final String user = "root";
    private final String password = "";
    private final String url = "jdbc:mysql://localhost:3306/transturco";

    //constantes que serao utilizadas no codigo
    private Connection con;
    private Statement st;
    private ResultSet rs;

    //Metodos de conexao e desconexão do banco
    public void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
        } catch (SQLException e) {
            String log = "Falha ao conectar no banco de dados, mensagem: " + e;
            insereLog(log, 0, 0, 0);
        } catch (ClassNotFoundException e) {
            e.getMessage();
        }
        System.out.println("Sucesso na conexão!!");
    }

    public void desconectar() {
        try {
            st.close();
            con.close();
            System.out.println("Conexão encerrada!!");
        } catch (SQLException ex) {
            System.out.println("Falha ao desconectar " + ex);
        }
    }

    /* ***************INICIO DAO ENTREGA*************** */
    public int criarEntrega(String nomeEntrega, String descEntrega, Float distancia, Float valorEntrega, Float pesoEntrega) {
        try {
            st.executeUpdate("INSERT INTO `entrega`(`nomeEntrega`, `descEntrega`, `dataCadastro`, `dataAlteracao`, `valorEntrega`, `distancia`, `pesoEntrega`, `situacaoEntrega`) "
                    + "VALUES('" + nomeEntrega + "','" + descEntrega + "','" + dateAgora + "', '" + dateAgora + "'," + valorEntrega + "," + distancia + "," + pesoEntrega + ",0)");
            insereLog("Nova Entrega Criada com sucesso", 0, 0, 0);
            return 1;
        } catch (SQLException e) {
            String log = "Falha ao criar entrega, exception: " + e.getMessage();
            insereLog(log, 0, 0, 0);
            return 0;
        }
    }

    public int updateEntrega(String nomeEntrega, String descEntrega, Float valorEntrega, Float distancia, Float pesoEntrega, int idEntrega, int comboEdit) {
        try {
            st.executeUpdate("update entrega set nomeEntrega = '" + nomeEntrega + "',descEntrega = '" + descEntrega + "', dataAlteracao = '" + dateAgora
                    + "',valorEntrega = " + valorEntrega + ",distancia = " + distancia + ",pesoEntrega = " + pesoEntrega + ",situacaoEntrega = " + comboEdit + " where idEntrega = " + idEntrega);
            String log = "Entrega de id = " + idEntrega + " foi atualizada com sucesso";
            insereLog(log, idEntrega, 0, 0);
            return 1;
        } catch (SQLException e) {
            String log = "Erro ao editar entrega de id = " + idEntrega + " " + e.getMessage();
            insereLog(log, idEntrega, 0, 0);
            return 0;
        }
    }

    public ArrayList consultarEntrega() {
        try {
            ArrayList<Entrega> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM entrega where situacaoEntrega = 0 order by identrega desc");
            while (rs.next()) {
                Entrega ent = new Entrega();
                ent.setIdEntrega(rs.getInt("idEntrega"));
                ent.setNomeEntrega(rs.getString("nomeEntrega"));
                ent.setDescEntrega(rs.getString("descEntrega"));
                String dateAltera = dateFormat2.format(rs.getDate("dataCadastro"));
                ent.setDataCadastro(dateAltera);
                ent.setValorEntrega(rs.getFloat("valorEntrega"));
                ent.setDistanciaEntrega(rs.getFloat("distancia"));
                ent.setPesoEntrega(rs.getFloat("pesoEntrega"));
                ent.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(ent);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar entregas, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList consultarEntregaInicio() {
        try {
            ArrayList<Entrega> lista = new ArrayList<>();

            rs = st.executeQuery("SELECT * FROM entrega order by identrega desc limit 5");
            while (rs.next()) {
                Entrega ent = new Entrega();
                ent.setIdEntrega(rs.getInt("idEntrega"));
                ent.setNomeEntrega(rs.getString("nomeEntrega"));
                ent.setDescEntrega(rs.getString("descEntrega"));
                String dateAltera = dateFormat2.format(rs.getDate("dataCadastro"));
                ent.setDataCadastro(dateAltera);
                ent.setValorEntrega(rs.getFloat("valorEntrega"));
                ent.setDistanciaEntrega(rs.getFloat("distancia"));
                ent.setPesoEntrega(rs.getFloat("pesoEntrega"));
                ent.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(ent);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar entregas da tela inicio, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList consultarEntregaAprovadas() {
        try {
            ArrayList<Entrega> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM entrega where situacaoEntrega = 1 order by identrega desc");
            while (rs.next()) {
                Entrega ent = new Entrega();
                ent.setIdEntrega(rs.getInt("idEntrega"));
                ent.setNomeEntrega(rs.getString("nomeEntrega"));
                ent.setDescEntrega(rs.getString("descEntrega"));
                String dateAltera = dateFormat2.format(rs.getDate("dataCadastro"));
                ent.setDataCadastro(dateAltera);
                ent.setValorEntrega(rs.getFloat("valorEntrega"));
                ent.setDistanciaEntrega(rs.getFloat("distancia"));
                ent.setPesoEntrega(rs.getFloat("pesoEntrega"));
                ent.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(ent);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar entregas aprovadas, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList consultarEntregaAndamento() {
        try {
            ArrayList<Entrega> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM entrega where situacaoEntrega = 2 order by identrega desc");
            while (rs.next()) {
                Entrega ent = new Entrega();
                ent.setIdEntrega(rs.getInt("idEntrega"));
                ent.setNomeEntrega(rs.getString("nomeEntrega"));
                ent.setDescEntrega(rs.getString("descEntrega"));
                String dateAltera = dateFormat2.format(rs.getDate("dataCadastro"));
                ent.setDataCadastro(dateAltera);
                ent.setValorEntrega(rs.getFloat("valorEntrega"));
                ent.setDistanciaEntrega(rs.getFloat("distancia"));
                ent.setPesoEntrega(rs.getFloat("pesoEntrega"));
                ent.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(ent);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar entregas em andamento, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList consultarEntregaConcluida() {
        try {
            ArrayList<Entrega> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM entrega where situacaoEntrega = 3 order by identrega desc");
            while (rs.next()) {
                Entrega ent = new Entrega();
                ent.setIdEntrega(rs.getInt("idEntrega"));
                ent.setNomeEntrega(rs.getString("nomeEntrega"));
                ent.setDescEntrega(rs.getString("descEntrega"));
                String dateAltera = dateFormat2.format(rs.getDate("dataCadastro"));
                ent.setDataCadastro(dateAltera);
                ent.setValorEntrega(rs.getFloat("valorEntrega"));
                ent.setDistanciaEntrega(rs.getFloat("distancia"));
                ent.setPesoEntrega(rs.getFloat("pesoEntrega"));
                ent.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(ent);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar entregas concluidas, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList consultarEntregaErro() {
        try {
            ArrayList<Entrega> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM entrega where situacaoEntrega = 4 order by identrega desc");
            while (rs.next()) {
                Entrega ent = new Entrega();
                ent.setIdEntrega(rs.getInt("idEntrega"));
                ent.setNomeEntrega(rs.getString("nomeEntrega"));
                ent.setDescEntrega(rs.getString("descEntrega"));
                String dateAltera = dateFormat2.format(rs.getDate("dataCadastro"));
                ent.setDataCadastro(dateAltera);
                ent.setValorEntrega(rs.getFloat("valorEntrega"));
                ent.setDistanciaEntrega(rs.getFloat("distancia"));
                ent.setPesoEntrega(rs.getFloat("pesoEntrega"));
                ent.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(ent);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar entregas com erro, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList buscarEntregas(int id) {
        ArrayList<Entrega> lista = new ArrayList<>();
        try {
            rs = st.executeQuery("SELECT * FROM entrega WHERE idEntrega=" + id);
            while (rs.next()) {
                Entrega ent = new Entrega();
                ent.setIdEntrega(rs.getInt("idEntrega"));
                ent.setNomeEntrega(rs.getString("nomeEntrega"));
                ent.setDescEntrega(rs.getString("descEntrega"));
                ent.setValorEntrega(rs.getFloat("valorEntrega"));
                ent.setDistanciaEntrega(rs.getFloat("distancia"));
                ent.setPesoEntrega(rs.getFloat("pesoEntrega"));
                ent.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(ent);
            }
            return lista;
        } catch (SQLException e) {
            String log = "Falha ao consultar entrega para editar, exception: " + e.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public int removerEntrega(int id) {
        try {
            st.executeUpdate("DELETE FROM entrega WHERE idEntrega = " + id);
            insereLog("Entrega de id = " + id + " Removida com sucesso", id, 0, 0);
            return 1;
        } catch (SQLException e) {
            String log = "Erro ao Remover entrega de id = " + id + " " + e.getMessage();
            insereLog(log, id, 0, 0);
            return 0;
        }
    }

    public int concluirEntrega(int id) {
        try {
            st.executeUpdate("update entrega set situacaoentrega = 3 WHERE idEntrega = " + id);
            st.executeUpdate("update caminhao set identrega = 0 WHERE idEntrega = " + id);
            insereLog("Entrega de id = " + id + " Concluida com sucesso", id, 0, 0);
            return 1;
        } catch (SQLException e) {
            String log = "Erro ao Concluir entrega de id = " + id + " " + e.getMessage();
            insereLog(log, id, 0, 0);
            return 0;
        }
    }

    /* FIM DAO ENTREGA */

    /* INICIO DAO CAMINHAO */
    public int adicionarCaminhao(String marca, String modelo, float gasolina, float custokm, float pesoSuportado) {
        try {
            st.executeUpdate("INSERT INTO `caminhao`(`marca`, `modelo`, `dataCadastro`, `dataAlteracao`,`gasolina`, `custoPorKm`, `pesoSuportado`, `manuntencao`, `descManuntencao`,`idEntrega`) "
                    + "VALUES('" + marca + "','" + modelo + "','" + dateAgora + "','" + dateAgora + "'," + gasolina + "," + custokm + "," + pesoSuportado + ",0,'',0)");
            String log = "Caminhao de novo adicionado com sucesso!";
            insereLog(log, 0, 0, 0);
            return 1;
        } catch (SQLException e) {
            String log = "Erro ao inserir caminhao " + e.getMessage();
            insereLog(log, 0, 0, 0);
            return 0;
        }
    }

    public ArrayList consultarCaminhao() {
        try {
            ArrayList<Caminhao> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM caminhao where manuntencao = 0 and idEntrega =0 ORDER by idCaminhao desc");
            while (rs.next()) {
                Caminhao cam = new Caminhao();
                cam.setIdCaminhao(rs.getInt("idCaminhao"));
                cam.setMarca(rs.getString("marca"));
                cam.setModelo(rs.getString("modelo"));
                cam.setGasolina(rs.getFloat("gasolina"));
                cam.setCustokm(rs.getFloat("custoPorKm"));
                cam.setPesoSuportado(rs.getFloat("pesoSuportado"));
                cam.setIdEntregaAtual(rs.getInt("idEntrega"));

                lista.add(cam);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar caminhoes, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList buscarCaminhaoEditar(int id) {
        ArrayList<Caminhao> lista = new ArrayList<>();
        try {
            rs = st.executeQuery("SELECT * FROM caminhao WHERE idCaminhao=" + id);
            while (rs.next()) {
                Caminhao cam = new Caminhao();
                cam.setIdCaminhao(rs.getInt("idCaminhao"));
                cam.setMarca(rs.getString("marca"));
                cam.setModelo(rs.getString("modelo"));
                cam.setGasolina(rs.getFloat("gasolina"));
                cam.setCustokm(rs.getFloat("custoPorKm"));
                cam.setPesoSuportado(rs.getFloat("pesoSuportado"));
                cam.setManuntencao(rs.getInt("manuntencao"));
                cam.setIdEntregaAtual(rs.getInt("idEntrega"));

                lista.add(cam);
            }
            return lista;
        } catch (SQLException e) {
            String log = "Falha ao consultar caminhao para editar, exception: " + e.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public int updateCaminhao(String marca, String modelo, double gasolina, double custokm, float pesoSuportado, int manuntencao, int idCaminhao, String descManun,int idEntrega) {

        try {
            String log = "";
            st.executeUpdate("update caminhao set marca = '" + marca + "',modelo = '" + modelo + "', dataAlteracao = '" + dateAgora + "'"
                    + ",gasolina = " + gasolina + ",custoporkm = " + custokm + ",pesoSuportado = " + pesoSuportado + ",manuntencao = " + manuntencao + ", descManuntencao = '" + descManun + "',idEntrega = " + idEntrega + " where idCaminhao = " + idCaminhao);
            if (idEntrega > 0) {
                st.executeUpdate("update entrega set  situacaoEntrega = 2 where idEntrega = " + idEntrega);
                log = "Update no Caminhao de ID = " + idCaminhao + "Entrega de id = " + idEntrega + ", alterando status para 'Entrega em Andamento'";
            } else {
                log = "Update no Caminhao de ID = " + idCaminhao;
            }
            insereLog(log, idEntrega, idCaminhao, 0);
            return 1;
        } catch (SQLException e) {
            String log = "";
            log = "Falha no update do caminhao!: " + e.getMessage();
            insereLog(log, idEntrega, idCaminhao, 0);
            return 0;
        }
    }

    public ArrayList consultarCaminhaoManuntencao() {
        try {
            ArrayList<Caminhao> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM caminhao where manuntencao = 1 ORDER by idCaminhao desc");
            while (rs.next()) {
                Caminhao cam = new Caminhao();
                cam.setIdCaminhao(rs.getInt("idCaminhao"));
                cam.setMarca(rs.getString("marca"));
                cam.setModelo(rs.getString("modelo"));
                cam.setGasolina(rs.getFloat("gasolina"));
                cam.setCustokm(rs.getFloat("custoPorKm"));
                cam.setPesoSuportado(rs.getFloat("pesoSuportado"));
                cam.setManuntencao(rs.getInt("manuntencao"));
                cam.setDescManun(rs.getString("descManuntencao"));
                cam.setIdEntregaAtual(rs.getInt("idEntrega"));

                lista.add(cam);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar caminhao em manuntencao, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public ArrayList consultarCaminhaoEmEntregas() {
        try {
            ArrayList<Caminhao> lista = new ArrayList<>();
            rs = st.executeQuery("SELECT * FROM caminhao where manuntencao = 0 and identrega > 0 ORDER by idCaminhao desc");
            while (rs.next()) {
                Caminhao cam = new Caminhao();
                cam.setIdCaminhao(rs.getInt("idCaminhao"));
                cam.setMarca(rs.getString("marca"));
                cam.setModelo(rs.getString("modelo"));
                cam.setGasolina(rs.getFloat("gasolina"));
                cam.setCustokm(rs.getFloat("custoporkm"));
                cam.setPesoSuportado(rs.getFloat("gasolina"));
                cam.setPesoSuportado(rs.getFloat("pesoSuportado"));
                cam.setIdEntregaAtual(rs.getInt("idEntrega"));

                lista.add(cam);
            }
            return lista;
        } catch (SQLException ex) {
            String log = "Falha ao consultar caminhao em entrega, exception: " + ex.getMessage();
            insereLog(log, 0, 0, 0);
            return null;
        }
    }

    public int removerCaminhao(int id) {
        try {
            st.executeUpdate("DELETE FROM caminhao WHERE idCaminhao = " + id);
            String log = "Caminhao de id = " + id + " Foi excluido com sucesso!";
            insereLog(log, 0, id, 0);
            return 1;
        } catch (SQLException e) {
            String log = "Erro ao excluir Caminhao de id = " + id + e.getMessage();
            insereLog(log, 0, id, 0);
            return 0;
        }
    }

    public void insereLog(String desc, int idEntrega, int idCaminhao, int idManuntencao) {
        try {
            st.executeUpdate("INSERT INTO `log`(`descricaoLog`, `idEntrega`, `idCaminhao`, `idManuntencao`, `dataLog`) "
                    + "VALUES ('" + desc + "'," + idEntrega + "," + idCaminhao + "," + idManuntencao + ",'" + dateAgora + "')");
        } catch (SQLException e) {
            System.out.println("Falha ao Criar log!: " + e.getMessage());
        }
    }

    public ArrayList buscarRelatorio(String dataInicio, String dataFinal, int situacao) {
        ArrayList<Relatorio> lista = new ArrayList<>();
        
        try {
            rs = st.executeQuery("SELECT * FROM `entrega` WHERE dataCadastro >= '" + dataInicio + "' and dataCadastro <= '" + dataFinal + "' and situacaoEntrega = " + situacao);
            while (rs.next()) {
                Relatorio rel = new Relatorio();
                rel.setIdEntrega(rs.getInt("idEntrega"));
                rel.setNomeEntrega(rs.getString("nomeEntrega"));
                String dateAltera = dateFormat2.format(rs.getDate("dataCadastro"));
                rel.setDataCadastro(dateAltera);
                rel.setValorEntrega(rs.getFloat("valorEntrega"));
                rel.setSituacaoEntrega(rs.getInt("situacaoEntrega"));

                lista.add(rel);
            }
            return lista;
        } catch (SQLException e) {
            String log = "Relatorio com erro ou zerado| dados: situacao = " + situacao + " , data inicial =" + dataInicio + " ,data final = " + dataFinal;
            insereLog(log, 0, 0, 0);
            return null;
        }
    }
}
