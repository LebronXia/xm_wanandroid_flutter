import 'package:get_it/get_it.dart';
import 'injectable.config.dart';
import 'injectable.dart';
export 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',  // 初始化方法名
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => init(getIt);