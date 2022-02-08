import 'dart:convert';
import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products');

    if (result.hasError) {
      log(
        'Erro ao buscar produtos ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException('Erro ao buscar produtos');
    }

    //final List<ProductModel> languages =
    /*return result.body
        .map<ProductModel>((p) => ProductModel.fromJson(p))
        .toList();*/

    // final jsonData = json.decode(result.body);
    final responseList = List<ProductModel>.from(
        result.body.map((x) => ProductModel.fromJson(x)));

    return responseList;

    // print(languages);

    //if (result.statusCode == 200) {
    //final List<dynamic> decodeJson = jsonDecode(result.body)

    /* return decodeJson
        .map((dynamic json) => ProductModel.fromJson(json))
        .toList();*/
    //}
    //var teste = result.body.map((x) => ProductModel.fromJson(x));
    // print(teste);
    //return teste;
    // var oo =
    //   result.body.map((p) => ProductModel.fromJson(p.toString())).toList();
    //print(oo);
    //return List<ProductModel>.from(result.body);
    //.map((p) => ProductModel.fromJson(p));
    // .map<ProductModel>((p) => ProductModel.fromJson(p))
    // .toList();

    // return result.body.map((x) => ProductModel.fromJson(x));
  }

  /* List<ProductModel> productFromJson(String str) => List<ProductModel>.from(
      json.decode(str).map((x) => ProductModel.fromJson(x)));*/
}
