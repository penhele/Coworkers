import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:coworkers/config/app_log.dart';
import 'package:coworkers/config/appwrite.dart';
import 'package:coworkers/models/booking_model.dart';
import 'package:coworkers/models/worker_model.dart';
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

  static Future<Either<String, BookingModel>> checkout(BookingModel bookingDetail,) async {
    try {
      final response = await AppWrite.databases.createDocument(
        databaseId: AppWrite.databaseId, 
        collectionId: AppWrite.collectionBooking,
        documentId: ID.unique(),
        data: bookingDetail.toJsonRequest(),
      );

      await AppWrite.databases.updateDocument(
        databaseId: AppWrite.databaseId, 
        collectionId: AppWrite.collectionWorkers,
        documentId: bookingDetail.workerId,
        data: {'status':'Booked'},
      ); 

      AppLog.success(
        body: response.toMap().toString(),
        title: 'Booking - checkout',
      );

      return right(BookingModel.fromJson(response.data));
    } catch (e) {
      AppLog.error(body: e.toString(), title: 'Booking - checkout');

      String defaultMessage = 'Terjadi suatu masalah';
      String message = defaultMessage;

      if (e is AppwriteException) {
        message = e.message ?? defaultMessage;
      }

      return left(message);
    }
  }

  static Future<Either<String, List<BookingModel>>> fetchOrder(String userId, String status) async {
    try {
      final response = await AppWrite.databases.listDocuments(
        databaseId: AppWrite.databaseId, 
        collectionId: AppWrite.collectionBooking,
        queries: [
          Query.equal('user_id', userId),
          Query.equal('status', status),
          Query.orderDesc('\$updatedAt'),
        ],
      );

      if (response.total < 1) {
        // available
        AppLog.error(
          body: "Not found",
          title: 'Booking - fetchOrder - $status',
        );
        return left('tidak ditemukan');
      }

      AppLog.success(
        body: response.toMap().toString(),
        title: 'Booking - fetchOrder - $status',
      );

      List<BookingModel> orders = [];
      for (Document doc in response.documents) {
        final responseWorker = await AppWrite.databases.getDocument(
          databaseId: AppWrite.databaseId, 
          collectionId: AppWrite.collectionWorkers,
          documentId: doc.data['worker_id'],
        );

        WorkerModel worker = WorkerModel.fromJson(responseWorker.data);
        BookingModel booking = BookingModel.fromJson(doc.data, worker: worker);
        orders.add(booking);
      }

      return right(orders);
    } catch (e) {
      AppLog.error(body: e.toString(), title: 'Booking - fetchOrder - $status');

      String defaultMessage = 'Terjadi suatu masalah';
      String message = defaultMessage;

      if (e is AppwriteException) {
        message = e.message ?? defaultMessage;
      }

      return left(message);
    }
  }
}