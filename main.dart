import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _currentNumber = "";
  double _num1 = 0;
  String _operand = "";
  List<String> _history = [];
  int _selectedIndex = 0;

  // Clave global para el Scaffold, necesaria para abrir el endDrawer programáticamente
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentNumber = "";
        _num1 = 0;
        _operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "*" ||
          buttonText == "/") {
        if (_currentNumber.isNotEmpty) {
          _num1 = double.parse(_currentNumber);
          _operand = buttonText;
          _currentNumber = "";
          _output = _num1.toString() + _operand;
        } else if (_operand.isNotEmpty && _output.isNotEmpty) {
          _operand = buttonText;
          if (_output.endsWith("+") ||
              _output.endsWith("-") ||
              _output.endsWith("*") ||
              _output.endsWith("/")) {
            _output = _output.substring(0, _output.length - 1) + _operand;
          } else {
            _output += _operand;
          }
        }
      } else if (buttonText == "=") {
        if (_currentNumber.isNotEmpty && _operand.isNotEmpty) {
          double num2 = double.parse(_currentNumber);
          double result = 0;
          String currentCalculation = "";

          if (_operand == "+") {
            result = _num1 + num2;
          } else if (_operand == "-") {
            result = _num1 - num2;
          } else if (_operand == "*") {
            result = _num1 * num2;
          } else if (_operand == "/") {
            if (num2 != 0) {
              result = _num1 / num2;
            } else {
              _output = "Error";
              _currentNumber = "";
              _num1 = 0;
              _operand = "";
              return;
            }
          }
          currentCalculation =
          '${_num1.toString()} $_operand ${num2.toString()} = ${result.toString()}';
          _history.add(currentCalculation);

          _output = result.toString();
          _currentNumber = result.toString();
          _operand = "";
          _num1 = 0;
        }
      } else if (buttonText == ".") {
        if (!_currentNumber.contains(".")) {
          _currentNumber += buttonText;
          _output = _currentNumber;
        }
      } else {
        if (_output == "0" ||
            _output == "Error" ||
            (_operand.isNotEmpty &&
                _currentNumber.isEmpty &&
                !_output.endsWith(_operand))) {
          _currentNumber = buttonText;
          _output = _currentNumber;
        } else if (_operand.isNotEmpty &&
            _currentNumber.isEmpty &&
            _output.endsWith(_operand)) {
          _currentNumber += buttonText;
          _output += buttonText;
        } else {
          _currentNumber += buttonText;
          _output = _currentNumber;
        }
      }
    });
  }

  Widget _buildButton(String buttonText,
      {Color textColor = Colors.black, Color? buttonBackgroundColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackgroundColor ?? Colors.white70,
            padding: EdgeInsets.all(24.0),
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: textColor),
          ),
          onPressed: () => _buttonPressed(buttonText),
        ),
      ),
    );
  }

  Widget _buildCalculatorBody() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            _output,
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(children: <Widget>[
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("/",
                    buttonBackgroundColor: Colors.orange,
                    textColor: Colors.white),
              ]),
              Row(children: <Widget>[
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("*",
                    buttonBackgroundColor: Colors.orange,
                    textColor: Colors.white),
              ]),
              Row(children: <Widget>[
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-",
                    buttonBackgroundColor: Colors.orange,
                    textColor: Colors.white),
              ]),
              Row(children: <Widget>[
                _buildButton("."),
                _buildButton("0"),
                _buildButton("C",
                    buttonBackgroundColor: Colors.grey.shade700,
                    textColor: Colors.white),
                _buildButton("+",
                    buttonBackgroundColor: Colors.orange,
                    textColor: Colors.white),
              ]),
              Row(children: <Widget>[
                _buildButton("=",
                    buttonBackgroundColor: Colors.green,
                    textColor: Colors.white),
              ])
            ],
          ),
        )
      ],
    );
  }

  Widget _buildExamplePage(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _getCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildCalculatorBody();
      case 1:
        return _buildExamplePage('Ajustes (Ejemplo)');
      default:
        return _buildCalculatorBody();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget para el contenido del EndDrawer (Barra Lateral Derecha)
  Widget _buildSettingsEndDrawer(BuildContext context) {
    return Drawer( // Sí, también se usa el widget Drawer para el endDrawer
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Configuración Rápida'),
            automaticallyImplyLeading: false, // No mostrar botón de atrás aquí
            backgroundColor: Theme.of(context).colorScheme.secondary, // Un color diferente para distinguirlo
          ),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Modo Oscuro (No imp.)'),
            trailing: Switch(
              value: false, // Deberías conectar esto a una variable de estado real
              onChanged: (bool value) {
                // Lógica para cambiar el tema
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Modo oscuro cambiado (No imp.)')),
                );
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.vibration),
            title: Text('Vibración (No imp.)'),
            trailing: Switch(
              value: true, // Deberías conectar esto a una variable de estado real
              onChanged: (bool value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Vibración cambiada (No imp.)')),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Acerca de (No imp.)'),
            onTap: () {
              Navigator.pop(context); // Cierra el endDrawer
              // Mostrar diálogo de "Acerca de"
            },
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Asignar la clave al Scaffold
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Calculadora Flutter' : 'Ajustes'),
        actions: <Widget>[
          if (_selectedIndex == 0)
            PopupMenuButton<String>(
              onSelected: (String result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Configuración seleccionada: $result')),
                );
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'modo_cientifica',
                  child: Text('Modo Científica (No imp.)'),
                ),
                const PopupMenuItem<String>(
                  value: 'cambiar_tema',
                  child: Text('Cambiar Tema (No imp.)'),
                ),
                const PopupMenuItem<String>(
                  value: 'precision_decimal',
                  child: Text('Precisión Decimal (No imp.)'),
                ),
              ],
            ),
          // Botón para abrir el endDrawer (barra lateral derecha)
          IconButton(
            icon: Icon(Icons.settings), // Puedes cambiar este ícono
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer(); // Abre el endDrawer
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Historial'),
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).primaryColor ?? Colors.blue,
            ),
            Expanded(
              child: _history.isEmpty
                  ? Center(
                  child: Text(
                    'No hay historial todavía.',
                    style: TextStyle(color: Colors.grey[600]),
                  ))
                  : ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _history.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _history[_history.length - 1 - index];
                  return ListTile(
                    title: Text(item),
                    dense: true,
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text('Cargando: $item (No imp.)')),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 1),
              ),
            ),
            if (_history.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton.icon(
                  icon: Icon(Icons.delete_sweep, color: Colors.red),
                  label: Text('Limpiar Historial',
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    setState(() {
                      _history.clear();
                    });
                    Navigator.pop(context);
                  },
                ),
              )
          ],
        ),
      ),
      // AQUÍ SE AÑADE EL ENDDRAWER
      endDrawer: _buildSettingsEndDrawer(context),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculadora',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor ?? Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
