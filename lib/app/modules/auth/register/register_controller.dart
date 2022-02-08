import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    loadListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  void qualquer() {
    _message.value = MessageModel(
      title: 'Teste',
      message: 'Messagem Teste',
      type: MessageType.info,
    );

    //mesma coisa do message.value
    /*message(MessageModel( //melhor desse jeito
      title: 'Teste',
      message: 'Messagem Teste',
      type: MessageType.error,
    ));*/
    //loading.toggle();
    //Future.delayed(const Duration(seconds: 2), () => loading.toggle());
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();

      final usserLogged = await _authRepository.register(name, email, password);
      _loading.toggle();
      GetStorage().write(Constants.USER_KEY, usserLogged.id);

      //Get.back();

      _message(MessageModel(
        title: 'Sucesso',
        message: 'Cadastro realizado com sucesso',
        type: MessageType.info,
      ));
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar usuário', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Sucesso',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao registrar usuário', error: e, stackTrace: s);

      _message(
        MessageModel(
          title: 'Sucesso',
          message: 'Erro ao registrar usuário',
          type: MessageType.error,
        ),
      );
    }
  }
}
