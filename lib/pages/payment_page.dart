import 'package:cloubite_app/components/my_button.dart';
import 'package:cloubite_app/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() =>  _PaymentPageState();
}

class  _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  String cardNumber= '';
  String expiryDate= '';
  String cardHolderName= '';
  String cvvCode= '';
  bool isCvvFocused= false;

  //user tapped to payment
  void userTappedPay() {
    if(formKey.currentState!.validate()){
      //only show dialog if form is valid
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $cardHolderName"),
                Text("Card CVV Number: $cvvCode"),

              ]),
          ),
          actions: [
            //confirm button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryProgress ()),);
              }, child: const Text("Confirm")),

            //cancel button
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ],
        ));

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout Page"),
      ),
      body: Column(
        children: [
          //credit card
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, 
            onCreditCardWidgetChange: (p0) {}),

            //credit card form
            CreditCardForm(
              cardNumber: cardNumber, 
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName, 
              cvvCode: cvvCode, 
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber=data.cardNumber;
                  expiryDate=data.expiryDate;
                  cardHolderName=data.cardHolderName;
                  cvvCode=data.cvvCode;
                });
              }, 
              formKey: formKey),

              MyButton(text: "Pay Now", onTap: userTappedPay),


        ]),
    );
  }
}