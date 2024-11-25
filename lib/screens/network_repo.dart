import 'package:providers/index.dart';
import 'package:http/http.dart' as http;

class PetsRepository {
  static const String apiEndpoint =
      'https://jatinderji.github.io/users_pets_api/users_pets.json';

  /// Fetches pets data from the API
  /// Returns [Pets] if successful, otherwise returns [Failure]
  static Future<Either<Failure, Pets>> getPetsData() async {
    final Completer<Either<Failure, Pets>> completer =
        Completer<Either<Failure, Pets>>();

    try {
      final response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        final Pets petsData = petsFromJson(response.body);
        completer.complete(Right(petsData));
      } else {
        completer.complete(
          Left(
            Failure(
              errorCode: response.statusCode,
              message: response.body.isEmpty
                  ? 'Something went wrong'
                  : response.body,
            ),
          ),
        );
      }
    } catch (e) {
      completer.complete(
        Left(
          Failure(
            errorCode: 500,
            message: e.toString(),
          ),
        ),
      );
    }

    return completer.future;
  }
}
