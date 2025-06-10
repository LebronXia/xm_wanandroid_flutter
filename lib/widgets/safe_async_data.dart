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

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
  }) : super(key: key);
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => const Center(child: Text('加载失败')),
      data: (data) => this.data(data),
    );
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