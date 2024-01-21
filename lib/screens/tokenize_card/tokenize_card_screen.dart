import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';


class TokenizeCardScreen extends StatelessWidget {
  const TokenizeCardScreen({super.key});

  static const String routeName = '/tokenize';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const TokenizeCardScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokenize Card Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the method to initialize Flutterwave and tokenize the card
            handlePaymentInitialization(context);
          },
          child: const Text('Tokenize Card'),
        ),
      ),
    );
  }

  // Method to initialize Flutterwave and tokenize the card
  void handlePaymentInitialization(BuildContext context) async {
    final Customer customer = Customer(
      name: "Flutterwave Developer",
      phoneNumber: "1234566677777",
      email: "customer@customer.com",
    );

    final Flutterwave flutterwave = Flutterwave(
      context: context,
      publicKey: "FLWPUBK_TEST-952dce212bde522a89103f938695717c-X",
      currency: "NGN",
      redirectUrl: "https://your-redirect-url.com",
      txRef: "your-unique-reference-here",
      amount: "3000",
      customer: customer,
      paymentOptions: "card",  // Specify the payment option(s) you want to support
      customization: Customization(title: "My Payment"),
      isTestMode: true,
    );

    // Now you can tokenize the card
    final ChargeResponse response = await flutterwave.charge();

    // Handle the response (verify the transaction, show success/failure, etc.)
    if (response != null && response.status == "success") {
      // Payment was successful
      print("Payment successful. Transaction ID: ${response.transactionId}");
    } else {
      // Payment failed or was canceled
      print("Payment failed or canceled.");
    }
  }
}
