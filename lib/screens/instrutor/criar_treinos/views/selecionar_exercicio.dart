import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/states/exercicios_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/states/grupo_muscular_selecionado_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/states/exercicio_selecionado_state.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelecionarExercicio extends HookConsumerWidget {
  const SelecionarExercicio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercicios = ref.watch(exerciciosStateProvider);
    ref.watch(grupoMuscularSelecionadoStateProvider);
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
                    ...exercicios.when(
                        data: (exercicios) => {
                              ...exercicios.map((exercicio) {
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
                                  title: Text(exercicio.nome),
                                  onTap: () {
                                    ref
                                        .read(exercicioSelecionadoStateProvider
                                            .notifier)
                                        .selecionarGrupo(exercicio);
                                    context.pop();
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
