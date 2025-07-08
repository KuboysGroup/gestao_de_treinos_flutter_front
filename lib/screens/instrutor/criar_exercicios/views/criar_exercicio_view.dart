// ignore_for_file: use_build_context_synchronously

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/requests/exercicios_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/states/grupo_muscular_selecionado_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/views/selecionar_grupo.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class CriarExercicioView extends HookConsumerWidget {
  const CriarExercicioView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grupoSelecionado = ref.watch(grupoMuscularSelecionadoStateProvider);
    final nomeController = useTextEditingController();
    final descrController = useTextEditingController();

    Future<void> criarExercicio() async {
      if (nomeController.text.isEmpty) {
        showTostification(
            context, ToastificationType.warning, 'Aviso', 'Preencha o nome');
        return;
      }
      if (grupoSelecionado == null) {
        showTostification(context, ToastificationType.warning, 'Aviso',
            'Selecione o grupo muscular');
        return;
      }

      if (descrController.text.isEmpty) {
        showTostification(context, ToastificationType.warning, 'Aviso',
            'Preencha a descrição do exercício');
        return;
      }

      Exercicio exercicio = Exercicio(
          id: null,
          nome: nomeController.text,
          idGrupoMuscular: grupoSelecionado.id,
          nomeGrupoMuscular: grupoSelecionado.nome,
          descricao: descrController.text);

      try {
        final response = await ExerciciosRequests.registrarExercicio(exercicio);
        if (response != 200) {
          showTostification(context, ToastificationType.error, 'Ops :(',
              'Erro ao cadastrar exercício');
        } else {
          context.pop();
          showTostification(
              context, ToastificationType.success, 'Exercício cadastrado!', '');
        }
      } catch (e) {
        showTostification(context, ToastificationType.error, 'Ops :(',
            'Erro ao cadastrar exercício');
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
                Text('Criar exercício', style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Crie um novo exercício',
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
                        hintText: 'Nome do exercício',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 24.0),
                        Text('Grupo Muscular'),
                        const SizedBox(height: 12.0),
                        GestureDetector(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.withValues(alpha: 0.15),
                              hintText: 'Grupo Muscular',
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            child: Text(grupoSelecionado == null
                                ? 'Selecione o grupo'
                                : grupoSelecionado.nome),
                          ),
                          onTap: () {
                            KModal.show(
                              direction: ModalDirection.right,
                              width: 500,
                              body: Scaffold(
                                appBar: PreferredSize(
                                  preferredSize: const Size.fromHeight(110.0),
                                  child: KModalNavigation(
                                    icon: FluentIcons.arrow_left_24_regular,
                                    onTap: () => context.pop(),
                                  ),
                                ),
                                body: const SelecionarGrupo(),
                              ),
                              context: context,
                            );
                          },
                        ),
                      ],
                    ),
                    TextFormField(
                      enabled: true,
                      controller: descrController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Descrição',
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
                        criarExercicio();
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
