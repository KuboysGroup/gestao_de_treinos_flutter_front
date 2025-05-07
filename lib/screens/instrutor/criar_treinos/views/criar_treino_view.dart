// ignore_for_file: use_build_context_synchronously

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/requests/exercicios_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/states/grupo_muscular_selecionado_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/views/selecionar_grupo.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/requests/treinos_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/states/treinos_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class CriarTreinoView extends HookConsumerWidget {
  final Usuario usuario;
  const CriarTreinoView({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nomeController = useTextEditingController();
    ref.watch(treinosStateProvider);

    Future<void> criarTreino() async {
      if (nomeController.text.isEmpty) {
        showTostification(
            context, ToastificationType.warning, 'Aviso', 'Preencha o nome');
        return;
      }
      Map<String, dynamic> treino = {
        "idTreino": null,
        "nomeTreino": nomeController.text,
        "idInstrutor": usuario.id,
        "exercicios": []
      };

      try {
        final response = await TreinosRequests.registrarTreino(treino);
        if (response != 200) {
          showTostification(context, ToastificationType.error, 'Ops :(',
              'Erro ao cadastrar Treino');
        } else {
          ref.invalidate(treinosStateProvider);
          context.pop();
          showTostification(
              context, ToastificationType.success, 'Treino cadastrado!', '');
        }
      } catch (e) {
        showTostification(context, ToastificationType.error, 'Ops :(',
            'Erro ao cadastrar Treino');
      }
    }

    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Criar Treino', style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Crie um novo treino',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    TextFormField(
                      enabled: true,
                      controller: nomeController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Nome do treino',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(),
                    Button(
                      onTap: () {
                        criarTreino();
                      },
                      type: ButtonType.filled,
                      color: Colors.orangeAccent,
                      title: 'Concluir',
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
