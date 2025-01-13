import 'package:flutter/material.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Defina a altura desejada
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF013A65), // Cor de fundo da AppBar
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(17.0)), // Bordas arredondadas
          ),
          child: AppBar(
            toolbarHeight: 100.0,
            title: Text(
              'Alfa',
              style: TextStyle(
                wordSpacing: -0.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Nunito',
                fontSize: 45,
                letterSpacing: -0.5,
              ),
            ),
            backgroundColor: Colors
                .transparent, // Torna a cor de fundo da AppBar transparente
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
      ),

      // drawer: Drawer(),
      body: Column(children: [
        Expanded(
          child: Container(
            color: Color(0xFF1B1C1E),
            padding: const EdgeInsets.only(top: 165.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Usuário(CPF)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide:
                              BorderSide(color: Color(0xFF013A65), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide:
                              BorderSide(color: Colors.white38, width: 2.0),
                        ))),
                PasswordField(),
                DropdownField(),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

//CAMPO DE SENHA, COM O BOTÃO DE OCULTAR E MOSTRAR!
class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _ocultado = true;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 0.0, right: 0.0),
      child: Container(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: TextField(
          controller: _controller,
          obscureText: _ocultado,
          style: TextStyle(color: Colors.white70),
          decoration: (InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: 'Senha',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white38, width: 2.0),
              borderRadius: BorderRadius.circular(13.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(_ocultado ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _ocultado = !_ocultado;
                });
              },
            ),
          )),
        ),
      ),
    );
  }
}

//CAMPO DE CAIXA SELECIONÁVEL!
class DropdownField extends StatefulWidget {
  const DropdownField({super.key});

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  String? _opcaoSelecionada;
  final List<String> options = [
    'Alfa ID',
    'Homologação',
    'Fábrica',
    'Montagem',
    'AP',
    'GERDAUOB',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(),
        padding: const EdgeInsets.only(top: 30.0, left: 0.0, right: 0.0),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(13.0),
          value: _opcaoSelecionada,
          hint: Text('Selecione o Centro de Custo', style: TextStyle(color: Colors.white70))),
          items: options.map((String option) {
            return DropdownMenuItem(value: option, child: Text(option));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _opcaoSelecionada = newValue;
            });
          },
        ),
      ),
    ]);
  }
}
