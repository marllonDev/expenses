import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
  //obs: o State é dependente do Estado abaixo pois ele precisa reconstruir a IU a cada mudança.
}


class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    //Se o title estiver vazio ou o valor for menor ou igual a 0, vai sair da função.
    if (title.isEmpty || value < 0) {
      return;
    }
    widget.onSubmit(title, value);
    //esse 'widget' é um atributo que aponta para uma instancia da classe StatefulWidget que tem o atributo OnSubmit. A função OnSubmit do State da linha 3 por meio da notação ponto.
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
          child: Column(
            children: < Widget > [
              TextField(
                //local para escrever
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextField(
                //local para escrever
                controller: valueController,
                keyboardType: TextInputType.numberWithOptions(decimal:true), //teclado numérico no campo Valor com opção decimal para IPhone.
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.end, //faz o botão ficar no final.
                children: [
                  TextButton(
                    onPressed: _submitForm, //botão a ser pressionado. Foi passado a função da linha 11.
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}