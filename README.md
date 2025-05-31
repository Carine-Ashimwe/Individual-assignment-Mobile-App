# Temperature Converter App

A simple and intuitive Flutter mobile application for converting temperatures between Fahrenheit and Celsius with conversion history tracking.

## Features

- **Bidirectional Conversion**: Convert between Fahrenheit to Celsius and Celsius to Fahrenheit
- **Real-time Conversion**: Simply enter a value and tap convert to see results instantly
- **Conversion History**: Automatically tracks your last 10 conversions for easy reference
- **Input Validation**: Smart error handling for invalid inputs with user-friendly messages
- **Responsive Design**: Works seamlessly in both portrait and landscape orientations
- **Clean UI**: Modern, intuitive interface following Material Design principles

## Screenshots

The app features a clean, professional interface with:
- Radio button selection for conversion type
- Side-by-side input and output fields with an equals sign
- Prominent convert button
- Scrollable conversion history panel

## How to Use

### Basic Conversion

1. **Select Conversion Type**
   - Choose between "Fahrenheit to Celsius" or "Celsius to Fahrenheit" using the radio buttons at the top

2. **Enter Temperature Value**
   - Tap on the input field (left side)
   - Enter your temperature value (decimals are supported)
   - The app accepts both whole numbers and decimal values

3. **Convert**
   - Tap the "CONVERT" button
   - The converted result will appear in the output field (right side)
   - Results are displayed with one decimal place precision

4. **View History**
   - Your conversion history appears automatically below the convert button
   - Shows the most recent 10 conversions
   - Format: "F to C: 72.5 → 22.5" or "C to F: 22.5 → 72.5"

### Input Validation

The app includes smart validation:
- **Empty Input**: Shows "Please enter a temperature value" if the input field is empty
- **Invalid Input**: Shows "Please enter a valid number" for non-numeric inputs
- **Error Messages**: Displayed as red snackbars for 2 seconds

### Switching Conversion Types

- When you switch between Fahrenheit to Celsius and Celsius to Fahrenheit, the input and output fields are automatically cleared
- Your conversion history is preserved across conversion type changes

## Technical Details

### Conversion Formulas

- **Fahrenheit to Celsius**: °C = (°F - 32) × 5/9
- **Celsius to Fahrenheit**: °F = °C × 9/5 + 32

### Key Specifications

- **Precision**: Results displayed to 1 decimal place
- **History Limit**: Stores last 10 conversions
- **Input Type**: Accepts decimal numbers
- **Orientation Support**: Responsive design for portrait and landscape modes

## Installation & Setup

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Android device or emulator / iOS device or simulator

### Installation Steps

1. **Clone or Download**
   ```bash
   # If using git
   git clone https://github.com/Carine-Ashimwe/Individual-assignment-Mobile-App.git
   cd temp-converter
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# For Android
flutter build apk --release

# For iOS
flutter build ios --release
```

## Project Structure

```
lib/
├── main.dart                 # Main application entry point
└── (single file structure)   # All code contained in main.dart

Key Components:
├── TempConverterApp         # Main app widget
├── TempConverterPage        # Main page with conversion logic
└── _TempConverterPageState  # State management for conversions
```

## Code Architecture

- **StatefulWidget**: Manages conversion state and user interactions
- **TextEditingController**: Handles input/output field management
- **Form Validation**: Built-in input validation and error handling
- **Responsive Design**: OrientationBuilder for different screen orientations
- **Material Design**: Consistent UI following Flutter's material design guidelines

## Customization Options

You can easily customize:
- **Colors**: Modify the theme colors in `MaterialApp`
- **History Limit**: Change the history limit (currently 10) in the conversion logic
- **Decimal Precision**: Adjust `toStringAsFixed(1)` for different precision
- **UI Elements**: Modify spacing, fonts, and layout in the build method

## Troubleshooting

### Common Issues

1. **App won't start**: Ensure Flutter SDK is properly installed and `flutter doctor` shows no issues
2. **Build errors**: Run `flutter clean` and `flutter pub get`
3. **Conversion not working**: Check that you're entering valid numeric values

### Support

For issues or questions:
- Check that your input contains only numbers and decimal points
- Ensure you've selected a conversion type before converting
- Try clearing the input field and entering a new value

## Version History

- **v1.0**: Initial release with basic temperature conversion
- **Current**: Full-featured app with history tracking and input validation
