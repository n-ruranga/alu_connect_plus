import 'package:flutter/material.dart';

import '../../data/mock/mock_communities.dart';
import '../../widgets/community_card.dart';
import 'community_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedFilter = 'Communities';
  String searchQuery = '';

  final List<String> filters = [
    'Events',
    'Opportunities',
    'Clubs',
    'Communities',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCommunities = mockCommunities;

    return Scaffold(
      appBar: AppBar(title: const Text('Explore')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final filter = filters[index];

                  return ChoiceChip(
                    label: Text(filter),
                    selected: selectedFilter == filter,
                    onSelected: (_) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: selectedFilter != 'Communities'
                  ? Center(child: Text('$selectedFilter Coming Soon'))
                  : filteredCommunities.isEmpty
                  ? const Center(child: Text('No communities found'))
                  : ListView.builder(
                      itemCount: filteredCommunities.length,
                      itemBuilder: (context, index) {
                        final community = filteredCommunities[index];

                        return CommunityCard(
                          community: community,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CommunityDetailsScreen(
                                  community: community,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
