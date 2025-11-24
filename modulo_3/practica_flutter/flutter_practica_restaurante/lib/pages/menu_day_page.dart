import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuDayPage extends StatefulWidget {
  const MenuDayPage({super.key});

  @override
  State<MenuDayPage> createState() => _MenuDayPageState();
}

class _MenuDayPageState extends State<MenuDayPage> {
  String clientType = 'Nuevo';
  String priceText = '';
  String quantityText = '';
  String resultText = '';

  void calculateTotal() {
    final price = double.tryParse(priceText.replaceAll(',', '.')) ?? 0.0;
    final quantity = int.tryParse(quantityText) ?? 0;

    if (price <= 0 || quantity <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos para precio y cantidad';
      });
      return;
    }

    final subtotal = price * quantity;
    double discountPercentage = 0.0;

    // Calcular descuento según tipo de cliente
    if (clientType == 'Nuevo') {
      discountPercentage = 0.0;
    } else if (clientType == 'Frecuente') {
      discountPercentage = 8.0;
    } else if (clientType == 'Corporativo') {
      discountPercentage = 12.0;
    }

    final discountAmount = subtotal * (discountPercentage / 100);
    final finalTotal = subtotal - discountAmount;

    setState(() {
      resultText =
          'Tipo de cliente: $clientType\n'
          'Subtotal: \$${subtotal.toStringAsFixed(2)}\n'
          'Descuento: ${discountPercentage.toStringAsFixed(0)}%\n'
          'Monto de descuento: \$${discountAmount.toStringAsFixed(2)}\n'
          'Total final: \$${finalTotal.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú del día'),
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
              'Cálculo de pago - Menú del día',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Precio base del menú (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                priceText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de menús',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                quantityText = value;
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: clientType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Nuevo',
                  child: Text('Cliente Nuevo (0% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Frecuente',
                  child: Text('Cliente Frecuente (8% descuento)'),
                ),
                DropdownMenuItem(
                  value: 'Corporativo',
                  child: Text('Cliente Corporativo (12% descuento)'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  clientType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateTotal,
              child: const Text('Calcular total'),
            ),

            const SizedBox(height: 16),
            Text(
              resultText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
