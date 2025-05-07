// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/authentication/requests/cadastro_requests.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

class CadastrarScreen extends HookConsumerWidget {
  const CadastrarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipoUsuario = useState('ALUNO');
    final nomeController = useTextEditingController();
    final nascController = useTextEditingController();
    final emailController = useTextEditingController();
    final senhaController = useTextEditingController();
    final confirmSenhaController = useTextEditingController();

    Future<void> confirmarCadastro() async {
      if (nomeController.text.isEmpty) {
        showTostification(
            context, ToastificationType.warning, 'Aviso', 'Preencha o nome');
        return;
      }
      if (emailController.text.isEmpty) {
        showTostification(
            context, ToastificationType.warning, 'Aviso', 'Preencha o email');
        return;
      }

      if (nascController.text.isEmpty) {
        showTostification(context, ToastificationType.warning, 'Aviso',
            'Preencha a data de nascimento');
        return;
      }

      if (senhaController.text.isEmpty ||
          confirmSenhaController.text.isEmpty ||
          (senhaController.text != confirmSenhaController.text)) {
        showTostification(context, ToastificationType.warning, 'Aviso',
            'Senha não preenchida ou não confere');
        return;
      }

      final inputFormat = DateFormat('dd/MM/yyyy');
      final outputFormat = DateFormat('yyyy-MM-dd');
      DateTime parsedDate = inputFormat.parse(nascController.text);
      Usuario usuario = Usuario(
          id: null,
          nome: nomeController.text,
          email: emailController.text,
          senha: senhaController.text,
          dataNascimento: outputFormat.format(parsedDate),
          perfil: tipoUsuario.value);

      try {
        final response = await CadastroRequests.cadastrarRetirada(usuario,
            apiRest: ApiRest());
        if (response != 200) {
          showTostification(context, ToastificationType.error, 'Ops :(',
              'Erro ao cadastrar usuário');
        } else {
          context.pop();
          showTostification(context, ToastificationType.success,
              'Usuário cadastrado!', 'É possivel fazer login no sistem');
        }
      } catch (e) {
        showTostification(context, ToastificationType.error, 'Ops :(',
            'Erro ao cadastrar usuário');
      }
    }

    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Cadastro', style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Crie uma nova conta no nosso sistema',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 18,
                  children: [
                    TextFormField(
                      enabled: true,
                      controller: nomeController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Nome',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextFormField(
                      enabled: true,
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Email',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextFormField(
                      enabled: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataNascimentoInputFormatter()
                      ],
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: nascController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Data de nascimento',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Text('Tipo de usuário'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RadioListTile<String>(
                          activeColor: Colors.orangeAccent,
                          title: const Text('Aluno'),
                          value: 'ALUNO',
                          groupValue: tipoUsuario.value,
                          onChanged: (String? value) {
                            tipoUsuario.value = value!;
                          },
                        ),
                        RadioListTile<String>(
                          activeColor: Colors.orangeAccent,
                          title: const Text('Instrutor'),
                          value: 'INSTRUTOR',
                          groupValue: tipoUsuario.value,
                          onChanged: (String? value) {
                            tipoUsuario.value = value!;
                          },
                        ),
                      ],
                    ),
                    TextFormField(
                      enabled: true,
                      obscureText: true,
                      controller: senhaController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Senha',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextFormField(
                      enabled: true,
                      obscureText: true,
                      controller: confirmSenhaController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Confirmar senha',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Button(
                      onTap: () {
                        confirmarCadastro();
                      },
                      type: ButtonType.filled,
                      color: Colors.orangeAccent,
                      title: 'Confirmar cadastro',
                    )
                  ],
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class DataNascimentoInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    String formatted = '';
    for (int i = 0; i < digitsOnly.length && i < 8; i++) {
      if (i == 2 || i == 4) {
        formatted += '/';
      }
      formatted += digitsOnly[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
