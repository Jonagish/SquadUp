# 1: A/B Test Name: Sign-Up Method: Email vs Social Media Sign-Up

**User Story Number:** US1 (Account Creation)

## Metrics:
- **Happiness:** User satisfaction and feedback about the sign-up process.
- **Engagement:** Sign-up conversion rate.
- **Adoption:** Percentage of users who successfully sign up and continue using the app.
- **Retention:** Percentage of users who return to the app after signing up.
- **Task Success Rate:** Completion rate of the sign-up process.

## Hypothesis:
We believe that providing users with the option to sign up via social media accounts (e.g., Google, Facebook) will increase the sign-up conversion rate compared to traditional email/password sign-up. This hypothesis assumes that users find social media sign-ups quicker and more convenient, leading to a higher completion rate.

## What problem are we trying to solve? Its impact?
The current sign-up process uses email and password entry only, which may be causing friction and drop-offs during the account creation phase. Our analysis shows that users are abandoning the sign-up process, possibly due to the perceived time and effort required to create a new account. We believe this problem impacts our app’s adoption rate by limiting user sign-ups, which in turn negatively affects user engagement and retention.

We are testing whether allowing users to sign up through social media accounts reduces friction and improves the sign-up conversion rate, ultimately leading to higher engagement and adoption.

## Experiment:
- **Experiment Setup:**  
   We will randomly assign 50% of new users to receive the email/password sign-up flow (Version A), and 50% to receive the social media sign-up options (Version B). This will be done using Firebase Remote Config for experimentation.
   
- **Audience:**  
   The test will target new users who have never signed up for the app before. These users will be allocated into two groups: one group will see the email/password sign-up option, while the other will see the social media sign-up options. This will help isolate the impact of sign-up method choice without affecting existing users.
   
- **Tracking Setup using Firebase Analytics:**  
   We will track the following events:
   - Sign-up attempt (measured as when the user submits the form or presses the social media sign-up button).
   - Sign-up success (measured as when the user successfully creates an account and accesses the app).
   - Drop-off rate (measured by where users abandon the sign-up process).
   - User engagement metrics (tracked by how often the user logs into the app after signing up).

   Firebase events like `sign_up_attempt` and `sign_up_success` will be configured to capture detailed user interactions and analyze the impact of each variation.

## Variations:
1. **Version A (Email/Password Sign-Up)**:
   - Traditional sign-up screen that asks for the user’s email and password.
   - Users are required to fill in both fields before proceeding with account creation.
   - Mockup of the screen: 
     - **Email input field**
     - **Password input field**
     - **Sign-up button**


2. **Version B (Social Media Sign-Up)**:
   - Sign-up screen with the option to log in via social media (Google, Facebook, etc.).
   - Users can simply press a button to sign up using their existing social media account.
   - Mockup of the screen:
     - **Sign up with Google button**
     - **Sign up with Facebook button**


## Rationale for Variations:
The goal of the test is to measure how the method of signing up affects user conversion and satisfaction. By allowing social media logins, we are aiming to reduce friction and make the sign-up process quicker and easier for users, potentially increasing the number of successful sign-ups. The email/password option is still available as a backup in case the user prefers that method.

# 2: A/B Test Name: Suggested Game Feed vs. Chronological Feed

**User Story Number:** US4 Golden Path (UI/UX)

---

## Metrics:
- **Happiness:** User feedback regarding relevance and usefulness of game recommendations  
- **Engagement:** Number of game cards clicked per session  
- **Adoption:** Percentage of new users who join a game within their first 7 days  
- **Retention:** Percentage of users who return to the app within 3 days  
- **Task Success Rate:** Game join rate after viewing details

---

## Hypothesis:
We believe that showing users a suggested game feed (based on their preferences and location) instead of a chronological list will lead to higher engagement and game joins. The personalized experience will help users find more relevant games quickly, reducing the time and effort needed to decide.

---

## What problem are we trying to solve? Its impact?
Currently, the game discovery feed shows a list of games sorted by the time they were posted, regardless of how relevant they are to the user. This causes users—especially in densely populated areas—to scroll through long lists of irrelevant games, which leads to decision fatigue, lower game join rates, and ultimately, a drop in user engagement.

Our analytics show that although many users view the feed, a much smaller percentage click into game details or join a game. This indicates that the current game list presentation is not effectively helping users take action.

By introducing a suggested game feed, we aim to reduce cognitive load, increase perceived value, and improve both short-term engagement and long-term retention.

---

## Experiment:
- **Experiment Setup:**  
  We will use Firebase Remote Config to serve two versions of the game feed to new and returning users. The traffic will be split evenly: 50% will see the suggested (personalized) game feed, and 50% will continue to see the default chronological game feed.

- **Audience:**  
  The test will target all logged-in users who have completed onboarding. This includes both new and returning users to evaluate the general usability and relevance of feed variations across the user base.

- **Tracking Setup using Firebase Analytics:**  
  The following events will be tracked:
  - `game_card_view` – when a user views a game in the feed  
  - `game_details_open` – when a user taps to open the game detail screen  
  - `game_joined` – when a user successfully joins a game  
  - `user_retained_3d` – to measure if the user returns within 3 days  
  - `game_feed_type` – to label whether the user was in the suggested or chronological group

---

## Variations:

### Version A: Suggested Game Feed
- Game cards are ranked using a relevance algorithm (factors include distance, sport preference, skill level, time of game, user availability).
- Visual tags such as “Top Pick” or “Near You” are shown to enhance trust and appeal.
- Priority is given to games that match the user's interests.

**Mockup Screen Elements:**
- Game title + time + location  
- Relevance tag (e.g. "Top Pick")  
- Player preview (avatars of those who joined)  
- Join button

---

### Version B: Chronological Game Feed
- Game cards are shown in the order they were posted, with the most recent at the top.
- No relevance-based prioritization or visual tags.
- Users scroll through the list manually to find games of interest.

**Mockup Screen Elements:**
- Game title + time + location  
- Basic list layout, no player preview  
- Join button

---

# 3. A/B Test: Color Scheme - Vibrant vs. Minimalist

## User Story Number
**US4** (Golden Path - UI/UX)

## Metrics (HEART Framework)
- **Happiness**: User satisfaction and feedback about the sign-up process.
- **Engagement**: Sign-up conversion rate.
- **Adoption**: Percentage of users who successfully sign up and continue using the app.
- **Retention**: Percentage of users who return to the app after signing up.
- **Task Success Rate**: Completion rate of the sign-up process.

## Hypothesis
Introducing a vibrant color scheme will improve user perception of the app's interface, leading to increased sign-up conversion rates, higher satisfaction, and improved long-term retention compared to the current minimalist color palette.

## What problem are we trying to solve? Its impact?
Users have reported that the current minimalist design feels uninspired or generic, which may negatively affect their willingness to complete the sign-up process and continue using the app. Since the sign-up screen is a key touchpoint in the user journey, improving its visual appeal could have a significant impact on:

- Sign-up completion (task success)
- First impression and satisfaction (happiness)
- Continued usage and return visits (adoption & retention)

We believe the color scheme plays a vital role in building trust, enthusiasm, and engagement during onboarding.

## Experiment

### Setup
Using **Firebase Remote Config**, we will divide users into two groups:

- **Group A (Control)**: 50% of users will see the existing **Minimalist** color scheme.
- **Group B (Experiment)**: 50% of users will see a new **Vibrant** color scheme applied to the sign-up flow.

### Audience
- All new users opening the app for the first time.

### Tracking (Firebase Analytics)
- Event: `sign_up_start`
- Event: `sign_up_complete`
- Event: `sign_up_variant` (A or B)
- Event: `app_open` (to measure return rate)
- Custom metrics:
  - `user_feedback_rating`
  - `time_to_complete_signup`
  - `retention_7_day`
  - `conversion_sign_up`

## Variations

### Variation A – Minimalist (Control)
- Color palette: Light grays, white backgrounds, subtle button tones.
- Design goal: Clean and neutral interface, focused on simplicity.

### Variation B – Vibrant (Experiment)
- Color palette: Bold accent colors (e.g., blue, teal, orange), gradients, vibrant buttons.
- Design goal: Eye-catching, energetic, and modern interface that feels inviting.

> 🖼️ Design mockups and UI comparison assets will be added to this test case once finalized by the design team.


## Rationale for Variations:
This experiment tests whether personalizing the discovery experience can improve action-oriented behavior in the app. We expect that relevance-driven suggestions will reduce the number of irrelevant games users scroll past, increase game detail views, and ultimately lead to more games joined. The chronological list acts as a control, reflecting the current default user experience.

