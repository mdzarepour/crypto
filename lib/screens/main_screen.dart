import 'package:crypto/components/models/crypto_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final List<CryptoModel> cryptoList;
  const MainScreen({super.key, required this.cryptoList});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<CryptoModel> cryptoList;
  @override
  void initState() {
    cryptoList = widget.cryptoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          cryptoList[0].id,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
