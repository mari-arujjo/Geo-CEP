Nesta atividade, você irá desenvolver um aplicativo Flutter simples, utilizando a mesma lógica da aula prática, com duas funcionalidades principais:

Uma entrada de um CEP pelo usuário, usando um campo de entrada para inserir um CEP.

Exibição da localização correspondente a esse CEP em um mapa usando o pacote flutter_map.

A interface do aplicativo deve conter:

Um campo de texto para o usuário digitar o CEP.

Um botão que, ao ser pressionado, consulta os dados do CEP.

Um widget FlutterMap que exibirá a localização.

Use o serviço ViaCEP (https://viacep.com.br/ws/{cep}/json/) para obter a latitude e longitude usando algum serviço complementar como BrasilAPI ou outra API que retorne coordenadas geográficas.

Exiba no mapa a posição usando MarkerLayerOptions.

Para concluir a atividade você deve entregar um arquivo APK que permita a entrada de um cep, realize a busca no webservice e mostre o local no flutter map com um marcador.

Lembre-se de criar uma aplicação que atenda aos seguintes critérios:


Funcionamento correto da requisição HTTP.

Uso adequado do JSON recebido.

Interface funcional e limpa.

Presença de tratamento de exceções (ex.: CEP inválido, falta de internet).

Exibição correta do mapa e marcador.

Use a documentação dos pacotes para personalizar seu app e explorar novas possibilidades.

Flutter Map: flutter_map | flutter_map Docs

BrasilAPI: brasilapi.com.br/docs

ViaCEP: ViaCEP - Webservice CEP e IBGE gratuito