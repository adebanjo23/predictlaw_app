import 'package:flutter/material.dart';
import 'package:predictlaw/colors.dart' as color;

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  static const String routeName = '/check';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CheckScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  bool? hasLetterFromLandlord; // Changed from false to null
  bool? scheduledForNextTermination; // Changed from false to null
  bool? arrivedBeforeNextTermination; // Changed from false to null
  bool? rentalContractUnlimited; // Changed from false to null

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            "Some Quick Formalities Check",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildQuestion(
                  "1. Has the letter from the landlord been submitted with the official government form?"),
              _buildYesNoDialog(hasLetterFromLandlord, (value) {
                setState(() {
                  hasLetterFromLandlord = value;
                });
              }),
              const SizedBox(
                height: 15,
              ),
              _buildQuestion(
                  "2. Is the requested increase scheduled for the next official date of contract termination?"),
              _buildYesNoDialog(scheduledForNextTermination, (value) {
                setState(() {
                  scheduledForNextTermination = value;
                });
              }),
              const SizedBox(
                height: 15,
              ),
              _buildQuestion(
                  "3. Did the request for an increase arrive at least 10 days before the next official date of contract termination at the renter?"),
              _buildYesNoDialog(arrivedBeforeNextTermination, (value) {
                setState(() {
                  arrivedBeforeNextTermination = value;
                });
              }),
              const SizedBox(
                height: 15,
              ),
              _buildQuestion("4. Is the rental contract of an unlimited nature?"),
              _buildYesNoDialog(rentalContractUnlimited, (value) {
                setState(() {
                  rentalContractUnlimited = value;
                });
              }),
              const SizedBox(height: 60),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement the logic for the submit button here
                    _handleSubmission();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set the button color to green
                    minimumSize: const Size(300, 50), // Set the minimum size of the button
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                    // Set the font size of the button text
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: color.AppColor.CheckScreenBackground,
    );
  }

  void _handleSubmission() {
    if (hasLetterFromLandlord != null &&
        scheduledForNextTermination != null &&
        arrivedBeforeNextTermination != null &&
        rentalContractUnlimited != null &&
        hasLetterFromLandlord! &&
        scheduledForNextTermination! &&
        arrivedBeforeNextTermination! &&
        rentalContractUnlimited!) {
      _showSuccessDialog();
    } else if (hasLetterFromLandlord == null ||
        scheduledForNextTermination == null ||
        arrivedBeforeNextTermination == null ||
        rentalContractUnlimited == null ||
        !hasLetterFromLandlord! ||
        !scheduledForNextTermination! ||
        !arrivedBeforeNextTermination! ||
        !rentalContractUnlimited!) {
      _showFailureDialog();
    } else {
      _showIncompleteDialog();
    }
  }


  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color.AppColor.Notification,
          title: const Text('Success', style: TextStyle(color: Colors.white)),
          content: const Text(
            'Congratulations! You meet the requirements for a rental contract.',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/chat');
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showFailureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color.AppColor.Notification,
          title: const Text('Failure', style: TextStyle(color: Colors.white)),
          content: const Text(
            'Sorry, you don\'t meet the requirements for a rental contract.',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showIncompleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color.AppColor.Notification,
          title: const Text('Failure', style: TextStyle(color: Colors.white)),
          content: const Text(
            'All forms should be filled.',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuestion(String question) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        question,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildYesNoDialog(bool? value, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => onChanged(true),
          style: ElevatedButton.styleFrom(
            primary: value == true ? Colors.green : Colors.white,
          ),
          child: const Text('Yes', style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton(
          onPressed: () => onChanged(false),
          style: ElevatedButton.styleFrom(
            primary: value == false ? Colors.green : Colors.white,
          ),
          child: const Text('No', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
