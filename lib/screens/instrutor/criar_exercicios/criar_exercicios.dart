import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/buttons.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/date_picker.dart';
import 'package:gestao_de_treinos_flutter_front/helpers/modals.dart';
import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/states/exercicios_state.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/views/criar_exercicio_view.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/views/editar_exercicio_view.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CriarExercicios extends HookConsumerWidget {
  const CriarExercicios({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercicios = ref.watch(exerciciosStateProvider);
    final ScrollController scrollController = ScrollController();
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
                    'Exercícios',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Gerencie os exercícios existentes ou crie novos',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ...exercicios.when(
                      data: (exercicios) => {
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
                                              body: const CriarExercicioView(),
                                            ),
                                            context: context,
                                          );
                                        },
                                        type: ButtonType.outlined,
                                        color: Colors.orangeAccent,
                                        title: 'Incluir exercício',
                                      ),
                                    ],
                                  ),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                      cardTheme: const CardTheme(
                                        elevation: 0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: ScrollConfiguration(
                                      behavior: ScrollConfiguration.of(context)
                                          .copyWith(
                                        dragDevices: {
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.mouse,
                                        },
                                      ),
                                      child: SingleChildScrollView(
                                        child: Scrollbar(
                                          controller: scrollController,
                                          interactive: true,
                                          thumbVisibility: true,
                                          child: PaginatedDataTable(
                                            showCheckboxColumn: false,
                                            headingRowColor:
                                                WidgetStateProperty.all<Color>(
                                                    Colors.grey.withValues(
                                                        alpha: 0.15)),
                                            horizontalMargin: 32.0,
                                            rowsPerPage: exercicios.length >= 10
                                                ? 10
                                                : exercicios.length,
                                            columns: pedidosColumns(),
                                            source: PedidosRows(
                                                exercicios, context, ref),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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

List<DataColumn> pedidosColumns() {
  return [
    const DataColumn(
        label: Text(
      'Nome',
    )),
    const DataColumn(
        label: Text(
      'Descr.',
    )),
    const DataColumn(
        label: Text(
      'Grupo muscular',
    )),
    const DataColumn(
        label: Text(
      'Ações',
    )),
  ];
}

class PedidosRows extends DataTableSource {
  final List<Exercicio> exercicioData;
  final BuildContext context;
  final WidgetRef ref;

  PedidosRows(this.exercicioData, this.context, this.ref);

  @override
  int get rowCount => exercicioData.length;

  @override
  DataRow? getRow(int index) {
    if (index >= exercicioData.length) {
      return null;
    }

    final Exercicio exercicio = exercicioData[index];

    return DataRow(
      selected: false,
      cells: [
        DataCell(Text(exercicio.nome)),
        DataCell(Text(exercicio.descricao)),
        DataCell(Text(exercicio.grupoMuscular!.nome)),
        DataCell(Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 12),
          child: Button(
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
                  body: EditarExercicioView(exercicio: exercicio),
                ),
                context: context,
              );
            },
            type: ButtonType.filled,
            color: Colors.orangeAccent,
            title: 'Editar',
          ),
        ))
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
