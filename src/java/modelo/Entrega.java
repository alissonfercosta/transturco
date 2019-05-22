package modelo;

import java.sql.Date;

public class Entrega {
    
    private int idEntrega;
    private String nomeEntrega;
    private String descEntrega;
    private String dataCadastro;
    private String dataAlteracao;
    private double valorEntrega;
    private double distanciaEntrega;
    private double pesoEntrega;
    private int situacaoEntrega;

    public int getIdEntrega() {
        return idEntrega;
    }

    public void setIdEntrega(int idEntrega) {
        this.idEntrega = idEntrega;
    }

    public String getNomeEntrega() {
        return nomeEntrega;
    }

    public void setNomeEntrega(String nomeEntrega) {
        this.nomeEntrega = nomeEntrega;
    }

    public String getDescEntrega() {
        return descEntrega;
    }

    public void setDescEntrega(String descEntrega) {
        this.descEntrega = descEntrega;
    }

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getDataAlteracao() {
        return dataAlteracao;
    }

    public void setDataAlteracao(String dataAlteracao) {
        this.dataAlteracao = dataAlteracao;
    }

    public double getValorEntrega() {
        return valorEntrega;
    }

    public void setValorEntrega(double valorEntrega) {
        this.valorEntrega = valorEntrega;
    }

    public double getDistanciaEntrega() {
        return distanciaEntrega;
    }

    public void setDistanciaEntrega(double distanciaEntrega) {
        this.distanciaEntrega = distanciaEntrega;
    }

    public double getPesoEntrega() {
        return pesoEntrega;
    }

    public void setPesoEntrega(double pesoEntrega) {
        this.pesoEntrega = pesoEntrega;
    }

    public int getSituacaoEntrega() {
        return situacaoEntrega;
    }

    public void setSituacaoEntrega(int situacaoEntrega) {
        this.situacaoEntrega = situacaoEntrega;
    }

    
}
