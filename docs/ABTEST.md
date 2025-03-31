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
