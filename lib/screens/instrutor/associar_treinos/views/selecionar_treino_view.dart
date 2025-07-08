// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/aluno_treino.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/requests/associar_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/states/treinos_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/states/usuarios_state.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class SelecionarTreinoView extends HookConsumerWidget {
  final Usuario user;
  const SelecionarTreinoView({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treinos = ref.watch(treinosStateProvider);
    ref.watch(usuariosStateProvider);
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
                Text('Exercício', style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Selecione o exercício para adicionar ao treino',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    ...treinos.when(
                        data: (treinos) => {
                              ...treinos.map((treino) {
                                return ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 12.0),
                                  leading: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.grey.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: const Center(child: Icon(Icons.man)),
                                  ),
                                  title: Text(treino.nome),
                                  onTap: () async {
                                    try {
                                      await AssociarRequests.associarTreino(
                                          treino.id, user.id!, true);
                                      AlunoTreino alunoTreino = AlunoTreino(
                                          treino: treino, quantExecucoes: 0);
                                      ref
                                          .read(usuariosStateProvider.notifier)
                                          .adicionarTreinoAoUsuario(
                                              treinoNovo: alunoTreino,
                                              usuarioId: user.id!);
                                      context.pop();
                                      showTostification(
                                          context,
                                          ToastificationType.success,
                                          'Sucesso',
                                          'treino associado ao usuário');
                                    } catch (e) {
                                      showTostification(
                                          context,
                                          ToastificationType.error,
                                          'Erro',
                                          'não foi possível associar o treino ao usuário');
                                    }
                                  },
                                );
                              })
                            },
                        error: (error, stacktrace) => {
                              ErrorData(
                                error: Text('$error'),
                              )
                            },
                        loading: () => {const Center(child: LoadingData())})
                  ],
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
