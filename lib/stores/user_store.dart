
import '../repositories/query_repo.dart';
import 'state_keeper.dart';

class UserStore extends StateKeeper {
  UserStore._();

  static final UserStore _instance = UserStore._();

  factory UserStore() => _instance;

  List allProviders = [];
  List pendingProviders = [];
  List completedProviders = [];
  List orders = [];
  List restros = [];

  var currUser;

  late double lat;
  late double lang;
  late String address;

  // Future fetchPendingProviders() async {
  //   pendingProviders = await QueryRepo().fetchPendingApprovals();
  //   print(pendingProviders);
  //   notifyListeners();
  // }
  //
  // Future fetchPendingOrders(String? query) async {
  //   orders = await QueryRepo().fetchOrders(query);
  //   notifyListeners();
  // }
  //
  // Future fetchNearestRestros(String? query) async {
  //   restros = await QueryRepo().fetchRestros(query);
  //   print(restros);
  //   notifyListeners();
  // }
  //
  // Future fetchCompletedProviders() async {
  //   completedProviders = await QueryRepo().fetchCompletedApprovals();
  //   print(completedProviders);
  //   notifyListeners();
  // }


}
