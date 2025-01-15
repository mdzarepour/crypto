import 'package:crypto/components/constants/solid_colors.dart';
import 'package:crypto/components/constants/strings.dart';
import 'package:crypto/components/models/crypto_model.dart';
import 'package:crypto/components/widgets/list_tile_widget.dart';
import 'package:crypto/dio_services.dart/dio_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class MainScreen extends StatefulWidget {
  final List<CryptoModel> cryptoList;
  const MainScreen({super.key, required this.cryptoList});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<CryptoModel> cryptoList;
  bool listStatus = false;
  @override
  void initState() {
    cryptoList = widget.cryptoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            await refreshList(cryptoList);
            showSnackBar(
                listStatus == false ? 'refreshe' : 'try again after seconds');
          },
          child: ListView.builder(
            itemCount: cryptoList.length,
            itemBuilder: (context, index) {
              return ListTileWidget(
                  index: index,
                  changePercent24Hr: cryptoList[index]
                      .changePercent24Hr
                      .toString()
                      .substring(0, 10),
                  icon: _getChangesIcon(
                      cryptoList[index].changePercent24Hr, index),
                  name: cryptoList[index].name,
                  priceUsd:
                      cryptoList[index].priceUsd.toString().substring(0, 12),
                  rank: cryptoList[index].rank.toString(),
                  symbol: cryptoList[index].symbol);
            },
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Strings.appbarImage,
            height: 50,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(Strings.appBarTitle),
        ],
      ),
    );
  }

  Icon _getChangesIcon(double changes, int index) {
    if (changes < 0) {
      return const Icon(
        Icons.arrow_downward,
        color: SolidColors.redColor,
      );
    } else {
      return Icon(
        Icons.arrow_upward,
        color: SolidColors.greenColor,
      );
    }
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  refreshList(List<CryptoModel> oldList) async {
    int counter = 0;
    List<CryptoModel> newList = await DioServices().getData();
    for (int i = 0; i < oldList.length; i++) {
      if (oldList[i].priceUsd.toString() != (newList[i].priceUsd.toString())) {
        counter++;
      }
    }
    if (counter == 0) {
      listStatus = true;
    } else if (counter > 0) {
      listStatus = false;
    }
    setState(() {
      cryptoList = newList;
    });

    developer.log('List status: ' + listStatus.toString());
  }
}
