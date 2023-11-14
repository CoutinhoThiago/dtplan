package br.com.dtplan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import br.com.dtplan.exercicios.DadosAtualizacaoExercicio;
import br.com.dtplan.exercicios.DadosDetalhamentoMusculo;
import br.com.dtplan.exercicios.Exercicio;
import br.com.dtplan.musculos.DadosAtualizacaoMusculo;
import br.com.dtplan.musculos.DadosCadastroMusculo;
import br.com.dtplan.musculos.DadosListagemMusculo;
import br.com.dtplan.musculos.Musculo;
import br.com.dtplan.musculos.MusculoRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/musculos")
public class MusculoController {
	
	@Autowired
	private MusculoRepository repository;
	
	@PostMapping
	@Transactional
	public ResponseEntity cadastrar(@RequestBody DadosCadastroMusculo dados, UriComponentsBuilder uriBuilder) {
		var musculo = new Musculo(dados);
		repository.save(musculo);
		
		var uri = uriBuilder.path("musculo/{id}").buildAndExpand(musculo.getId()).toUri();
		var dto = new DadosDetalhamentoMusculo(musculo);
		
		return ResponseEntity.created(uri).body(dto);
		

	}

	@GetMapping
    public ResponseEntity<Page<DadosListagemMusculo>> listar(@PageableDefault(size = 10, sort = {"descricao"}) Pageable paginacao) {
		var page = repository.findAll(paginacao).map(DadosListagemMusculo::new);
		
		return ResponseEntity.ok(page);
    }
	
	@PutMapping
    @Transactional
    public ResponseEntity atualizar(@RequestBody @Valid DadosAtualizacaoMusculo dados) {
		var musculo = repository.getReferenceById(dados.id());
		musculo.atualizarInformacoes(dados);
		
		return ResponseEntity.ok(new DadosDetalhamentoMusculo(musculo));
    }
	
	@PutMapping ("/{id}")
    @Transactional
    public ResponseEntity inativar(@PathVariable long id) {
		var musculo = repository.getReferenceById(id);
		musculo.inativar();
		
		return ResponseEntity.noContent().build();
    }
	
	@DeleteMapping("/{id}")
	@Transactional
	public ResponseEntity excluir(@PathVariable long id) {
		repository.deleteById(id);
		
		return ResponseEntity.noContent().build();
	}
}