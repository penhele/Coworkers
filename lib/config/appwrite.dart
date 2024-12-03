import 'package:appwrite/appwrite.dart';

class AppWrite {
  static const projectId = '6749fb4a001dae15c721';

  static const databaseId = '674a9bd10036ef507cf4';
  static const collectionUsers = '674a9c620039614ab8b9';
  static const collectionWorkers = '674a9c71000f0d2deccf';
  static const collectionBooking = '674a9c780021abb3f6f8';
  static const bucketWorker = '674aa5b3003b9c6e4f39';

  static const endpoint = 'https://cloud.appwrite.io/v1';

  static Client client = Client();
  static late Account account;
  static late Databases databases;

  static init() {
    client.setProject(projectId);
    account = Account(client);
    databases = Databases(client);
  }

  String imageURL(String fileId) {
    return '$endpoint/storage/buckets/$bucketWorker/files/$fileId/view?project=$projectId&project=$projectId';
  }
}