import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/models/community.dart';
import '../../widgets/custom_button.dart';

class CommunityDetailsScreen extends StatefulWidget {
  final Community community;

  const CommunityDetailsScreen({
    super.key,
    required this.community,
  });

  @override
  State<CommunityDetailsScreen> createState() =>
      _CommunityDetailsScreenState();
}

class _CommunityDetailsScreenState
    extends State<CommunityDetailsScreen> {
  bool joined = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.community.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12),
              child: Image.network(
                widget.community.imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (_, __, ___) => Container(
                  height: 220,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(
                      Icons.groups,
                      size: 80,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.community.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.community.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Icon(
                  Icons.people,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  '${widget.community.members} members',
                ),
              ],
            ),

            const SizedBox(height: 30),

            CustomButton(
              text:
                  joined ? 'Joined' : 'Join',
              onPressed: () {
                setState(() {
                  joined = !joined;
                });

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      joined
                          ? 'Successfully joined community'
                          : 'Left community',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}