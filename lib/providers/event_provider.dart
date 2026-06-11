import 'package:flutter/material.dart';
import '../data/models/event.dart';
import '../data/mock/mock_events.dart';

class EventProvider extends ChangeNotifier {
  final List<Event> _allEvents = mockEvents;
  final Set<String> _rsvpedEventIds = {};
  final Set<String> _savedEventIds = {};

  List<Event> get allEvents => _allEvents;

  List<Event> get rsvpedEvents =>
      _allEvents.where((e) => _rsvpedEventIds.contains(e.id)).toList();

  List<Event> get savedEvents =>
      _allEvents.where((e) => _savedEventIds.contains(e.id)).toList();

  bool isRsvped(String eventId) => _rsvpedEventIds.contains(eventId);
  bool isSaved(String eventId) => _savedEventIds.contains(eventId);

  void toggleRsvp(String eventId) {
    if (_rsvpedEventIds.contains(eventId)) {
      _rsvpedEventIds.remove(eventId);
    } else {
      _rsvpedEventIds.add(eventId);
    }
    notifyListeners();
  }

  void toggleSave(String eventId) {
    if (_savedEventIds.contains(eventId)) {
      _savedEventIds.remove(eventId);
    } else {
      _savedEventIds.add(eventId);
    }
    notifyListeners();
  }
}
