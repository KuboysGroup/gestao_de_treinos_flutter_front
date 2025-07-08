// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/requests/exercicios_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/states/exercicios_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class EditarExercicioView extends HookConsumerWidget {
  final Exercicio exercicio;
  const EditarExercicioView({super.key, required this.exercicio});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(exerciciosStateProvider);
    Future<void> excluir() async {
      try {
        final response =
            await ExerciciosRequests.excluirExercicio(exercicio.id!);
        if (response != 200) {
          showTostification(context, ToastificationType.error, 'Erro',
              'Exercício faz parte de um treino');
        } else {
          ref
              .read(exerciciosStateProvider.notifier)
              .removerPreposto(exercicio.id!);
          context.pop();
          showTostification(
              context, ToastificationType.success, 'Exercício excluído!', '');
        }
      } catch (e) {
        showTostification(context, ToastificationType.error, 'Erro',
            'Exercício faz parte de um treino');
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
                Text(exercicio.nome, style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Edição do exercício',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                Column(
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nome'),
                        Text(
                          exercicio.nome,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Grupo Muscular'),
                        Text(exercicio.nomeGrupoMuscular,
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Descrição'),
                        Flexible(
                          child: Text(exercicio.descricao,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Button(
                            onTap: () {
                              excluir();
                            },
                            type: ButtonType.filled,
                            color: Colors.redAccent,
                            title: 'Excluir',
                          ),
                        ),
                      ],
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
