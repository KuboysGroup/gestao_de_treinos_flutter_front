import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/states/usuario_state.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExecutarTreino extends HookConsumerWidget {
  final Treino treino;
  const ExecutarTreino({super.key, required this.treino});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(usuarioStateProvider);
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
                  'Está na hora de fazer seus exercícios',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const SizedBox(height: 6.0),
                ...treino.exercicios.map((exercicio) {
                  return CheckboxListTile(
                      title: Text(exercicio.nomeExercicio),
                      subtitle: Row(
                        spacing: 10,
                        children: [
                          Text('Séries: ${exercicio.series}'),
                          Text('Repetições: ${exercicio.repeticoes}'),
                        ],
                      ),
                      value: exercicio.concluido,
                      activeColor: Colors.orangeAccent,
                      onChanged: (value) async {
                        await ref
                            .read(usuarioStateProvider.notifier)
                            .marcarTreinoExercicioComoConcluido(
                                treino.id, exercicio.idExercicio!, value!);
                      });
                })
              ],
            ),
          ),
        ))
      ],
    );
  }
}
