package modelo;


public class Relatorio {
    private int idEntrega;
    private String nomeEntrega;
    private String dataCadastro;
    private float valorEntrega;
    private int situacaoEntrega;
    private String urlCsv;

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

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public float getValorEntrega() {
        return valorEntrega;
    }

    public void setValorEntrega(float valorEntrega) {
        this.valorEntrega = valorEntrega;
    }

    public int getSituacaoEntrega() {
        return situacaoEntrega;
    }

    public void setSituacaoEntrega(int situacaoEntrega) {
        this.situacaoEntrega = situacaoEntrega;
    }

    public String getUrlCsv() {
        return urlCsv;
    }

    public void setUrlCsv(String urlCsv) {
        this.urlCsv = urlCsv;
    }

    
}
