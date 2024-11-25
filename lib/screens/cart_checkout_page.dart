import 'package:providers/index.dart';

class CartCheckoutPage extends StatelessWidget {
  static const String tag = "/cart-checkout-screen";
  const CartCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Your Cart',
        ),
      ),
      body: const CartCheckoutScreen(),
    );
  }
}
