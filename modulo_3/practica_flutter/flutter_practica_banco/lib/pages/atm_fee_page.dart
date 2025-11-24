import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AtmFeePage extends StatefulWidget {
  const AtmFeePage({super.key});

  @override
  State<AtmFeePage> createState() => _AtmFeePageState();
}

class _AtmFeePageState extends State<AtmFeePage> {
  String cardType = 'Débito nacional';
  String amountText = '';
  String ageText = '';
  String licenseStatus = 'No';
  String resultText = '';

  void calculateAtmFee() {
    final age = int.tryParse(ageText) ?? 0;
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    // Verificar si es mayor de edad y tiene licencia
    if (age < 18) {
      setState(() {
        resultText = 'Debe ser mayor de edad (18 años o más)';
      });
      return;
    }

    if (licenseStatus == 'No') {
      setState(() {
        resultText = 'Debe tener licencia para realizar transacciones';
      });
      return;
    }

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    double fee = 0.0;

    if (cardType == 'Débito nacional') {
      fee = 0.5;
    } else if (cardType == 'Débito internacional') {
      fee = 1.5;
    } else if (cardType == 'Crédito') {
      fee = 2.0;
    }

    final total = amount + fee;

    setState(() {
      resultText =
        'Tarjeta: $cardType\n'
        'Comisión: \$${fee.toStringAsFixed(2)}\n'
        'Total debitado: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comisión de cajero'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cálculo de comisión en cajero',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ageText = value;
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: licenseStatus,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Sí',
                  child: Text('Sí, tengo licencia'),
                ),
                DropdownMenuItem(
                  value: 'No',
                  child: Text('No tengo licencia'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  licenseStatus = value;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: cardType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Débito nacional',
                  child: Text('Tarjeta débito nacional'),
                ),
                DropdownMenuItem(
                  value: 'Débito internacional',
                  child: Text('Tarjeta débito internacional'),
                ),
                DropdownMenuItem(
                  value: 'Crédito',
                  child: Text('Tarjeta de crédito'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  cardType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto a retirar (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateAtmFee,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
