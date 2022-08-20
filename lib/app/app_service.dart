import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tedangle/app/modules/chat/models/message.dart';
import 'package:tedangle/app/snackbar_manager.dart';

class AppService extends GetxController {
  final _supabase = Supabase.instance.client;
  final _password = 'Tedangle@supabase';

  RxString appName = RxString('CHAT ROOM');

  Future<void> createUser(String email) async {
    GotrueSessionResponse response =
        await _supabase.auth.signUp(email, _password);
    if (response.statusCode == 400) {
      SnackbarManager().showAlertSnackbar(response.error!.message.toString());
      return;
    }
    await _supabase.from('contact').insert({
      'id': response.user!.id,
      'username': 'User $email',
    }).execute();
  }

  // Future<void> createUsers() async {
  //   await _createUser(1);
  //   await _createUser(2);
  // }

  Future<void> signIn(String email) async {
    GotrueSessionResponse response =
        await _supabase.auth.signIn(email: email, password: _password);
    if (response.statusCode == 400) {
      SnackbarManager().showAlertSnackbar(response.error!.message.toString());
      return;
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  Future<List<String>> _getUserTo() async {
    final response = await _supabase
        .from('contact')
        .select('id')
        .not('id', 'eq', getCurrentUserId())
        .execute();
    if (response.data.isEmpty) {
      SnackbarManager().showAlertSnackbar('No user in room');
      return [];
    }
    List<String> userIds = [];
    for (var user in response.data) {
      userIds.add(user['id']);
    }

    return userIds;
  }

  Future<void> markAsRead(String messageId) async {
    await _supabase
        .from('message')
        .update({'mark_as_read': true})
        .eq('id', messageId)
        .execute();
  }

  Stream<List<Message>> getMessages() {
    Stream<List<Message>> messages = _supabase
        .from('message')
        .stream(['id'])
        .order('created_at')
        .execute()
        .map((maps) => maps
            .map((item) => Message.fromJson(item, getCurrentUserId()))
            .toList());

    return messages;
  }

  Future<void> saveMessage(String content) async {
    List<String> userTo = await _getUserTo();
    if (userTo.isEmpty) return;
    for (var i = 0; i < userTo.length; i++) {
      final message = Message.create(
        content: content,
        userFrom: getCurrentUserId(),
        userTo: userTo[i],
      );
      await _supabase.from('message').insert(message.toMap()).execute();
    }
  }

  bool isAuthenticated() => _supabase.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthenticated() ? _supabase.auth.currentUser!.id : '';

  String getCurrentUserEmail() =>
      isAuthenticated() ? _supabase.auth.currentUser!.email ?? '' : '';
}
