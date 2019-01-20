 Ruby Challenge - Kart Race
============================

* [Descrição](https://github.com/Gympass/interview-test)

Esse é um app simples feito em Ruby('2.4.4') para rodar no terminal, e nos fornecer os resultados de uma corrida.

Para clonar o repositório digite o codigo abaixo no console:

```sh
    $ git clone https://github.com/APonce911/ruby-challenge-kart-race
    $ cd ruby-challenge-kart-race
```

Para realizar testes rode o comando:

```sh
    $ rake
```

Para iniciar o app rode o comando:

```sh
    $ ruby app.rb
```

Comandos disponiveis no app:

```sh
    What would you like to know about the race?
    1  - Race winner info
    2  - Best lap on race
    3  - Ranking table
    4  - Best laps by pilot
    5  - Time difference table (pilot x winner)
    6  - Average race pace per pilot
    99 - stop
```

OBS: corrigi a linha abaixo com nome F.MASS para F.MASSA.

```text
    Hora                               Piloto             Nº Volta   Tempo Volta       Velocidade média da volta
    23:52:17.003                    038 – F.MASS           4         1:02.787          44,321
```

OBS 2: Nos comandos 5 e 6 não inclui o piloto S.VETTEL pois ele não completou a corrida.
