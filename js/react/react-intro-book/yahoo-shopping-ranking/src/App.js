import React, { Component } from 'react';
import { Route, BrowserRouter as Router } from 'react-router-dom';
import Ranking from './containers/Ranking';
import Nav from './containers/Nav';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Router>
          <div>
            <Nav />
            <Route path='/all' component={Ranking} />
            <Route
              path='/category/:id'
              render={
                ({ match }) => <Ranking categoryId={match.params.id} />
              }
            />
          </div>
        </Router>
      </div>
    );
  }
}

export default App;
