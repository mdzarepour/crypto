import 'package:crypto/components/constants/strings.dart';
import 'package:crypto/components/models/crypto_model.dart';
import 'package:flutter/cupertino.dart';
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
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: SizedBox(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leadingAndTrailingTextStyle: textTheme.bodySmall,
                leading: Text(
                  cryptoList[index].rank.toString(),
                  style: textTheme.bodyMedium,
                ),
                subtitle: Text(cryptoList[index].symbol),
                title: Text(
                  cryptoList[index].name,
                  style: textTheme.labelMedium,
                ),
                trailing: SizedBox(
                  width: 150,
                  height: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            cryptoList[index]
                                .priceUsd
                                .toString()
                                .substring(0, 10),
                          ),
                          Text(
                            cryptoList[index]
                                .changePercent24Hr
                                .toString()
                                .substring(0, 6),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(CupertinoIcons.up_arrow),
                    ],
                  ),
                ),
              );
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
          SizedBox(
            width: 10,
          ),
          Text(Strings.appBarTitle),
        ],
      ),
    );
  }
}
