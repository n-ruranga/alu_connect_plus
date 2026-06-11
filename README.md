# alu_connect

##  What is this project about?

**ALU Connect+** is a mobile-first social engagement platform - this connects students at the African Leadership University. The app lets students find campus events, join campus communities, post, chat, and manage their RSVP's, all in one location.

**ALU Connect+** addresses this by consolidating all the assets into one place:
-Educational events and opportunities are discovered and accessed from a single feed.
-Become members of and be involved with communities
-Plan and organize own events & activities
-Talk to other club members and attendees of events.
-Keep an eye out for RSVPs and saved opportunities.

# Project structure

alu_connect_plus/
│
├── lib/
│   │
│   ├── main.dart
│   │
│   ├── core/
│   │   └── constants/
│   │       └── app_theme.dart
│   │
│   ├── data/
│   │
│   ├── providers/
│   │
│   ├── widgets/
│   │   ├── bottom_nav.dart
│   │   ├── community_card.dart
│   │   ├── custom_button.dart
│   │   ├── custom_textfield.dart
│   │   └── event_card.dart
│   │
│   ├── screens/
│   │   │
│   │   ├── onboarding/
│   │   │   └── landing_screen.dart
│   │   │
│   │   ├── home/
│   │   │   └── home_screen.dart
│   │   │
│   │   ├── explore/
│   │   │   ├── explore_screen.dart
│   │   │   ├── community_screen.dart
│   │   │   └── community_details_screen.dart
│   │   │
│   │   ├── create/
│   │   │   └── create_post_screen.dart     
│   │   │
│   │   ├── chat/
│   │   │   ├── chat_list_screen.dart        
│   │   │   └── chat_screen.dart             
│   │   │
│   │   └── profile/
│   │       ├── profile_screen.dart
│   │       ├── saved_screen.dart
│   │       ├── my_rsvps_screen.dart
│   │       └── settings_screen.dart
│   │
│   └
│
├── pubspec.yaml
└── README.md

 ## What does it do? (Features)

| Module | Features | Built By |
|--------|----------|----------|

|  **Home** | Welcome greeting, search bar, categories (Events/Opportunities/Communities/Internships), featured news, latest opportunities, event detail with RSVP/save | | **Francoise Jeanne Beulla Rugero** |


|  **Explore** | Create a new search page , search & filter out chips, add & remove chips from a community card with dynamic Join/Joined buttons. | **NSHUTI Jabes Ruranga** |


|  **Create** | Publication of a full form validation, a dropdown of categories (Event/Opportunity/Community Announcement), a date picker, a SnackBar feedback, and auto-clear form. | **Karekezi Lionel** |

|  **Chat** | Participants in a chat can see when messages were sent or received, and the group chat bubbles are distinguished by a yellow color when the person sends a message, and a grey color when the person receives a message | **Karekezi Lionel** |


|  **Profile** |  User image, campus, stats (Events Joined/Communities/Connections), saved items, RSVP management, settings | **Merci Nzabinesha** |



## How do I use it? (Setup & Installation)

### Prerequisites

- Flutter SDK `^3.16.0`
- Dart SDK `^3.2.0`
- Android Studio / VS Code
- iOS Simulator or Android Emulator



### Installation Steps


# 1. Clone the repository
git clone https://github.com/n-ruranga/alu_connect_plus.git

# 2. Navigate to project folder
cd alu_connect_plus

# 3. Get dependencies
flutter pub get

# 4. Run the app
flutter run


**Future Improvements**

-Backend integration (Firebase Firestore)

-Real-time chat with push notifications

-User authentication and personalized profiles

-Edit and delete posts

-Image uploads for events and communities

-RSVP calendar sync

-In-app notification system




## Who made it? (Team)

Member	Role	Contributions

NSHUTI Jabes Ruranga	Project Lead	Project foundation, AppColors, dark theme, bottom navigation, routing, Explore screen, Communities


Francoise Jeanne Beulla Rugero	Developer	Home screen, Opportunities, Event details, RSVP button, save button


Karekezi Lionel	Developer	Create Post screen (validation, dropdown, date picker), Chat system (chat list + chat screen)


Merci Nzabinesha	Developer	Profile screen, Saved items, My RSVPs, Settings screen
