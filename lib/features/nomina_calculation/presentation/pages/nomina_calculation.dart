import 'package:flutter/material.dart';
import 'package:nomina_calc/features/nomina_calculation/presentation/pages/nomina_retenciones.dart';

class NominaCalcutation extends StatefulWidget {
  const NominaCalcutation({super.key});

  @override
  State<NominaCalcutation> createState() => _NominaCalcutationState();
}

class _NominaCalcutationState extends State<NominaCalcutation> {
  final _formKey = new GlobalKey<FormState>();
  final _nominaController = TextEditingController();
  //bool _validate = false;

    @override
  void dispose() {
    _nominaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var f = FocusScope.of(context);

        if (!f.hasPrimaryFocus) {
          f.unfocus();
        }
      },
      child: Scaffold(
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SizedBox(
                  width: 300.0,
                  child: /*TextField(
                    controller: _nominaController,
                    decoration: InputDecoration(
                      labelText: 'Sueldo Mensual',
                      border: const OutlineInputBorder(),
                      hintText: 'Insert su sueldo mensual',
                      errorText: _validate ? 'Campo no puede estar vacio.' : null
                      
                    ),
                  ),*/
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _nominaController,
                      keyboardType: TextInputType.number, // Only numeric input
                      decoration: const InputDecoration(
                      labelText: 'Enter a number',
                                ),
                      validator: _validateInput,
                    ),
                  ),

                ),
              ),
       

                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: const Text(
                      'Calcular Retenciones',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {

                      
                     if (_formKey.currentState!.validate()) {
                  // Valid input, do something with it
                  final value = int.parse(_nominaController.text);
                  _sendDataToSecondScreen(context);
                  // ignore: avoid_print
                  print('Valid input: $value');
                }

        
                    },
                  ),
                ),
              
        
            ],
          ),
        ),
      ),
    );
  }

 void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = _nominaController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NominaRetenciones(nomina: textToSend),
        ));
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    
    final number = int.tryParse(value);

    if (number == null || number <= 0) {
      return 'Please enter a value greater than zero';
    }
    return null;
  }



 
}