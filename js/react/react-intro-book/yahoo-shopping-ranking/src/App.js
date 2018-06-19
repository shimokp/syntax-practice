import React, { Component } from 'react';
import { Route, BrowserRouter as Router } from 'react-router-dom';
import Ranking from './containers/Ranking';
import Nav from './containers/Nav';
import CategoryList from './containers/CategoryList';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Router>
          <div>
            <Nav />
            <Route path='/all' render={
              ({ match }) => <Ranking categoryId='1' />
            } />
            <Route
              path='/category/:id'
              render={
                ({ match }) => <Ranking categoryId={match.params.id} />
              }
            />
            <Route path='/categories' component={CategoryList} />
          </div>
        </Router>
      </div>
    );
  }
}

export default App;
