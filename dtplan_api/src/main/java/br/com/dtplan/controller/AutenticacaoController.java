package br.com.dtplan.controller;

import jakarta.validation.Valid;
import br.com.dtplan.domain.usuario.DadosAutenticacao;
import br.com.dtplan.domain.usuario.Usuario;
import br.com.dtplan.infra.security.DadosTokenJWT;
import br.com.dtplan.infra.security.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/login")
public class AutenticacaoController {

    @Autowired
    private AuthenticationManager manager;
    @Autowired
    private TokenService tokenService;


    @PostMapping
    public ResponseEntity efetuarLogin(@RequestBody @Valid DadosAutenticacao dados) {
        var authenticationToken = new UsernamePasswordAuthenticationToken(dados.login(), dados.senha());

        System.out.println(authenticationToken);
        var authentication = manager.authenticate(authenticationToken);

        System.out.println(authentication);
        var tokenJWT = tokenService.gerarToken((Usuario) authentication.getPrincipal());

        return ResponseEntity.ok(new DadosTokenJWT(tokenJWT));
    }

    @GetMapping
    public ResponseEntity<?> validarToken(@RequestBody Map<String, String> body) {
        String tokenJWT = body.get("token");

        // Verifique se o token foi fornecido
        if (tokenJWT == null || tokenJWT.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Token não fornecido");
        }

        boolean isValid = tokenService.isTokenValido(tokenJWT);

        if (isValid) {
            return ResponseEntity.ok("Token válido");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Token inválido ou expirado");
        }
    }
}
