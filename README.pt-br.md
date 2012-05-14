AI Mindbreaker [![Build Status][travis_logo]](http://travis-ci.org/marcoafilho/ai-mindbreaker)
==============

> Inteligência é o que você usa quando não sabe o que fazer. <br>
> -- Jean Piaget

Sobre
-----

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
		Esse problema amostra trata-se de uma matriz 3x3 com 8 peças e um espaço em branco. As peças são deslizadas para o 
		A figura abaixo é um exemplo de configuração inicial para o quebra-cabeça de deslize:
		<img src="https://github.com/marcoafilho/ai-mindbreaker/raw/master/resources/SLIDE.png" alt="3x3 sliding puzzle" />
		![3x3 Slide puzzle][puzzle_image]

		Para solucionar o problema será usado o algoritmo A*.
	</dd>
</dl>

[travis_logo]:  https://secure.travis-ci.org/marcoafilho/ai-mindbreaker.png?branch=master
[puzzle_image]: 

Instalação
----------

Configuração
------------
The application uses Ruby 1.9.3. Make sure to have the right version installed at your system.

	$ ruby -v

If you want to run the tests used by the application, install Bundler first.

	$ [sudo] gem install bundler
	$ bundle install
	
To run the tests just execute on the project root. This command will run both unit and acceptance tests.

	$ bundle exec rake

Uso
---

Licença
-------
Copyright (c) 2012 Marco Almeida e Flávia Barreto. Veja a [LICENÇA][license] para detalhes.

[license]: https://github.com/marcoafilho/ai-mindbreaker/blob/master/LICENSE.pt-br.md
