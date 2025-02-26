import 'dart:convert';

void main() {
  
  // 1) Cálculo da variável SOMA
  int INDICE = 13, SOMA = 0, K = 0;
  while (K < INDICE) {
    K = K + 1;
    SOMA = SOMA + K;
  }
  print("Valor da variável SOMA: $SOMA");

  // 2) Verificar se um número pertence à sequência de Fibonacci
  int numero = 21;
  print("O número $numero pertence à sequência de Fibonacci? ${isFibonacci(numero)}");

  // 3) Faturamento diário
  String jsonData = '''{
    "faturamento": [1000, 2000, 0, 3000, 4000, 0, 5000, 6000, 7000, 0, 8000, 9000]
  }''';
  calcularFaturamento(jsonData);

  // 4) Percentual de faturamento por estado
  Map<String, double> faturamentoEstados = {
    "SP": 67836.43,
    "RJ": 36678.66,
    "MG": 29229.88,
    "ES": 27165.48,
    "Outros": 19849.53
  };
  calcularPercentual(faturamentoEstados);

  // 5) Inverter string
  String palavra = "Flutter";
  print("String invertida: ${inverterString(palavra)}");
}

// Função para verificar se um número pertence à sequência de Fibonacci
bool isFibonacci(int numero) {
  int a = 0, b = 1;
  while (b < numero) {
    int temp = a + b;
    a = b;
    b = temp;
  }
  return b == numero || numero == 0;
}

// Função para calcular estatísticas do faturamento diário
void calcularFaturamento(String jsonData) {
  var data = json.decode(jsonData);
  List<dynamic> faturamento = data['faturamento'];
  faturamento = faturamento.where((e) => e > 0).map((e) => e.toDouble()).toList();

  double menorValor = faturamento.reduce((a, b) => a < b ? a : b);
  double maiorValor = faturamento.reduce((a, b) => a > b ? a : b);
  double media = faturamento.reduce((a, b) => a + b) / faturamento.length;
  int diasAcimaMedia = faturamento.where((e) => e > media).length;

  print("Menor faturamento: $menorValor");
  print("Maior faturamento: $maiorValor");
  print("Dias acima da média: $diasAcimaMedia");
}

// Função para calcular percentual de cada estado
void calcularPercentual(Map<String, double> faturamentoEstados) {
  double total = faturamentoEstados.values.reduce((a, b) => a + b);
  faturamentoEstados.forEach((estado, valor) {
    double percentual = (valor / total) * 100;
    print("Estado $estado: ${percentual.toStringAsFixed(2)}%");
  });
}

// Função para inverter uma string sem usar funções prontas
String inverterString(String input) {
  String resultado = "";
  for (int i = input.length - 1; i >= 0; i--) {
    resultado += input[i];
  }
  return resultado;
}
