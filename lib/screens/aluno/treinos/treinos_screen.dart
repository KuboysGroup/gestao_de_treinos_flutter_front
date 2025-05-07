import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/states/usuario_state.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/screens/aluno/treinos/executar_treino.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TreinosScreen extends HookConsumerWidget {
  const TreinosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuario = ref.watch(usuarioStateProvider);

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
                      'Execute seus treinos e veja seu progresso',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ...usuario.when(
                        data: (user) => {
                              ...user!.treinos.map((treino) {
                                return ExpansionTile(
                                  visualDensity:
                                      const VisualDensity(vertical: 4),
                                  tilePadding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  leading: CircularStepProgressIndicator(
                                    totalSteps: treino.exercicios.length,
                                    currentStep: treino.exercicios
                                        .where((ex) => ex.concluido)
                                        .length,
                                    stepSize: 10,
                                    selectedColor: Colors.orangeAccent,
                                    unselectedColor: Colors.grey[200],
                                    padding: 0,
                                    width: 70,
                                    height: 70,
                                    unselectedStepSize: 3,
                                    selectedStepSize: 3,
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.grey.withValues(alpha: .15),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Center(
                                          child: !treino.concluido
                                              ? Icon(Icons
                                                  .sports_gymnastics_outlined)
                                              : Icon(Icons.check)),
                                    ),
                                  ),
                                  title: Text(treino.nome),
                                  subtitle: Text(
                                      'Exercícios: ${treino.exercicios.length}'),
                                  trailing: SizedBox(
                                    width: 200,
                                    child: Button(
                                      type: ButtonType.filled,
                                      color: treino.concluido
                                          ? Colors.grey
                                          : Colors.orangeAccent,
                                      onTap: !treino.concluido
                                          ? () {
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
                                                      onTap: () =>
                                                          context.pop(),
                                                    ),
                                                  ),
                                                  body: ExecutarTreino(
                                                      treino: treino),
                                                ),
                                                context: context,
                                              );
                                            }
                                          : () {},
                                      title: 'Executar treino',
                                    ),
                                  ),
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                              width: 200,
                                              child: Button(
                                                onTap: () async {
                                                  final exTotais =
                                                      treino.exercicios.length;
                                                  final exConcluidos = treino
                                                      .exercicios
                                                      .where(
                                                          (treinoExercicio) =>
                                                              treinoExercicio
                                                                  .concluido)
                                                      .length;
                                                  if (exConcluidos ==
                                                      exTotais) {
                                                    await ref
                                                        .read(
                                                            usuarioStateProvider
                                                                .notifier)
                                                        .marcarTreinoComoConcluido(
                                                            treino.id);
                                                  }
                                                },
                                                type: ButtonType.elevated,
                                                color: Colors.orangeAccent,
                                                title: treino.concluido
                                                    ? 'Refazer treino'
                                                    : 'Concluir treino',
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
