import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/authentication/login_screen.dart';
import 'package:gestao_de_treinos_flutter_front/screens/aluno/avaliacoes_fisicas/avaliacoes_screen.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/criar_avaliacoes.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/criar_exercicios.dart';
import 'package:gestao_de_treinos_flutter_front/screens/home/home.dart';
import 'package:gestao_de_treinos_flutter_front/screens/aluno/treinos/treinos_screen.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/criar_treinos.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> router = [
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
    GoRoute(
      path: 'treinos',
      builder: (context, state) => const TreinosScreen(), //Trocar
    ),
    GoRoute(
      path: 'avaliacoes_fisicas',
      builder: (context, state) => AvaliacoesScreen(
        usuario: state.extra as Usuario,
      ), //Trocar
    ),
    GoRoute(
      path: 'criar_exercicios',
      builder: (context, state) => const CriarExercicios(), //Trocar
    ),
    GoRoute(
      path: 'criar_avaliacoes',
      builder: (context, state) => CriarAvaliacoes(
        usuario: state.extra as Usuario,
      ), //Trocar
    ),
    GoRoute(
      path: 'criar_treinos',
      builder: (context, state) => CriarTreinos(
        usuario: state.extra as Usuario,
      ), //Trocar
    ),
  ]),
];
