import 'package:flutter/material.dart';
import '../data/models/user.dart';
import '../data/mock/mock_users.dart';

class ProfileProvider extends ChangeNotifier {
  UserModel _user = mockUser;
  final Set<String> _joinedCommunities = {};

  UserModel get user => _user;
  Set<String> get joinedCommunities => _joinedCommunities;

  bool isJoined(String communityName) =>
      _joinedCommunities.contains(communityName);

  void joinCommunity(String communityName) {
    _joinedCommunities.add(communityName);
    _user = UserModel(
      id: _user.id,
      name: _user.name,
      campus: _user.campus,
      avatarUrl: _user.avatarUrl,
      eventsJoined: _user.eventsJoined,
      communities: _joinedCommunities.length,
      connections: _user.connections,
    );
    notifyListeners();
  }

  void leaveCommunity(String communityName) {
    _joinedCommunities.remove(communityName);
    _user = UserModel(
      id: _user.id,
      name: _user.name,
      campus: _user.campus,
      avatarUrl: _user.avatarUrl,
      eventsJoined: _user.eventsJoined,
      communities: _joinedCommunities.length,
      connections: _user.connections,
    );
    notifyListeners();
  }
}
