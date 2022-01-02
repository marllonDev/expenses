import 'dart:math';
import 'package:flutter/material.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';
import '../models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //abaixo contém uma list feita usando o construtor Transaction.
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

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random()
          .nextDouble()
          .toString(), //aqui irá gerar um id único para cada transação.
      title:
          title, //aqui o primeiro title está se referindo ao title do atributo de Transaction e o segundo ao parâmetro da função.
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {//aqui foi feita uma função para ao clicar no botão de 'add' abrir o formulário.
    showModalBottomSheet(
        context: context,
        builder: (_) {//o builder aqui vai receber o construtor TransactionForm, para ser construído quando for clicado.
          return TransactionForm(_addTransaction);
        }
    );
    //então aqui ficou assim: a função _openTransactionFormModal irá ser chamada ao clicar do botão 'add' que irá abrir o TransactionForm e irá usar o _addTransaction como parâmetro, fazendo assim adicionar mais um evento ao formulário.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //componentes dento do Scaffold(esqueleto da página).
      appBar: AppBar(
        //topo do app
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            //add button
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //aqui foi add o scroll para possibilitar a rolagem.
        child: Column(
          //obs: na column(coluna) os widgets são posicionados de forma vertical e na Row(linha) na forma horizontal.
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
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //botão da parte de baixo.
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, //localização do botão.
    );
  }
}
