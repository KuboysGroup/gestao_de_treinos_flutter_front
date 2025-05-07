import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/requests/associar_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/states/usuarios_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/views/selecionar_treino_view.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class AssociarTreinos extends HookConsumerWidget {
  final Usuario usuario;
  const AssociarTreinos({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarios = ref.watch(usuariosStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Associar treinos',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Associe os treinos desejados aos seus alunos',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ...usuarios.when(
                      data: (usuarios) => {
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 20,
                                children: [
                                  ...usuarios.map((user) {
                                    return ExpansionTile(
                                      title: Text(user.nome),
                                      subtitle: Text(
                                        'Treinos: ${user.treinos.length}',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      children: [
                                        ...user.treinos.map((treino) {
                                          return ListTile(
                                            title: Text(treino.nome),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  spacing: 10,
                                                  children: [
                                                    Text(
                                                      'Exercícios: ${treino.exercicios.length}',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            trailing: SizedBox(
                                              width: 200,
                                              child: Button(
                                                type: ButtonType.filled,
                                                color: Colors.redAccent,
                                                onTap: () async {
                                                  try {
                                                    final treinosRestantes =
                                                        user.treinos
                                                            .where((t) =>
                                                                t.id !=
                                                                treino.id)
                                                            .map((t) =>
                                                                {"id": t.id})
                                                            .toList();

                                                    Map<String, dynamic>
                                                        usuarioRequest = {
                                                      "nome": user.nome,
                                                      "email": user.email,
                                                      "senha": user.senha,
                                                      "dataNascimento":
                                                          user.dataNascimento,
                                                      "perfil": user.perfil,
                                                      "treinos":
                                                          treinosRestantes,
                                                    };

                                                    await AssociarRequests
                                                        .atualizarTreino(
                                                            user.id!,
                                                            usuarioRequest);

                                                    ref
                                                        .read(
                                                            usuariosStateProvider
                                                                .notifier)
                                                        .removerTreinoDoUsuario(
                                                            usuarioId: user.id!,
                                                            treinoId:
                                                                treino.id);
                                                    showTostification(
                                                        context,
                                                        ToastificationType
                                                            .success,
                                                        'Sucesso',
                                                        'Treino removido');
                                                  } catch (e) {
                                                    showTostification(
                                                        context,
                                                        ToastificationType
                                                            .error,
                                                        'Erro',
                                                        'Não foi possível remover o treino do usuario');
                                                  }
                                                },
                                                title: 'Remover treino',
                                              ),
                                            ),
                                          );
                                        }),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                              width: 200,
                                              child: Button(
                                                onTap: () async {
                                                  KModal.show(
                                                    direction:
                                                        ModalDirection.right,
                                                    width: 500,
                                                    body: Scaffold(
                                                      appBar: PreferredSize(
                                                        preferredSize:
                                                            const Size
                                                                .fromHeight(
                                                                110.0),
                                                        child: KModalNavigation(
                                                          icon: FluentIcons
                                                              .arrow_left_24_regular,
                                                          onTap: () =>
                                                              context.pop(),
                                                        ),
                                                      ),
                                                      body:
                                                          SelecionarTreinoView(
                                                        user: user,
                                                      ),
                                                    ),
                                                    context: context,
                                                  );
                                                },
                                                type: ButtonType.elevated,
                                                color: Colors.orangeAccent,
                                                title: 'Adicionar Treino',
                                              )),
                                        ),
                                      ],
                                    );
                                  })
                                ],
                              ),
                            )
                          },
                      error: (error, stacktrace) => {
                            ErrorData(
                              error: Text('$error'),
                            )
                          },
                      loading: () => {const Center(child: LoadingData())})
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
