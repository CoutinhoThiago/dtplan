package br.com.dtplan.musculos;

import br.com.dtplan.exercicios.DadosAtualizacaoExercicio;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Table(name = "musculos")
@Entity(name = "Musculo")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Musculo {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String nome;
	private String acao;
	private boolean ativo;
	
	public Musculo(DadosCadastroMusculo dados) {
		this.ativo = true;
		nome = dados.nome();
		this.acao = dados.acao();
	}

	public void atualizarInformacoes(DadosAtualizacaoMusculo dados) {
        if (dados.nome() != null) {
            this.nome = dados.nome();
        }
        if (dados.acao() != null) {
            this.acao = dados.acao();
        }
	}
	
	public void inativar() {
        this.ativo = false;
    }

}