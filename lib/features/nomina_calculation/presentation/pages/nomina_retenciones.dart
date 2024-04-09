import 'package:flutter/material.dart';

class NominaRetenciones extends StatelessWidget {
  
  const NominaRetenciones({
    required this.nomina,
    super.key
    });

  final String nomina;

  @override
  Widget build(BuildContext context) {
    //String montoNomina = '60,000';

    String afp = afpCalculation(nomina);
    String pdss = pdssCalculation(nomina);
    String isr = isrCalculation(nomina);
    double descuentos = double.parse(afp)+double.parse(pdss)+double.parse(isr);
    double neto = double.parse(nomina) - descuentos;

    String salarioNeto = neto.toString();
    String totalDescuentos = descuentos.toString();

    const appTitle = 'Calculadora de Nomina';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                  child: Card(
                    elevation: 10,
                    color: Colors.greenAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Card(
                            elevation: 8,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(afp),
                                  subtitle: const Text('AFP'),
                                )
                              ]),
                          ),
                          /* Card(
                            
                            elevation: 3,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(sueldo),
                              
                            ),
                          ), */
                          
                          const SizedBox(width: 12, height: 6,),
          
                          Card(
                            elevation: 8,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(pdss),
                                  subtitle: const Text('PDSS'),
                                )
                              ]),
                          ),
                          
                          const SizedBox(width: 12, height: 6,),
          
                          Card(
                            elevation: 8,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(isr),
                                  subtitle: const Text('ISR'),
                                )
                              ]),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12, height: 5,),

                Card(
                  elevation: 8,
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Card(
                            elevation: 8,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(totalDescuentos),
                                  subtitle: const Text('TOTAL DESCUENTOS'),
                                )
                              ]),
                          ),
                                                    
                          const SizedBox(width: 12, height: 6,),
          
                          Card(
                            elevation: 8,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(salarioNeto),
                                  subtitle: const Text('SALARIO NETO'),
                                )
                              ]),
                          ),
                          
                                    
                          
                        ],
                      ),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
          
        ],
      ),

      


    );
  }

//ARS RETENCION

  afpCalculation (String nominaMensual){
    double afp = 0.0287;
    double afpCalculation;
    String retencionAFP;

    if (double.parse(nominaMensual) > 0) {
      afpCalculation = double.parse(nominaMensual)  * afp;
      retencionAFP = afpCalculation.toString();
      return retencionAFP;
    } else {
      const Text('Monto ingreso mensual debe de ser mayor de 0, favor revisar monto ingresado');
      
    }
    
    
  }

//PDSS RETENCION

  pdssCalculation (String nominaMensual){
    double pdss = 0.0304;
    double pdssCalculation;
    String retencionPdss;

    if (double.parse(nominaMensual) > 0) {
      pdssCalculation = double.parse(nominaMensual)  * pdss;
      retencionPdss = pdssCalculation.toString();
      return retencionPdss;
    } else {
      const Text('Monto ingreso mensual debe de ser mayor de 0, favor revisar monto ingresado');
      
    }
    
    
  }

//ISR DIGII RETENCION

  isrCalculation (String nominaMensual){
    double isr25 = 0.25;
    double isr20 = 0.20;
    double isr15 = 0.15;

    double rango4 = 72260.25;
    double rango3 = 52027.42;
    double rango2 = 34685.00;
    //double rango1 = 72260.25;

    double excendente4 = 6648;
    double excendente3 = 2601.33;
    
    double isrCalculation;
    String retencionISR1, retencionISR2, retencionISR3, retencionISR4;
    
    

    if (double.parse(nominaMensual) >= 72260.26) {
      isrCalculation = ((double.parse(nominaMensual)-rango4)  * isr25)+excendente4;
      retencionISR4 = isrCalculation.toStringAsFixed(2);
      return retencionISR4;

    } else if(double.parse(nominaMensual) >= 52027.43){
      isrCalculation = ((double.parse(nominaMensual)-rango3)  * isr20)+excendente3;
      retencionISR3 = isrCalculation.toStringAsFixed(2);
      return retencionISR3;

    } else if(double.parse(nominaMensual) >= 34685.01){
      isrCalculation = ((double.parse(nominaMensual)-rango2)  * isr15);
      retencionISR2 = isrCalculation.toStringAsFixed(2);
      return retencionISR2;

    } else if(double.parse(nominaMensual) > 0){
      isrCalculation = 0;
      retencionISR1 = isrCalculation.toStringAsFixed(2);
      return retencionISR1;

    }else{
      const Text('Monto ingreso mensual debe de ser mayor de 0, favor revisar monto ingresado');
      
    }
    
    
  }
}