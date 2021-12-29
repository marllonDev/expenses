import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    //aqui tem uma lista de transações
    Transaction(
      //aqui foi chamado o construtor e foi definido valores em seus atributos.
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(), //tempo de exatamente agora.
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(), //tempo de exatamente agora.
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //componentes dento do Scaffold(esqueleto da página).
      appBar: AppBar(title: Text('Despesas Pessoais')), //topo do app
      body: Column(
        //obs: na column(coluna) os widgets são posicionados de forma vertical e na Row(linha) na forma horizontal.
        mainAxisAlignment: MainAxisAlignment
            .spaceAround, //posiciona na linha vertical. spaceAround = espaço em volta.
        crossAxisAlignment: CrossAxisAlignment
            .stretch, //posiciona na linha(horizontal). stretch = esticar.
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                //dentro deste Card teremos Column, Row e Container para agrupar as informações na vertical, horizontal e em bloco respectivamente.
                child: Row(
                  children: <Widget>[
                    Container(
                      //Container que mostra o valor no lado direito da tela.
                      margin: EdgeInsets.symmetric(//symmetric foi posto para ser diferente os valores dos eixos verticais e horizontais.
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',//mostra o valor
                        style: TextStyle(//mudando o estilo do texto
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                        ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,//para posiciona os textos no início.
                      //Column que mostra o Title e o Date, um em baixo do outro.
                      children: <Widget>[
                        Text(
                          tr.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold, 
                          ),
                        ),
                        Text(
                          DateFormat('d MMMM y').format(tr.date),//isso pôde ser usado por causa da dependência 'intl'.
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
