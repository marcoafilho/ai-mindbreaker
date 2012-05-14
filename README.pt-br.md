AI Mindbreaker [![Build Status][travis_logo]](http://travis-ci.org/marcoafilho/ai-mindbreaker)
==============

[travis_logo]:  https://secure.travis-ci.org/marcoafilho/ai-mindbreaker.png?branch=master

> Inteligência é o que você usa quando não sabe o que fazer. <br>
> -- Jean Piaget

Sobre
-----

Esse guia também está disponível em [Inglês][readme].

O AI Mindbreaker tem como objetivo resolver alguns já conhecidos [problemas amostra](http://pt.wikipedia.org/wiki/Problema_amostra).

Dentre os problemas a serem resolvidos estão:

* Problema das 8 damas;
* Quebra-cabeça com peças deslizantes;

<dl>
	<dt>Problema das 8 damas</dt>
	<dd>
		
	</dd>
	<dt>Quebra-cabeça com peças deslizantes</dt>
	<dd>
		Esse problema amostra trata-se de uma matriz 3x3 com 8 peças e um espaço em branco. As peças são inicialmente 
		embaralhadas, criando uma configuração aleatória. Dessa forma, um agente deve descobrir a configuração inicial 
		deslizando as peças para o espaço em branco.
		<br /><br />
		A figura abaixo é um exemplo de configuração inicial e sua respectiva solução:
		<br />
		<img src="https://github.com/marcoafilho/ai-mindbreaker/raw/master/resources/SLIDE.png" alt="3x3 sliding puzzle" />
		<img src="https://github.com/marcoafilho/ai-mindbreaker/raw/master/resources/SLIDE_SOLVED.png" alt="3x3 sliding puzzle" />
		<br />
		Para encontrar soluções para configurações iniciais, usaremos o algoritmo A*.
	</dd>
</dl>

[readme]: https://github.com/marcoafilho/ai-mindbreaker/blob/master/README.md

Instalação
----------
O código fonte original está disponível no [github](http://github.com/marcoafilho/ai-mindbreaker). Para instalar execute o código a seguir:

	$ git clone git@github.com:marcoafilho/ai-mindbreaker.git
	
Pronto! A aplicação já está disponível para ser executada.

Configuração
------------
A aplicação a versão 1.9.3 do Ruby. Verifique se essa é a versão do ruby instalada no seu sistema.

	$ ruby -v

Se você quiser executar os testes usados na aplicação, instale a gem Bundler primeiro. Dentro da pasta do ai-mindbreaker execute:

	$ [sudo] gem install bundler
	$ bundle install
	
Para executar os testes use o comando a seguir. Ele irá executar ambos os testes de unidade e aceitação.

	$ bundle exec rake

Uso
---

Licença
-------
Copyright (c) 2012 Marco Almeida e Flávia Barreto. Veja a [LICENÇA][license] para detalhes.

[license]: https://github.com/marcoafilho/ai-mindbreaker/blob/master/LICENSE.pt-br.md
