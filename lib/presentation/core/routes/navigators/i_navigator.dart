abstract class INavigator {
  Future<void> navigateTo(String routeName);

  Future<void> goBack();
}
