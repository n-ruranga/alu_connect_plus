import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/event_card.dart';
import 'event_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'Events',
    'Opportunities',
    'Communities',
    'Internships',
  ];

  final List<EventData> _featuredEvents = const [
    EventData(
      title: 'ALU Innovation Summit 2026',
      description:
          'Join fellow ALU students and alumni for a day of innovation, networking, and inspiring talks from industry leaders across Africa.',
      date: 'Jun 15, 2026',
      time: '9:00 AM - 5:00 PM',
      location: 'ALU Rwanda Campus',
      imageAsset: 'assets/images/students.jpg',
      category: 'Events',
    ),
    EventData(
      title: 'Startup Pitch Night',
      description:
          'Watch student founders pitch their ventures to investors and mentors. Great opportunity to network and get feedback on your ideas.',
      date: 'Jun 22, 2026',
      time: '6:00 PM - 9:00 PM',
      location: 'Innovation Hub',
      imageAsset: 'assets/images/students.jpg',
      category: 'Events',
    ),
    EventData(
      title: 'Career Fair & Networking',
      description:
          'Meet recruiters from top companies across the continent. Bring your resume and connect with potential employers.',
      date: 'Jul 5, 2026',
      time: '10:00 AM - 4:00 PM',
      location: 'Main Auditorium',
      imageAsset: 'assets/images/students.jpg',
      category: 'Events',
    ),
  ];

  final List<EventData> _latestOpportunities = const [
    EventData(
      title: 'Software Engineering Internship',
      description:
          '6-month paid internship at a leading fintech company. Work on real products used by millions across East Africa.',
      date: 'Apply by Jun 30, 2026',
      time: 'Full-time',
      location: 'Remote / Kigali',
      imageAsset: 'assets/images/students.jpg',
      category: 'Internships',
    ),
    EventData(
      title: 'Research Assistant — Climate Tech',
      description:
          'Support ongoing research on sustainable agriculture solutions. Open to students with interest in environmental science.',
      date: 'Apply by Jul 10, 2026',
      time: 'Part-time',
      location: 'ALU Campus',
      imageAsset: 'assets/images/students.jpg',
      category: 'Opportunities',
    ),
    EventData(
      title: 'Entrepreneurship Fellowship',
      description:
          '12-week program with mentorship, funding access, and workshops to help you launch your startup.',
      date: 'Apply by Aug 1, 2026',
      time: 'Flexible',
      location: 'Hybrid',
      imageAsset: 'assets/images/students.jpg',
      category: 'Opportunities',
    ),
  ];

  void _openEventDetails(EventData event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EventDetailsScreen(event: event),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 0, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Student 👋',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Discover events and opportunities',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Search events, opportunities...',
                    hintStyle: const TextStyle(color: AppColors.textSecondary),
                    prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
                    filled: true,
                    fillColor: AppColors.card,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Categories',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : AppColors.card,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: isSelected ? AppColors.primary : AppColors.border,
                          ),
                        ),
                        child: Text(
                          _categories[index],
                          style: TextStyle(
                            color: isSelected ? AppColors.background : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Featured Events',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _featuredEvents.length,
                  itemBuilder: (context, index) {
                    final event = _featuredEvents[index];
                    return EventCard(
                      event: event,
                      onTap: () => _openEventDetails(event),
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),
              const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Text(
                  'Latest Opportunities',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ..._latestOpportunities.map((event) {
                return Padding(
                  padding: const EdgeInsets.only(right: 24, bottom: 16),
                  child: EventCard(
                    event: event,
                    width: double.infinity,
                    onTap: () => _openEventDetails(event),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
