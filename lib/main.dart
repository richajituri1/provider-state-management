import 'package:providers/index.dart';
import 'package:providers/providers/user_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routes: routes,
      home: const DashboardPage(),
    );
  }
}
