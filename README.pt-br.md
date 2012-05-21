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
		<p>
			O objetivo desse problema é dispor em um tabuleiro de xadrez 8x8 oito damas que não se ataquem. Isso quer dizer 
			que elas não devem se tocar na horizontal, vertical e diagonal. Para esse tipo de problema existem 92 soluções.
		</p>
		<p>
			<img src="https://github.com/marcoafilho/ai-mindbreaker/raw/master/resources/CHESS.png" alt="8 queens solved" /> 
		</p>
		<p>
			Usaremos algoritmos genéticos para encontrarmos uma solução de um forma mais rápida
		</p>
	</dd>
	<dt>Quebra-cabeça com peças deslizantes</dt>
	<dd>
		<p>
			Esse problema amostra trata-se de uma matriz 3x3 com 8 peças e um espaço em branco. As peças são inicialmente 
			embaralhadas, criando uma configuração aleatória. Dessa forma, um agente deve chegar a um objetivo, geralmente 
			a ordenação numérica das peças, através do deslizamento das peças para o espaço em branco.			
		</p>
		<p>
			A figura abaixo é um exemplo de configuração inicial e sua respectiva solução:			
		</p>
		<p>
			<img src="https://github.com/marcoafilho/ai-mindbreaker/raw/master/resources/SLIDE.png" alt="3x3 sliding puzzle" /> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="https://github.com/marcoafilho/ai-mindbreaker/raw/master/resources/SLIDE_SOLVED.png" alt="3x3 sliding puzzle" />
		</p>
		<p>
			Para encontrar soluções para configurações iniciais, usaremos o algoritmo A*.
		</p>
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
O projeto oferece um binário para *NIX e Windows.

### Oito damas

No Unix:

	$ ruby bin/eight_queens
	
No Windows:

	Clique duplo em bin\eight_queens.bat
	
A entrada é a população inicial (4 configurações de tabuleiro) onde o algoritmo genético será aplicado. Uma configuração é representada por um conjunto de caracteres que varia de 0-7 e podem ser dispostos de qualquer maneira. Cada caracter representa a linha em que a rainha está disposta. Exemplo:

	00624713
	
Isso significa que há uma rainha na linha 0 e coluna 0, uma rainha na linha 0 e coluna 1, uma rainha na linha 6 e coluna 3 e assim por diante.

Existem dois tipos de resultados: Quando o objetivo é encontrado e outro quando não é encontrado. Independente disso a saída da aplicação é similar.

Para uma população definida apenas com a entrada acima conseguimos a seguinte população resultante:

	A result was found!
	Last population:
	=====GOAL=====
	P(i) = 36.26%
	*--------*
	|...Q....|
	|.....Q..|
	|Q.......|
	|....Q...|
	|.Q......|
	|.......Q|
	|..Q.....|
	|......Q.|
	*--------*
	=====GOAL=====

	P(i) = 26.64%
	*--------*
	|...Q..Q.|
	|........|
	|........|
	|....Q..Q|
	|QQ......|
	|........|
	|..Q.....|
	|.....Q..|
	*--------*

	P(i) = 20.40%
	*--------*
	|...QQ...|
	|.....Q..|
	|........|
	|Q......Q|
	|.Q......|
	|......Q.|
	|..Q.....|
	|........|
	*--------*

	P(i) = 16.70%
	*--------*
	|........|
	|....Q.Q.|
	|...Q.Q..|
	|........|
	|Q.......|
	|.Q.....Q|
	|..Q.....|
	|........|
	*--------*
	
O estado objetivo é marcado com `=====GOAL=====` e o P(i) representa a probabilidade dele de acordo com a função fitness.

### Quebra-cabeça com peças deslizantes

No Unix:

	$ ruby bin/sliding_puzzle
	
No Windows:

	Clique duplo em bin\sliding_puzzle.bat
	
A entrada do problema é baseada em uma configuração de 9 dígitos (0-8). Esse dígitos *não* podem se repetir. Exemplo:

	283164705
	
Essa é uma representação da matriz onde cada grupo de três dígitos representa uma linha da aplicação. A saída resultante para a entrada acima é:

	Step 1:
	f(n) = 6
	*-----*
	|2|8|3|
	|1|6|4|
	|7|0|5|
	*-----*

	Step 2:
	f(n) = 5
	*-----*
	|2|8|3|
	|1|0|4|
	|7|6|5|
	*-----*

	Step 3:
	f(n) = 6
	*-----*
	|2|0|3|
	|1|8|4|
	|7|6|5|
	*-----*

	Step 4:
	f(n) = 7
	*-----*
	|0|2|3|
	|1|8|4|
	|7|6|5|
	*-----*

	Step 5:
	f(n) = 6
	*-----*
	|1|2|3|
	|0|8|4|
	|7|6|5|
	*-----*

	Step 6:
	f(n) = 5
	*-----*
	|1|2|3|
	|8|0|4|
	|7|6|5|
	*-----*

A saída mostra todos os passos executados a partir da configuração inicial para chegar ao estado objetivo. No caso do quebra-cabeça com peças deslizantes existem dois tipos de resultados possíveis. Um circular e outro linear. O estado objetivo depende da configuração inicial. O f(n) representa a função heurística mais o nível da árvore naquele momento. A heurística utilizada é a soma da distância de manhattan para cada peça.
	
### Opções extras

No problema das oito rainhas algumas opções podem ser feitas. A quantidade de iterações máximas é de 10000 e a probabilidade de mutação é de 50%, mas isso pode ser alterado com a opção -i e -p

	$ruby bin/eight_queens -i 25000 -p 0.2
	
Isso fará com que a aplicação execute com uma quantidade máxima de iterações de 25000 e com uma probabilidade de mutação de 20%.

Licença
-------
Copyright (c) 2012 Marco Almeida e Flávia Barreto. Veja a [LICENÇA][license] para detalhes.

[license]: https://github.com/marcoafilho/ai-mindbreaker/blob/master/LICENSE.pt-br.md
