import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HospitalizationCostPage extends StatefulWidget {
  const HospitalizationCostPage({super.key});

  @override
  State<HospitalizationCostPage> createState() => _HospitalizationCostPageState();
}

class _HospitalizationCostPageState extends State<HospitalizationCostPage> {
  String roomType = 'General';
  String insuranceType = 'Público';
  String daysText = '';
  String baseCostText = '';
  String resultText = '';

  void calculateHospitalizationCost() {
    final days = int.tryParse(daysText) ?? 0;
    final baseCost = double.tryParse(baseCostText.replaceAll(',', '.')) ?? 0.0;

    if (days <= 0 || baseCost <= 0) {
      setState(() {
        resultText = 'Ingrese valores validos';
      });
      return;
    }

    double roomMultiplier = 1.0;
    switch (roomType) {
      case 'General':
        roomMultiplier = 1.0;
        break;
      case 'Semi-privada':
        roomMultiplier = 1.4;
        break;
      case 'Privada':
        roomMultiplier = 2.0;
        break;
    }

    double insuranceDiscount = 0.0;
    switch (insuranceType) {
      case 'Público':
        insuranceDiscount = 0.30; 
        break;
      case 'Privado':
        insuranceDiscount = 0.50; 
        break;
      case 'Sin seguro':
        insuranceDiscount = 0.0;
        break;
    }

    final costPerDay = baseCost * roomMultiplier;
    final totalCostBeforeInsurance = costPerDay * days;
    final insuranceReduction = totalCostBeforeInsurance * insuranceDiscount;
    final finalCost = totalCostBeforeInsurance - insuranceReduction;

    setState(() {
      resultText = 
        'Tipo de habitación: $roomType\n'
        'Seguro médico: $insuranceType\n'
        'Días de hospitalización: $days\n'
        'Costo base diario: \$${baseCost.toStringAsFixed(2)}\n'
        'Costo diario con habitación: \$${costPerDay.toStringAsFixed(2)}\n'
        'Costo total antes de seguro: \$${totalCostBeforeInsurance.toStringAsFixed(2)}\n'
        'Descuento por seguro: \$${insuranceReduction.toStringAsFixed(2)}\n'
        '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n'
        'TOTAL A PAGAR: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de Hospitalización'),
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
              'Cálculo de costo de hospitalización',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            const Text(
              'Tipo de habitación:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: roomType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'General',
                  child: Text('General (x1.0)'),
                ),
                DropdownMenuItem(
                  value: 'Semi-privada',
                  child: Text('Semi-privada (x1.4)'),
                ),
                DropdownMenuItem(
                  value: 'Privada',
                  child: Text('Privada (x2.0)'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    roomType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            const Text(
              'Seguro médico:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: insuranceType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Público',
                  child: Text('Público (30% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Privado',
                  child: Text('Privado (50% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Sin seguro',
                  child: Text('Sin seguro (sin descuento)'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    insuranceType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Días de hospitalización',
                border: OutlineInputBorder(),
                hintText: 'Ej: 5',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                daysText = value;
              },
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo diario base (\$)',
                border: OutlineInputBorder(),
                hintText: 'Ej: 150.00',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                baseCostText = value;
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateHospitalizationCost,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Calcular Costo',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            if (resultText.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  border: Border.all(color: Colors.teal.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  resultText,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}