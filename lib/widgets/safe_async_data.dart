import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SafeAsyncData<T> extends StatelessWidget {
  final ProviderBase<AsyncValue<T>> provider;
  final Widget Function(T data) builder;

  const SafeAsyncData({required this.provider, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      return ref.watch(provider).when(
        data: builder,
        loading: () => CircularProgressIndicator(),
        error: (e, _) => ErrorWidget(e),
      );
    });
  }
}

// void onButtonPressed() async {
//   try {
//     final banners = await ref.read(bannerServiceProvider.future);
//     processBanners(banners);
//   } catch (e) {
//     handleError(e);
//   }
// }