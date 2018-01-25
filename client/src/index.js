import React from 'react'
import ReactDOM from 'react-dom'
import createSagaMiddleware from 'redux-saga'
import { BrowserRouter, Route } from 'react-router-dom'
import ApolloClient, { createNetworkInterface } from 'apollo-client'
import { ApolloProvider } from 'react-apollo'

// Import components
import App from './app'
import Login from './login'
import registerServiceWorker from './registerServiceWorker'
import './index.css'

// Import the index reducer and sagas
import IndexReducer from './index-reducer'
import IndexSagas from './index-sagas'

const client = new ApolloClient({
  networkInterface: createNetworkInterface({ uri: 'http://localhost:4000/' }),
})

const sagaMiddleware = createSagaMiddleware()

// For use with Redux DevTools

/* eslint-disable */
const composeSetup = process.env.NODE_ENV !== 'production' && typeof window === 'object' &&
  window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ ?
  window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ : compose
/* eslint-enable */

const store = createStore(
  IndexReducer,
  composeSetup(applyMiddleware(sagaMiddleware))
)

// Init Index Saga
sagaMiddleware.run(IndexSagas)

ReactDOM.render(
  <ApolloProvider client={client}>
    <BrowserRouter>
      <Route path="/" component={App}>
        <Route path="/login" component={Login} />
      </Route>
    </BrowserRouter>
  </Provider>,
  document.getElementById('root')
)

registerServiceWorker();
