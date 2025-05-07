import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/states/usuario_state.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class LoginController {
  Future<void> attemptLogin(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController usernameController,
    TextEditingController passwordController,
  ) async {
    if (formKey.currentState!.validate()) {
      try {
        await ref
            .read(usuarioStateProvider.notifier)
            .attemptLogin(usernameController.text, passwordController.text);
      } catch (exception) {
        showTostification(
            // ignore: use_build_context_synchronously
            context,
            ToastificationType.error,
            'Aviso',
            'Erro ao realizar login'
            // json.decode(exception.toString())['mensagem']
            );
      }
    }
  }
}
