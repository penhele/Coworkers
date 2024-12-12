import 'package:appwrite/appwrite.dart';
import 'package:coworkers/config/app_log.dart';
import 'package:coworkers/config/appwrite.dart';
import 'package:coworkers/models/booking_model.dart';
import 'package:dartz/dartz.dart';

class BookingDatasource {
  static Future<Either<String, BookingModel>> checkHiredBy(String workerId) async {
    try {
      final response = await AppWrite.databases.listDocuments(
        databaseId: AppWrite.databaseId, 
        collectionId: AppWrite.collectionBooking,
        queries: [
          Query.equal('worker_id', workerId),
          Query.equal('status', "In Progress"),
          Query.orderDesc('\$updatedAt'),
        ]
      );

      if (response.total < 1) {
        // available
        AppLog.error(
          body: "Not found",
          title: 'Booking - checkHiredBy',
        );
        return left('tidak ditemukan');
      }

      AppLog.success(
        body: response.toMap().toString(),
        title: 'Booking - checkHiredBy',
      );

      BookingModel booking = BookingModel.fromJson(response.documents.first.data);
      return right(booking);
    } catch (e) {
      AppLog.error(body: e.toString(), title: 'Booking - checkHiredBy');

      String defaultMessage = 'Terjadi suatu masalah';
      String message = defaultMessage;

      if (e is AppwriteException) {
        message = e.message ?? defaultMessage;
      }

      return left(message);
    }
  }
}