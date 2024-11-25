import 'package:providers/index.dart';

class CartCheckoutScreen extends StatefulWidget {
  const CartCheckoutScreen({super.key});

  @override
  State<CartCheckoutScreen> createState() => _CartCheckoutScreenState();
}

class _CartCheckoutScreenState extends State<CartCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    var names = context.watch<UserProvider>().names;
    var added = context.watch<UserProvider>().addedPets;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text('${names[index]}'),
                    trailing: GestureDetector(
                      onTap: () =>
                          context.read<UserProvider>().removePets(added[index]),
                      child: const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                      ),
                    ));
              },
              separatorBuilder: _separatedSizedBox,
              itemCount: names.length),
        )
      ],
    );
  }

  SizedBox _separatedSizedBox(BuildContext context, int index) {
    return const SizedBox(
      height: 10,
    );
  }
}
