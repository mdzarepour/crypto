import 'package:crypto/components/constants/urls.dart';
import 'package:crypto/components/models/crypto_model.dart';
import 'package:dio/dio.dart';

class DioServices {
  Future<List<CryptoModel>> getData() async {
    Response response = await Dio().get(url);
    List<CryptoModel> cryptoList = response.data['data']
        .map<CryptoModel>((e) => CryptoModel.fromJsonObject(e))
        .toList();
    return cryptoList;
  }
}
