// ignore_for_file: use_build_context_synchronously

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/requests/treinos_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/states/treinos_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/views/adicionar_exercicio_view.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/views/criar_treino_view.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class CriarTreinos extends HookConsumerWidget {
  final Usuario usuario;
  const CriarTreinos({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treinos = ref.watch(treinosStateProvider);
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
                    'Treinos',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Crie treinos personalizados para seus alunos',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ...treinos.when(
                      data: (treinos) => {
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 20,
                                children: [
                                  Row(
                                    children: [
                                      Button(
                                        onTap: () {
                                          KModal.show(
                                            direction: ModalDirection.right,
                                            width: 500,
                                            body: Scaffold(
                                              appBar: PreferredSize(
                                                preferredSize:
                                                    const Size.fromHeight(
                                                        110.0),
                                                child: KModalNavigation(
                                                  icon: FluentIcons
                                                      .arrow_left_24_regular,
                                                  onTap: () => context.pop(),
                                                ),
                                              ),
                                              body: CriarTreinoView(
                                                  usuario: usuario),
                                            ),
                                            context: context,
                                          );
                                        },
                                        type: ButtonType.outlined,
                                        color: Colors.orangeAccent,
                                        title: 'Incluir treino',
                                      ),
                                    ],
                                  ),
                                  ...treinos.map((treino) {
                                    return ExpansionTile(
                                      title: Text(treino.nome),
                                      subtitle: Text(
                                        'Exercícios: ${treino.exercicios.length}',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      children: [
                                        ...treino.exercicios.map((exercicio) {
                                          return ListTile(
                                            title:
                                                Text(exercicio.exercicio!.nome),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  spacing: 10,
                                                  children: [
                                                    Text(
                                                      'Séries: ${exercicio.series}',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    Text('-'),
                                                    Text(
                                                        'Repetições: ${exercicio.repeticoes}',
                                                        style: TextStyle(
                                                            fontSize: 12))
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
                                                    final novaLista = treino
                                                        .exercicios
                                                        .where(
                                                            (treinoExercicio) =>
                                                                treinoExercicio
                                                                    .exercicio
                                                                    ?.id !=
                                                                exercicio
                                                                    .exercicio
                                                                    ?.id)
                                                        .toList();
                                                    final treinoAtualizado =
                                                        treino.copyWith(
                                                            exercicios:
                                                                novaLista);

                                                    Map<String, dynamic>
                                                        treinoRequisicao = {
                                                      'nomeTreino': treino.nome,
                                                      'idInstrutor': treino
                                                              .instrutor?.id ??
                                                          null,
                                                      "exercicios":
                                                          treinoAtualizado
                                                              .exercicios
                                                              .where((e) =>
                                                                  e.exercicio !=
                                                                      null &&
                                                                  e.exercicio!
                                                                          .id !=
                                                                      null)
                                                              .map((e) => {
                                                                    "idExercicio":
                                                                        e.exercicio!
                                                                            .id,
                                                                    "series": e
                                                                        .series,
                                                                    "repeticoes":
                                                                        e.repeticoes,
                                                                  })
                                                              .toList(),
                                                    };
                                                    await TreinosRequests
                                                        .atualizarTreino(
                                                            treino.id,
                                                            treinoRequisicao);
                                                    ref
                                                        .read(
                                                            treinosStateProvider
                                                                .notifier)
                                                        .removerExercicio(
                                                            exercicio.exercicio!
                                                                .id!);
                                                    showTostification(
                                                      context,
                                                      ToastificationType
                                                          .success,
                                                      'Sucessp',
                                                      'Exercício excluído com sucesso',
                                                    );
                                                  } catch (e) {
                                                    print(e);
                                                    // Mostra erro apenas se falhar
                                                    showTostification(
                                                      context,
                                                      ToastificationType.error,
                                                      'Erro',
                                                      'Não foi possível excluir o exercício',
                                                    );
                                                  }
                                                },
                                                title: 'Remover exercício',
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
                                                          AdicionarExercicioView(
                                                              usuario: usuario,
                                                              treino: treino),
                                                    ),
                                                    context: context,
                                                  );
                                                },
                                                type: ButtonType.elevated,
                                                color: Colors.orangeAccent,
                                                title: 'Adicionar exercício',
                                              )),
                                        ),
                                      ],
                                    );
                                  })
                                  // Theme(
                                  //   data: Theme.of(context).copyWith(
                                  //     cardTheme: const CardTheme(
                                  //       elevation: 0,
                                  //       color: Colors.white,
                                  //     ),
                                  //   ),
                                  //   child: ScrollConfiguration(
                                  //     behavior: ScrollConfiguration.of(context)
                                  //         .copyWith(
                                  //       dragDevices: {
                                  //         PointerDeviceKind.touch,
                                  //         PointerDeviceKind.mouse,
                                  //       },
                                  //     ),
                                  //     child: SingleChildScrollView(
                                  //       child: Scrollbar(
                                  //         controller: scrollController,
                                  //         interactive: true,
                                  //         thumbVisibility: true,
                                  //         child: PaginatedDataTable(
                                  //           showCheckboxColumn: false,
                                  //           headingRowColor:
                                  //               WidgetStateProperty.all<Color>(
                                  //                   Colors.grey.withValues(
                                  //                       alpha: 0.15)),
                                  //           horizontalMargin: 32.0,
                                  //           rowsPerPage: exercicios.length >= 10
                                  //               ? 10
                                  //               : exercicios.length,
                                  //           columns: pedidosColumns(),
                                  //           source: PedidosRows(
                                  //               exercicios, context, ref),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
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
