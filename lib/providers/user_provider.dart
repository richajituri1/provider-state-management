import 'package:providers/index.dart';

class UserProvider extends ChangeNotifier {
  static const apiEndpoint =
      'https://jatinderji.github.io/users_pets_api/users_pets.json';

  Pets pets = Pets(data: []);
  String error = '';
  bool isLoading = true;
  List addedPets = [];
  List names = [];

  getDataFromAPI() async {
    isLoading = true;
    notifyListeners();

    final result = await PetsRepository.getPetsData();

    result.fold(
      (failure) {
        error = failure.message;
        isLoading = false;
      },
      (petsData) {
        pets = petsData;
        error = '';
        isLoading = false;
      },
    );

    notifyListeners();
  }

  addPetsToList(index) {
    addedPets.add(index);
    names.add(pets.data[index].userName);
    notifyListeners();
  }

  removePets(int index) {
    int position = addedPets.indexOf(index);
    if (position != -1) {
      addedPets.removeAt(position);
      names.removeAt(position);
      notifyListeners();
    }
  }
}
