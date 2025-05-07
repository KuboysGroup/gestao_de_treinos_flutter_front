import 'package:flutter/material.dart';
import 'package:gestao_de_treinos_flutter_front/config/router/states/router_state.dart';
import 'package:gestao_de_treinos_flutter_front/utils/theme/theme_data.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  // await initializeServices();
  appRunner();
}

void appRunner() {
  runApp(ProviderScope(child: const App()));
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerStateProvider);
    return MaterialApp.router(
      title: 'Transfer Capal',
      theme: ARCTheme.lightTheme,
      routerConfig: router,
    );
  }
}
