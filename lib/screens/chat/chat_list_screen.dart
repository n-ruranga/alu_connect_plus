import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'chat_screen.dart';  

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          // Club Chats Section
          _buildSectionHeader('Club Chats'),
          _buildChatTile(
            context,
            name: 'Entrepreneurship Club',
            lastMessage: 'Meeting tomorrow at 3 PM',
            avatarIcon: Icons.business,
            isGroup: true,
          ),
          _buildChatTile(
            context,
            name: 'Debate Society',
            lastMessage: 'Great discussion today!',
            avatarIcon: Icons.record_voice_over,
            isGroup: true,
          ),
          _buildChatTile(
            context,
            name: 'Women in Leadership',
            lastMessage: 'Workshop on Friday',
            avatarIcon: Icons.people,
            isGroup: true,
          ),

          const Divider(),

         
          _buildSectionHeader('Event Chats'),
          _buildChatTile(
            context,
            name: 'Hackathon 2026',
            lastMessage: 'Register before June 15th',
            avatarIcon: Icons.computer,
            isGroup: true,
          ),
          _buildChatTile(
            context,
            name: 'Leadership Summit',
            lastMessage: 'Keynote speaker announced!',
            avatarIcon: Icons.mic,
            isGroup: true,
          ),

          const Divider(),

          
          _buildSectionHeader('Direct Messages'),
          _buildChatTile(
            context,
            name: 'Jean Mugabo',
            lastMessage: 'See you at the event!',
            avatarIcon: Icons.person,
            isGroup: false,
          ),
          _buildChatTile(
            context,
            name: 'Marie Uwase',
            lastMessage: 'Can you send me the notes?',
            avatarIcon: Icons.person,
            isGroup: false,
          ),
          _buildChatTile(
            context,
            name: 'Paul Ndayisaba',
            lastMessage: 'Thanks for your help!',
            avatarIcon: Icons.person,
            isGroup: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildChatTile(
    BuildContext context, {
    required String name,
    required String lastMessage,
    required IconData avatarIcon,
    required bool isGroup,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primary.withOpacity(0.2),
        child: Icon(
          avatarIcon,
          color: AppColors.primary,
        ),
      ),
      title: Text(name),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: isGroup ? const Icon(Icons.group) : null,
      onTap: () {
        
        try {
          Navigator.pushNamed(
            context,
            '/chat',
            arguments: {
              'chatName': name,
              'isGroup': isGroup,
            },
          );
        } catch (e) {
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                chatName: name,
                isGroup: isGroup,
              ),
            ),
          );
        }
      },
    );
  }
}