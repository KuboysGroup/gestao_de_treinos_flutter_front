import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/models/avaliacao_fisica.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/aluno/avaliacoes_fisicas/states/avaliacao_state.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data.dart';
import 'package:gestao_de_treinos_flutter_front/utils/loading_data_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AvaliacoesScreen extends HookConsumerWidget {
  final Usuario usuario;
  const AvaliacoesScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avaliacoes = ref.watch(avaliacaoStateProvider(usuario.id!));
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
                    'Avaliações físicas',
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
                  ...avaliacoes.when(
                      data: (avaliacoes) => {
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 20,
                                children: [
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                      cardTheme: const CardThemeData(
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
                                            rowsPerPage: avaliacoes.length >= 10
                                                ? 10
                                                : avaliacoes.length,
                                            columns: pedidosColumns(),
                                            source: PedidosRows(
                                                avaliacoes, context, ref),
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
      'Data',
    )),
    const DataColumn(
        label: Text(
      'Peso',
    )),
    const DataColumn(
        label: Text(
      'Altura',
    )),
    const DataColumn(
        numeric: true,
        label: Text(
          'IMC',
        )),
    const DataColumn(
        numeric: true,
        label: Text(
          'Percentual gordura',
        )),
    const DataColumn(
        numeric: true,
        label: Text(
          'Massa muscular',
        )),
  ];
}

class PedidosRows extends DataTableSource {
  final List<AvaliacaoFisica> avaliacaoData;
  final BuildContext context;
  final WidgetRef ref;

  PedidosRows(this.avaliacaoData, this.context, this.ref);

  @override
  int get rowCount => avaliacaoData.length;

  @override
  DataRow? getRow(int index) {
    if (index >= avaliacaoData.length) {
      return null;
    }

    final AvaliacaoFisica avaliacao = avaliacaoData[index];
    final output = DateFormat('dd/MM/yyyy');
    final input = DateFormat('yyyy-MM-dd');
    DateTime parsedDate = input.parse(avaliacao.data);
    return DataRow(
      selected: false,
      cells: [
        DataCell(Text(output.format(parsedDate))),
        DataCell(Text(avaliacao.peso.toString())),
        DataCell(Text(avaliacao.altura.toString())),
        DataCell(Text(avaliacao.imc.toString())),
        DataCell(Text(avaliacao.percentualGordura.toString())),
        DataCell(Text(avaliacao.massaMuscularKg.toString())),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
