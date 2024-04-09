import 'package:flutter/material.dart';


import 'package:nomina_calc/features/nomina_calculation/presentation/pages/nomina_retenciones.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class NominaCalcutation extends StatefulWidget {
  const NominaCalcutation({super.key});

  @override
  State<NominaCalcutation> createState() => _NominaCalcutationState();
}

class _NominaCalcutationState extends State<NominaCalcutation> {
  final _formKey = GlobalKey<FormState>();
  final _nominaController = TextEditingController();
  //bool _hideError = false;


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
                padding: const EdgeInsets.only(right: 18.0),
                child: Text('Cual es el monto de tu salario mensual?', 
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                            textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15, top: 10),
                child: SizedBox(
                  width: 300.0,
                  child: 
                  Form(
                    key: _formKey,
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      controller: _nominaController,
                      inputFormatters: [ThousandsFormatter(allowFraction: true)],
                      keyboardType: const TextInputType.numberWithOptions(decimal: true), // Only numeric input
                      decoration: InputDecoration(
                        //errorStyle:  const TextStyle(color: Colors.transparent, fontSize: 0, height: 0),
                        labelText: 'Ingrese el sueldo mensual',
                      //labelStyle: TextStyle( color: Colors.blueGrey[300]),
                        suffixIcon: IconButton(
                          onPressed: (){
                            _nominaController.clear();
                            
                          }, 
                          icon: const Icon(Icons.clear))
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
                      
                      print(_nominaController.text);
                      var formatNumb = _nominaController.text.replaceAll(RegExp(r'[^0-9]'), '');
                      print(formatNumb);
                      
                      if (_formKey.currentState!.validate()) {
                        // Valid input, do something with it
                        // ignore: unused_local_variable
                        final value = int.parse(formatNumb);
                    
                        _sendDataToSecondScreen(context);

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
    String textToSend = _nominaController.text.replaceAll(RegExp(r'[^0-9]'), '');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NominaRetenciones(nomina: textToSend),
        ));
  }

  String? _validateInput(String? value) {
    String formatNum = value.toString().replaceAll(RegExp(r'[^0-9]'), '');
    

    print('el valor de value dentro del if: ${formatNum}');
    if (value == null || value.isEmpty) {
      //print('1er if');
      return 'Favor de ingresar un valor';
    }
    
    final number = int.parse(formatNum);
    print('el valor de NUMBER dentro del if: ${number}');

    if (number <= 0) {
      return 'Favor de ingresar un valor mayor que cero';
    }
    //print('llego al final de la funcion');
    //return '';

    return null;
  }



 
}