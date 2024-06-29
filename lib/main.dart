import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'menu_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: PopupMenuWidget(),
        ),
        body: const CalculatorScreen(),
      ),
    );
  }
}

class PopupMenuWidget extends StatefulWidget {
  @override
  _PopupMenuWidgetState createState() => _PopupMenuWidgetState();
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  bool _isVibrationOn = false;
  bool _isMemoryButtonsEnabled = true;
  ThemeOption _selectedTheme = ThemeOption.materialIndigo;
  DisplayFormatOption _selectedDisplayFormat =
      DisplayFormatOption.thousandDecimal;

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildThemeOption(
                  ThemeOption.materialIndigo, 'Material - Indigo'),
              _buildThemeOption(ThemeOption.materialRed, 'Material - Red'),
              _buildThemeOption(ThemeOption.materialGreen, 'Material - Green'),
              _buildThemeOption(ThemeOption.materialAmber, 'Material - Amber'),
              _buildThemeOption(ThemeOption.materialPink, 'Material - Pink'),
              _buildThemeOption(ThemeOption.materialBrown, 'Material - Brown'),
              _buildThemeOption(ThemeOption.originalBlack, 'Original - Black'),
              _buildThemeOption(ThemeOption.originalWhite, 'Original - White'),
              _buildThemeOption(ThemeOption.originalBlue, 'Original - Blue'),
              _buildThemeOption(ThemeOption.originalGreen, 'Original - Green'),
              _buildThemeOption(ThemeOption.originalRed, 'Original - Red'),
              _buildThemeOption(
                  ThemeOption.originalYellow, 'Original - Yellow'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildThemeOption(ThemeOption option, String label) {
    return ListTile(
      title: Text(label),
      trailing: Checkbox(
        value: _selectedTheme == option,
        onChanged: (value) {
          setState(() {
            _selectedTheme = option;
          });
          Navigator.pop(context); // Close the dialog
        },
      ),
      onTap: () {
        setState(() {
          _selectedTheme = option;
        });
        Navigator.pop(context); // Close the dialog
      },
    );
  }

  void _showDisplayFormatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Display Format'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildDisplayFormatOption(
                  DisplayFormatOption.thousandDecimal, '1,234.5'),
              _buildDisplayFormatOption(
                  DisplayFormatOption.thousandSpace, '1 234,5'),
              _buildDisplayFormatOption(
                  DisplayFormatOption.thousandDot, '1.234,5'),
              _buildDisplayFormatOption(
                  DisplayFormatOption.thousandQuote, '1\'234.5'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDisplayFormatOption(DisplayFormatOption option, String label) {
    return ListTile(
      title: Text(label),
      trailing: Checkbox(
        value: _selectedDisplayFormat == option,
        onChanged: (value) {
          setState(() {
            _selectedDisplayFormat = option;
          });
          Navigator.pop(context); // Close the dialog
        },
      ),
      onTap: () {
        setState(() {
          _selectedDisplayFormat = option;
        });
        Navigator.pop(context); // Close the dialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (value) {
        // Handle menu item selection here
        switch (value) {
          case 1:
            setState(() {
              _isVibrationOn = !_isVibrationOn;
            });
            break;
          case 2:
            setState(() {
              _isMemoryButtonsEnabled = !_isMemoryButtonsEnabled;
            });
            break;
          case 3:
            _showThemeDialog(context); // Show theme dialog
            break;
          case 4:
            _showDisplayFormatDialog(context); // Show display format dialog
            break;
          case 5:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShareAppPage()),
            );
            break;
          case 6:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SendFeedbackPage()),
            );
            break;
          case 7:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RateAppPage()),
            );
            break;
          case 8:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpgradePage()),
            );
            break;
          case 9:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OtherAppPage()),
            );
            break;
          case 10:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
            break;
        }
        if (kDebugMode) {
          print('Selected: $value');
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<int>(
            enabled: false,
            child: Text('Preference',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Vibration on touch'),
                Checkbox(
                  value: _isVibrationOn,
                  onChanged: (value) {
                    setState(() {
                      _isVibrationOn = value!;
                    });
                    Navigator.pop(context); // Close the popup menu
                  },
                ),
              ],
            ),
          ),
          PopupMenuItem<int>(
            value: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Memory buttons'),
                Checkbox(
                  value: _isMemoryButtonsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isMemoryButtonsEnabled = value!;
                    });
                    Navigator.pop(context); // Close the popup menu
                  },
                ),
              ],
            ),
          ),
          const PopupMenuItem<int>(
            value: 3,
            child: Text('Theme'),
          ),
          PopupMenuItem<int>(value: 4, child: const Text('Display format')),
          const PopupMenuDivider(),
          const PopupMenuItem<int>(
            enabled: false,
            child: Text('Other', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          PopupMenuItem<int>(value: 5, child: const Text('Share this app')),
          PopupMenuItem<int>(value: 6, child: const Text('Send feedback')),
          PopupMenuItem<int>(value: 7, child: const Text('Rate this app')),
          PopupMenuItem<int>(
              value: 8, child: const Text('Upgrade (Ad-Free version)')),
          PopupMenuItem<int>(value: 9, child: const Text('Other App')),
          PopupMenuItem<int>(value: 10, child: const Text('About')),
        ];
      },
      icon: const Icon(Icons.more_vert),
    );
  }
}

enum ThemeOption {
  materialIndigo,
  materialRed,
  materialGreen,
  materialAmber,
  materialPink,
  materialBrown,
  originalBlack,
  originalWhite,
  originalBlue,
  originalGreen,
  originalRed,
  originalYellow,
}

enum DisplayFormatOption {
  thousandDecimal,
  thousandSpace,
  thousandDot,
  thousandQuote,
}
