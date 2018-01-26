import React, { Component } from 'react';

import { QueryRenderer, graphql } from 'react-relay';

import environment from './relay-environment';

const query = graphql`
  query AppQuery { campaigns { id title } }
`;

class App extends Component {

  renderCampaign(campaign) {
    return (
      <li key={campaign.id}>{campaign.title}</li>
    );
  }

  render() {
    return (
      <QueryRenderer
        environment={environment}
        query={query}
        render={({ error, props }) => {
          if (error) {
            return (
              <div>{error.message}</div>
            );
          } else if (props) {
            return (
              <ul>
                {props.campaigns.map(campaign => this.renderCampaign(campaign))}
              </ul>
            );
          } else {
            return (
              <div>Loading...</div>
            )
          }
        }}
        />
    );
  }
}

export default App;
