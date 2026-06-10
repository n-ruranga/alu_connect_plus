import 'package:flutter/material.dart';

import '../../data/mock/mock_communities.dart';
import '../../widgets/community_card.dart';
import 'community_details_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mockCommunities.length,
      itemBuilder: (context, index) {
        final community = mockCommunities[index];

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
    );
  }
}