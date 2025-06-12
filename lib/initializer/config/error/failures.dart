import 'package:equatable/equatable.dart';

class Failure extends Equatable{

  final List properties = const <dynamic>[];

  const Failure([properties]);

  @override
  List<Object?> get props => properties;

}

class ServerFailure extends Failure {
  final String code;
  final String? msg;
  final String? traceId;

  const ServerFailure(this.code, this.msg, this.traceId);

  @override
  String toString() {
    return 'ServerFailure{code: $code, msg: $msg, traceId: $traceId}';
  }
}

class SimpleFailure extends Failure {
  final String msg;

  const SimpleFailure(this.msg);

  @override
  String toString() {
    return 'SimpleFailure{msg: $msg}';
  }
}

class OtherFailure extends Failure {
  final Object obj;

  const OtherFailure(this.obj);

  @override
  String toString() {
    return 'OtherFailure{obj: $obj}';
  }
}