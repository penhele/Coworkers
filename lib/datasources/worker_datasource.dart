import 'package:appwrite/appwrite.dart';
import 'package:coworkers/config/app_log.dart';
import 'package:coworkers/config/appwrite.dart';
import 'package:coworkers/models/worker_model.dart';
import 'package:dartz/dartz.dart';

class WorkerDatasource {
  static Future<Either<String, List<WorkerModel>>> fetchAvailable(
    String category,
  ) async {
    try {
      final response = await AppWrite.databases.listDocuments(
        databaseId: AppWrite.databaseId,
        collectionId: AppWrite.collectionWorkers,
        queries: [
          Query.equal('category', category),
          Query.equal('status', 'Available'),
        ]
      );

      if (response.total < 1) {
        AppLog.error(body: 'Not Found', title: 'Worker - fetchAvailable');

        return left('Tidak ditemukan');
      }

      AppLog.success(body: response.toMap().toString(), title: 'Worker - fetchAvailable');

      List<WorkerModel> workers = response.documents.map((e) {
        return WorkerModel.fromJson(e.data);
      }).toList();

      return right(workers);
  } catch (e) {
      AppLog.error(body: e.toString(), title: 'Worker - fetchAvailable');

      String defaultMessage = 'Terjadi suatu masalah';
      String message = defaultMessage;

      if (e is AppwriteException) {
        if (e.code == 401) {
          message = e.message ?? defaultMessage;
        }
      }

      return left(message);
    }
  }
}