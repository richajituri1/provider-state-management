import 'package:providers/index.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserProvider>().getDataFromAPI();

    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return getLoadingUI();
          } else if (userProvider.error.isNotEmpty) {
            return getErrorUI(userProvider.error);
          } else {
            return getBodyUI(userProvider.pets);
          }
        },
      ),
    );
  }
}

Widget getLoadingUI() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.blueAccent,
    ),
  );
}

Widget getErrorUI(String error) {
  return Center(
    child: Text(
      error,
      style: const TextStyle(color: Colors.red),
    ),
  );
}

Widget getBodyUI(Pets pets) {
  return ListView.builder(
    itemCount: pets.data.length,
    itemBuilder: (context, index) => ListTile(
      title: Text(pets.data[index].userName),
      trailing: GestureDetector(
        child: Icon(
          context.watch<UserProvider>().addedPets.contains(index)
              ? Icons.check_circle_outline
              : Icons.add,
          color: context.watch<UserProvider>().addedPets.contains(index)
              ? Colors.green
              : Colors.black,
        ),
        onTap: () {
          final userProvider = context.read<UserProvider>();
          userProvider.addedPets.contains(index)
              ? userProvider.removePets(index)
              : userProvider.addPetsToList(index);
        },
      ),
    ),
  );
}
