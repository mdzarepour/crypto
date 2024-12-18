import 'package:crypto/components/constants/urls.dart';
import 'package:crypto/components/models/crypto_model.dart';
import 'package:crypto/screens/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:crypto/components/constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<List<CryptoModel>> futureCryptoList;
  @override
  void initState() {
    super.initState();
    futureCryptoList = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<CryptoModel>>(
            future: futureCryptoList,
            builder: connectionStatus,
          ),
        ),
      ),
    );
  }

  Widget connectionStatus(context, snapshot) {
    var textTheme = Theme.of(context).textTheme;
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: const SpinKitThreeBounce(
          color: Colors.grey,
          size: 20,
        ),
      );
    } else if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error),
            const SizedBox(
              height: 40,
            ),
            const Text(Strings.connectionError),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  futureCryptoList = getData();
                });
              },
              child: Text(
                Strings.retry,
                style: textTheme.bodyMedium,
              ),
            )
          ],
        ),
      );
    } else if (snapshot.hasData) {
      List<CryptoModel> correntCryptoList = snapshot.data!;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          Navigator.of(context).pushReplacement(
            CupertinoPageRoute(
              builder: (context) => MainScreen(cryptoList: correntCryptoList),
            ),
          );
        },
      );
      return const SizedBox.shrink();
    } else {
      return const SizedBox.shrink();
    }
  }

  Future<List<CryptoModel>> getData() async {
    Response response = await Dio().get(url);
    List<CryptoModel> cryptoList = response.data['data']
        .map<CryptoModel>((e) => CryptoModel.fromJsonObject(e))
        .toList();
    return cryptoList;
  }
}
