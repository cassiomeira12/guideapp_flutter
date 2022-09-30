# Guide App

Teste prático para a Guide Investimentos


### ✔️ Projeto
- Projeto desenvolvido com Flutter versão 3.0.5
- Gestão de Estado - [GetX](https://pub.dev/packages/get)
- Client HTTP - [Dio](https://pub.dev/packages/dio)
- Charts - [MRX Charts](https://pub.dev/packages/mrx_charts)
- Auto Complete - [Flutter Typeahead](https://pub.dev/packages/flutter_typeahead)
---
<br />

### ✔️ Arquitetura
- Projeto Clean Code
- Projeto dividido em módulo (app, splash, price_variation e variation_graph)
- App com integração entre telas Android Java e telas Flutter
---
<br />

### 📡 API Yahoo Finance 
- API Rest utilizada para consultar ativos listados na bolsa e gráficos
- Base Url: https://query2.finance.yahoo.com
- Endpoint para busca de ativos: GET https://query2.finance.yahoo.com/v1/finance/search
- Endpoint para consultar dados de gráfico: GET https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA
---
<br />

### 🗺️ Telas do Aplicativo
A seguir algumas imagens do App
<p align="center"> 
  <img src="screenshot/page1.png" width="30%" title="hover text"> 
  <img src="screenshot/page2.png" width="30%" title="hover text"> 
  <img src="screenshot/page3.png" width="30%" title="hover text"> 
</p>

---
<br />

### 🔥 Configuracoes
- As variáveis de ambiente estão armazenadas no arquivo env.dart localizado na pasta lib/modules/app/domain/env.dart
- O tema do App pode ser personalizado acessando o arquivo light_theme.dart localizado na pasta lib/styles/themes/light_theme.dart
---
<br />

### 🔥 Executar Guide App
- O App pode ser executado rodando os comandos do Flutter
- flutter pub get
- flutter run
---
<br />

<footer>
  <p style="float:right; width: 40%;"> Copyright © Cássio Meira Silva 
</p>