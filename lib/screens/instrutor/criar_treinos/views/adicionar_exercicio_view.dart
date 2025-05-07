import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/toast.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino_exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/requests/treinos_requests.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/states/exercicio_selecionado_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/states/treinos_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/views/selecionar_exercicio.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class AdicionarExercicioView extends HookConsumerWidget {
  final Usuario usuario;
  final Treino treino;
  const AdicionarExercicioView(
      {super.key, required this.usuario, required this.treino});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seriesController = useTextEditingController();
    final exercicioSelecionado = ref.watch(exercicioSelecionadoStateProvider);
    final repetController = useTextEditingController();
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
                Text(treino.nome, style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 6.0),
                const Text(
                  'Edição da avaliação',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 36.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
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
                            child: Text(exercicioSelecionado == null
                                ? 'Selecione o exercício'
                                : exercicioSelecionado.nome),
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
                                body: const SelecionarExercicio(),
                              ),
                              context: context,
                            );
                          },
                        ),
                      ],
                    ),
                    TextFormField(
                      enabled: true,
                      controller: seriesController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Quantidade de séries',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    TextFormField(
                      enabled: true,
                      controller: repetController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withValues(alpha: 0.15),
                        hintText: 'Quantidade de repetições',
                        hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(),
                    Button(
                      onTap: () async {
                        try {
                          final TreinoExercicio exercicioTreino =
                              TreinoExercicio(
                                  treino: treino,
                                  series: int.parse(seriesController.text),
                                  repeticoes: int.parse(repetController.text),
                                  exercicio: exercicioSelecionado);

                          final treinoAtualizado = treino.copyWith(
                            exercicios: [...treino.exercicios, exercicioTreino],
                          );

                          Map<String, dynamic> treinoRequisicao = {
                            'nomeTreino': treinoAtualizado.nome,
                            'idInstrutor': usuario.id ?? null,
                            "exercicios": treinoAtualizado.exercicios
                                .where((e) => e.exercicio?.id != null)
                                .map((e) => {
                                      "idExercicio": e.exercicio!.id!,
                                      "series": e.series,
                                      "repeticoes": e.repeticoes,
                                    })
                                .toList(),
                          };

                          await TreinosRequests.atualizarTreino(
                              treino.id, treinoRequisicao);
                          ref
                              .read(treinosStateProvider.notifier)
                              .adicionarExercicio(exercicioTreino);
                          context.pop();
                          showTostification(context, ToastificationType.success,
                              'Sucesso', 'Exercício adicionado ao treino');
                        } catch (e) {
                          print(e);
                        }
                      },
                      type: ButtonType.filled,
                      color: Colors.orangeAccent,
                      title: 'Concluir',
                    )
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
