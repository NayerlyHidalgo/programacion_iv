import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComboPage extends StatefulWidget {
  const ComboPage({super.key});

  @override
  State<ComboPage> createState() => _ComboPageState();
}

class _ComboPageState extends State<ComboPage> {
  String dishType = 'Pollo';
  String drinkType = 'Gaseosa';
  String sideType = 'Papas';
  String dishQuantityText = '';
  String drinkQuantityText = '';
  String sideQuantityText = '';
  String resultText = '';

  void calculateTotal() {
    final dishQuantity = int.tryParse(dishQuantityText) ?? 0;
    final drinkQuantity = int.tryParse(drinkQuantityText) ?? 0;
    final sideQuantity = int.tryParse(sideQuantityText) ?? 0;

    if (dishQuantity <= 0 || drinkQuantity <= 0 || sideQuantity <= 0) {
      setState(() {
        resultText = 'Error: Todas las cantidades deben ser mayores a 0';
      });
      return;
    }

    // Precios de platos
    double dishPrice = 0.0;
    if (dishType == 'Pollo') {
      dishPrice = 6.0;
    } else if (dishType == 'Carne') {
      dishPrice = 7.0;
    } else if (dishType == 'Vegetariano') {
      dishPrice = 5.0;
    }

    // Precios de bebidas
    double drinkPrice = 0.0;
    if (drinkType == 'Gaseosa') {
      drinkPrice = 2.0;
    } else if (drinkType == 'Jugo') {
      drinkPrice = 3.0;
    } else if (drinkType == 'Agua') {
      drinkPrice = 1.0;
    }

    // Precios de acompañamientos
    double sidePrice = 0.0;
    if (sideType == 'Papas') {
      sidePrice = 2.0;
    } else if (sideType == 'Ensalada') {
      sidePrice = 2.5;
    } else if (sideType == 'Pan') {
      sidePrice = 1.5;
    }

    final dishSubtotal = dishPrice * dishQuantity;
    final drinkSubtotal = drinkPrice * drinkQuantity;
    final sideSubtotal = sidePrice * sideQuantity;
    final totalGeneral = dishSubtotal + drinkSubtotal + sideSubtotal;

    setState(() {
      resultText =
          'Subtotal Platos ($dishType x $dishQuantity): \$${dishSubtotal.toStringAsFixed(2)}\n'
          'Subtotal Bebidas ($drinkType x $drinkQuantity): \$${drinkSubtotal.toStringAsFixed(2)}\n'
          'Subtotal Acompañamientos ($sideType x $sideQuantity): \$${sideSubtotal.toStringAsFixed(2)}\n'
          'Total General: \$${totalGeneral.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combos'),
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
                'Arma tu combo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Tipo de plato
              const Text(
                'Tipo de plato:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: dishType,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Pollo',
                    child: Text('Pollo (\$6.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'Carne',
                    child: Text('Carne (\$7.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'Vegetariano',
                    child: Text('Vegetariano (\$5.00)'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    dishType = value;
                  });
                },
              ),

              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de platos',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  dishQuantityText = value;
                },
              ),

              const SizedBox(height: 16),

              // Tipo de bebida
              const Text(
                'Bebida:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: drinkType,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Gaseosa',
                    child: Text('Gaseosa (\$2.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'Jugo',
                    child: Text('Jugo (\$3.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'Agua',
                    child: Text('Agua (\$1.00)'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    drinkType = value;
                  });
                },
              ),

              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de bebidas',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  drinkQuantityText = value;
                },
              ),

              const SizedBox(height: 16),

              // Tipo de acompañamiento
              const Text(
                'Acompañamiento:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: sideType,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Papas',
                    child: Text('Papas (\$2.00)'),
                  ),
                  DropdownMenuItem(
                    value: 'Ensalada',
                    child: Text('Ensalada (\$2.50)'),
                  ),
                  DropdownMenuItem(
                    value: 'Pan',
                    child: Text('Pan (\$1.50)'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    sideType = value;
                  });
                },
              ),

              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de acompañamientos',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  sideQuantityText = value;
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
      ),
    );
  }
}
