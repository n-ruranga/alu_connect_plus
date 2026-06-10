import '../models/event.dart';

final List<Event> mockEvents = [
  Event(
    id: 'e1',
    title: 'ALU Startup Pitch Night',
    description:
        'Present your startup idea to investors and fellow entrepreneurs. Get feedback and win prizes.',
    date: 'June 20, 2025',
    time: '5:00 PM',
    location: 'Innovation Hub, Kigali',
    imageUrl: 'assets/images/pitch.webp',
    category: 'Entrepreneurship',
  ),
  Event(
    id: 'e2',
    title: 'Tech for Good Hackathon',
    description:
        'A 24-hour hackathon solving real African challenges using technology.',
    date: 'June 28, 2025',
    time: '8:00 AM',
    location: 'ALU Campus, Main Hall',
    imageUrl: 'assets/images/hackathon.webp',
    category: 'Tech',
  ),
  Event(
    id: 'e3',
    title: 'Leadership Summit 2025',
    description:
        'A gathering of student leaders across ALU campuses to share experiences and strategies.',
    date: 'July 5, 2025',
    time: '9:00 AM',
    location: 'ALU Kigali Auditorium',
    imageUrl: 'assets/images/summit.webp',
    category: 'Leadership',
  ),
  Event(
    id: 'e4',
    title: 'Women in Tech Panel',
    description:
        'Inspiring talks from women shaping the African tech ecosystem.',
    date: 'July 12, 2025',
    time: '3:00 PM',
    location: 'Online + ALU Campus',
    imageUrl: 'assets/images/women_tech.webp',
    category: 'Networking',
  ),
];
