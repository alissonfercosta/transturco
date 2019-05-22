package modelo;

public class Caminhao {

    private int idCaminhao;
    private String marca;
    private String modelo;
    private float gasolina;
    private float custokm;
    private float pesoSuportado;    
    private int manuntencao;
    private String descManun;
    private int idEntregaAtual;

    public int getIdCaminhao() {
        return idCaminhao;
    }

    public void setIdCaminhao(int idCaminhao) {
        this.idCaminhao = idCaminhao;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public float getGasolina() {
        return gasolina;
    }

    public void setGasolina(float gasolina) {
        this.gasolina = gasolina;
    }

    public float getCustokm() {
        return custokm;
    }

    public void setCustokm(float custokm) {
        this.custokm = custokm;
    }

    public float getPesoSuportado() {
        return pesoSuportado;
    }

    public void setPesoSuportado(float pesoSuportado) {
        this.pesoSuportado = pesoSuportado;
    }

    public int getManuntencao() {
        return manuntencao;
    }

    public void setManuntencao(int manuntencao) {
        this.manuntencao = manuntencao;
    }

    public String getDescManun() {
        return descManun;
    }

    public void setDescManun(String descManun) {
        this.descManun = descManun;
    }

    public int getIdEntregaAtual() {
        return idEntregaAtual;
    }

    public void setIdEntregaAtual(int idEntregaAtual) {
        this.idEntregaAtual = idEntregaAtual;
    }

   
}
