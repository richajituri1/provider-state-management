import 'package:providers/index.dart';

class DashboardPage extends StatelessWidget {
  static const String tag = "/dashboard-screen";
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Your Online Shop'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FloatingActionButton(
              mini: true,
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartCheckoutPage.tag),
              child: const Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ),
        ],
      ),
      body: const DashboardScreen(),
    );
  }
}
