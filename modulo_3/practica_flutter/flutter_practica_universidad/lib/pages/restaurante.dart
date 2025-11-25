import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantePage extends StatefulWidget {
  const RestaurantePage({super.key});

  @override
  State<RestaurantePage> createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage> {
  String tablesCountText = '';
  int tablesCount = 0;
  double tipPercentage = 10.0;

  final List<TextEditingController> consumptionControllers = [];

  String resultText = '';

  void _generateTables() {
    final parsed = int.tryParse(tablesCountText) ?? 0;

    if (parsed <= 0 || parsed > 10) {
      setState(() {
        resultText = 'Ingrese una cantidad de mesas entre 1 y 10';
        tablesCount = 0;
        consumptionControllers.clear();
      });
      return;
    }

    tablesCount = parsed;
    consumptionControllers.clear();

    for (int i = 0; i < tablesCount; i++) {
      consumptionControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese el consumo para cada mesa.';
    });
  }

  void _calculateTips() {
    if (tablesCount == 0) {
      setState(() {
        resultText = 'Primero indique cuántas mesas atendió y genere el formulario.';
      });
      return;
    }

    double totalConsumption = 0;
    double totalTips = 0;
    double grandTotal = 0;
    final List<String> lines = [];

    for (int i = 0; i < tablesCount; i++) {
      final consumptionText = consumptionControllers[i].text.trim();
      
      if (consumptionText.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Por favor ingrese el consumo de la mesa ${i + 1}'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final consumption = double.tryParse(consumptionText) ?? 0;
      
      if (consumption <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ingrese un valor válido para la mesa ${i + 1}'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final tip = consumption * (tipPercentage / 100);
      final total = consumption + tip;

      totalConsumption += consumption;
      totalTips += tip;
      grandTotal += total;

      lines.add('Mesa ${i + 1}: \$${consumption.toStringAsFixed(2)} + \$${tip.toStringAsFixed(2)} = \$${total.toStringAsFixed(2)}');
    }

    setState(() {
      resultText =
        'Resumen de propinas:\n'
        '${lines.join('\n')}\n\n'
        'Total consumo: \$${totalConsumption.toStringAsFixed(2)}\n'
        'Total propinas ($tipPercentage%): \$${totalTips.toStringAsFixed(2)}\n'
        'TOTAL GENERAL: \$${grandTotal.toStringAsFixed(2)}';
    });
  }

  @override
  void dispose() {
    for (final c in consumptionControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Propinas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Propinas por mesa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de mesas (1 - 10)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tablesCountText = value;
                },
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Text('Porcentaje de propina: '),
                  DropdownButton<double>(
                    value: tipPercentage,
                    items: const [
                      DropdownMenuItem(value: 10.0, child: Text('10%')),
                      DropdownMenuItem(value: 12.0, child: Text('12%')),
                      DropdownMenuItem(value: 15.0, child: Text('15%')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        tipPercentage = value!;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _generateTables,
                child: const Text('Generar mesas'),
              ),

              const SizedBox(height: 16),

              if (tablesCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tablesCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: consumptionControllers[index],
                          decoration: InputDecoration(
                            labelText: 'Consumo Mesa ${index + 1} (\$)',
                            border: const OutlineInputBorder(),
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),
              if (tablesCount > 0)
                ElevatedButton(
                  onPressed: _calculateTips,
                  child: const Text('Calcular propinas'),
                ),

              const SizedBox(height: 16),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
