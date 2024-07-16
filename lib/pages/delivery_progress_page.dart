import 'package:cloubite_app/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgress extends StatefulWidget {
  const DeliveryProgress({super.key});

  @override
  State<DeliveryProgress> createState() => _DeliveryProgressState();
}

class _DeliveryProgressState extends State<DeliveryProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery in Progress"),
        backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            MyReceipt(),
          ],
        ),
    );
  }
}