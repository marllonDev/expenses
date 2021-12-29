class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
 
  Transaction({//parâmetro nomeados, mas foi colocado o 'required' para dizer que é obrigatório.
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}