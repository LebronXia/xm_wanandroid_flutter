extension StringExtension on String? {
  bool get isNullOrEmpty {
    if (this == null || this?.isEmpty == true) {
      return true;
    }
    return false;
  }
  // void showToast() {
  //   if (this != null) {
  //     eventBus.fire(ToastEventBus(this ?? ""));
  //   }
  // }
  // void launchUrl() async {
  //   if (isNullOrEmpty) {
  //     return;
  //   }
  //   final result = await launchUrlString(this ?? "");
  //   if (!result) {
  //     throw Exception('Could not launch $this');
  //   }
  // }
  }