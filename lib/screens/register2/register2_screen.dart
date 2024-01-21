import 'package:flutter/material.dart';

class Register2Screen extends StatefulWidget {
  const Register2Screen({Key? key}) : super(key: key);

  static const String routeName = '/register2';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const Register2Screen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  _Register2ScreenState createState() => _Register2ScreenState();
}

class _Register2ScreenState extends State<Register2Screen> {
  bool acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'LegalLink Terms and Conditions',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  '''
Last Updated: August 2, 2023

Welcome to LegaLink. By accessing or using the App, you agree to be bound by these Terms and Conditions ("Terms"). If you do not agree with any part of these Terms, you must not use the App.

App Description and Services
LegaLink is a virtual lawyer app that utilizes artificial intelligence to provide legal information and general guidance. The App does not constitute legal advice, and it should not be considered a substitute for professional legal counsel. We encourage users to consult with a qualified attorney for specific legal concerns.
User Registration and Accounts
a. Users must be at least 18 years old to create an account on the App.
b. Users must provide accurate, complete, and up-to-date information during the registration process.
c. Users are responsible for maintaining the confidentiality of their account credentials and for all activities conducted under their account.
d. The App reserves the right to terminate or suspend accounts that violate these Terms or for any other reason deemed appropriate.
User Content
a. By using the App, you grant LegaLink a non-exclusive, royalty-free, transferable, sublicensable, worldwide license to use, display, reproduce, and distribute your content in connection with the operation of the App.
b. Users are solely responsible for the content they upload or share on the App. Prohibited content includes but is not limited to: content that is illegal, defamatory, infringing, or harmful.
c. LegaLink reserves the right to remove or refuse to display any content that violates these Terms or is deemed inappropriate.
Intellectual Property
a. The App and its content, including but not limited to text, graphics, logos, images, and software, are protected by intellectual property laws and belong to LegaLink.
b. Users are granted a limited, non-exclusive, non-transferable, revocable license to use the App for personal, non-commercial purposes only.
c. Users must not copy, modify, distribute, or reproduce any part of the App without prior written permission from LegaLink.
Privacy Policy
a. Please refer to our Privacy Policy [link to your privacy policy] for information on how LegaLink collects, uses, and protects user data.

Modifications and Termination
a. LegaLink reserves the right to modify or terminate the App or these Terms at any time without notice.
b. If you disagree with any modifications, you must stop using the App.
Governing Law and Dispute Resolution
a. These Terms shall be governed by the laws of Nigeria.
b. Any dispute arising out of or in connection with these Terms shall be resolved through arbitration in accordance with the rules of [Arbitration Institution/Association].
Contact Information
If you have any questions or concerns regarding these Terms, please contact us at [Your Contact Email].
                  ''',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          acceptedTerms = value ?? false;
                        });
                      },
                    ),
                    Text(
                      'I accept the terms and conditions',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (acceptedTerms) {
                    // Navigate to the next screen (/home)
                    Navigator.pushNamed(context, '/signin');
                  } else {
                    // Show a red dialog box saying "Please accept terms and conditions first"
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Please accept terms and conditions first.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
