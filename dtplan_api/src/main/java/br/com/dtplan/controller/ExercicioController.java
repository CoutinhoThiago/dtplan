package br.com.dtplan.controller;

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
import br.com.dtplan.exercicios.DadosCadastroExercicio;
import br.com.dtplan.exercicios.DadosListagemExercicio;
import br.com.dtplan.exercicios.Exercicio;
import br.com.dtplan.exercicios.ExercicioRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/exercicios")
public class ExercicioController {
	
	@Autowired
	private ExercicioRepository repository;
	
	@PostMapping
	@Transactional
	public ResponseEntity cadastrar(@RequestBody DadosCadastroExercicio dados, UriComponentsBuilder uriBuilder) {
		var exercicio = new Exercicio(dados);
		repository.save(exercicio);
		
		var uri = uriBuilder.path("exercicio/{id}").buildAndExpand(exercicio.getId()).toUri();
		var dto = new DadosDetalhamentoExercicio(exercicio);
		
		return ResponseEntity.created(uri).body(dto);
	}

	@GetMapping
    public ResponseEntity<Page<DadosListagemExercicio>> listar(@PageableDefault(size = 10, sort = {"nome"}) Pageable paginacao) {
		var page = repository.findAll(paginacao).map(DadosListagemExercicio::new);
		
		return ResponseEntity.ok(page);
    }
	
	@PutMapping
    @Transactional
    public ResponseEntity atualizar(@RequestBody @Valid DadosAtualizacaoExercicio dados) {
		var exercicio = repository.getReferenceById(dados.id());
		exercicio.atualizarInformacoes(dados);
		
		return ResponseEntity.ok(new DadosDetalhamentoExercicio(exercicio));
    }
	
	@PutMapping ("/{id}")
    @Transactional
    public ResponseEntity inativar(@PathVariable long id) {
		var exercicio = repository.getReferenceById(id);
		exercicio.inativar();
		
		return ResponseEntity.noContent().build();
    }
	
	@DeleteMapping("/{id}")
	@Transactional
	public ResponseEntity excluir(@PathVariable long id) {
		repository.deleteById(id);
		
		return ResponseEntity.noContent().build();
	}
}