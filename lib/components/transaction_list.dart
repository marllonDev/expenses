import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;//está fazendo uma lista em relação ao arquivo 'transaction'.

  TransactionList(this.transactions);//construtor está se referindo a linha 6.

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(//aqui é criado cada objeto da lista quando necessário para não pesar o cell.
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
         return Card(
            //dentro deste Card teremos Column, Row e Container para agrupar as informações na vertical, horizontal e em bloco respectivamente.
            child: Row(
              children: <Widget>[
                Container(
                  //Container que mostra o valor no lado esquerdo da tela.
                  margin: EdgeInsets.symmetric(
                    //symmetric foi posto para ser diferente os valores dos eixos verticais horizontais.
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
                    'R\$ ${tr.value.toStringAsFixed(2)}', //mostra o valor
                    style: TextStyle(
                      //mudando o estilo do texto
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, //para posiciona os textos no início.
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
                      DateFormat('d MMMM y').format(tr
                          .date), //isso pôde ser usado por causa da dependência 'intl'.
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
       },
      ),
    );
  }
}
