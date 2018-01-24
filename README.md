# Tracker

Tracker is a tool built to solve a real problem: Tracking offline marketing ROI.

It also serves to be an example of how Elixir, third-party APIs, GraphQL, and React/Redux can come together. Once Ecto.Adapters.Cassandra is complete, Tracker will have a new branch to demonstrate how to model your data with Cassandra and the nuances it entails. 

# Tasks

- [ ] **Authentication:** Refresh token on each validation to keep fresh
- [ ] **Authentication:** Add logout mutation
- [ ] **Authentication:** Ensure users are logged in before their information can be updated
- [ ] **Authorization:** Create function that verifies users' roles when performing actions
- [ ] **Client:** Implement React, Redux, Immutable.JS, and Sagas.
- [ ] **Client:** Implement auth reducer, and actions
- [ ] **Logic:** Implement Twilio API
