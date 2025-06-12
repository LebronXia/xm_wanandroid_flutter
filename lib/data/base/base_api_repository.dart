import 'package:fpdart/fpdart.dart';
import 'package:xm_wanandroid_flutter/initializer/config/error/failures.dart';

import '../../domin/base_model.dart';

abstract class BaseApiRepository{

  Future<Either<T, Failure>> eitherof<T>({
    required Future<T> Function() request
}) async{
    try{
      final response = await request();
      return Left(response);
      //int code = response.errorCode ?? -1;
      // if (code == "000000") {
      //   return Left(response.data);
      // } else {
      //   throw ServerFailure(code, response.message, response.traceId);
      // }


    } on ServerFailure catch (error){
      return Right(error);
    } catch(error){
      return Right(OtherFailure(error));
  }

  }
}

// Future<T> getOrThrow<T>({
//   required Future<ApiResponse<T>> Function() request,
// }) async {
//   // todo: 此处还需要上层实现完 Eitlher 的 tryCatch 封装后才可上线使用
//   final result = await eitherOf(request: request);
//   if (result.isLeft()) {
//     final leftResult = result.getLeft().toNullable();
//     if (leftResult != null) {
//       return leftResult;
//     } else {
//       throw const SimpleFailure("(1)Failed to retrieve data.");
//     }
//   }
//   final rightResult = result.getRight().toNullable();
//   if (rightResult != null) {
//     throw rightResult;
//   }
//   throw const SimpleFailure("(2)Failed to retrieve data.");
// }
// }
