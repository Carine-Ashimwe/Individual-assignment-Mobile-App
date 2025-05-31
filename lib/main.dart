import 'package:flutter/material.dart';

void main() {
  runApp(TempConverterApp());
}

class TempConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: TempConverterPage(),
    );
  }
}

class TempConverterPage extends StatefulWidget {
  @override
  _TempConverterPageState createState() => _TempConverterPageState();
}

class _TempConverterPageState extends State<TempConverterPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  String _selectedConversion = 'Fahrenheit to Celsius';
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _outputController.text = '';
  }

  void _convertTemperature() {
    final input = _inputController.text.trim();

    if (input.isEmpty) {
      _showMessage('Please enter a temperature value.');
      return;
    }

    double? inputValue = double.tryParse(input);
    if (inputValue == null) {
      _showMessage('Please enter a valid number.');
      return;
    }

    double convertedValue;
    String historyEntry;

    if (_selectedConversion == 'Fahrenheit to Celsius') {
      // °F = °C x 9/5 + 32  =>  °C = (°F - 32) x 5/9
      convertedValue = (inputValue - 32) * 5 / 9;
      // Format history to match assignment requirements (showing appropriate decimal places)
      historyEntry = 'F to C: ${_formatTemperature(inputValue)} → ${_formatTemperature(convertedValue)}';
    } else {
      // °C = (°F - 32) x 5/9  =>  °F = °C x 9/5 + 32
      convertedValue = inputValue * 9 / 5 + 32;
      // Format history to match assignment requirements (showing appropriate decimal places)
      historyEntry = 'C to F: ${_formatTemperature(inputValue)} → ${_formatTemperature(convertedValue)}';
    }

    setState(() {
      // Display result to 1 decimal place as required
      _outputController.text = convertedValue.toStringAsFixed(1);
      _history.insert(0, historyEntry);
      // Keep only the most recent 10 entries
      if (_history.length > 10) {
        _history = _history.take(10).toList();
      }
    });
  }

  // Helper method to format temperature values for history display
  String _formatTemperature(double value) {
    // Check if the value is a whole number
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(1);
    } else {
      // For decimal values, show appropriate precision
      String formatted = value.toStringAsFixed(1);
      return formatted;
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
        centerTitle: false,
        titleSpacing: 16,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Conversion Selection
                Text(
                  'Conversion:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),

                // Radio buttons in horizontal layout to match the design
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Fahrenheit to Celsius', style: TextStyle(fontSize: 12)),
                        value: 'Fahrenheit to Celsius',
                        groupValue: _selectedConversion,
                        onChanged: (value) {
                          setState(() {
                            _selectedConversion = value!;
                            _inputController.clear();
                            _outputController.clear();
                          });
                        },
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Celsius to Fahrenheit', style: TextStyle(fontSize: 12)),
                        value: 'Celsius to Fahrenheit',
                        groupValue: _selectedConversion,
                        onChanged: (value) {
                          setState(() {
                            _selectedConversion = value!;
                            _inputController.clear();
                            _outputController.clear();
                          });
                        },
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Temperature Input and Output - Centered layout to match design
                Row(
                  children: [
                    // Input field
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: _inputController,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          ),
                        ),
                      ),
                    ),

                    // Equals sign
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '=',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    // Output field
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        child: TextField(
                          controller: _outputController,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Convert Button - Centered and styled to match design
                Center(
                  child: ElevatedButton(
                    onPressed: _convertTemperature,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 2,
                    ),
                    child: Text('CONVERT'),
                  ),
                ),

                SizedBox(height: 24),

                // History Section - Styled to match the design more closely
                if (_history.isNotEmpty) ...[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]!, width: 1),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _history.map((entry) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            entry,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }
}