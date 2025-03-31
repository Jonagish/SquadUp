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

# 2 - A/B Test: Color Scheme - Vibrant vs. Minimalist

## User Story Number
**US4** Golden Path (UI/UX)

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

> Design mockups and UI comparison assets will be added to this test case once finalized by the design team.


