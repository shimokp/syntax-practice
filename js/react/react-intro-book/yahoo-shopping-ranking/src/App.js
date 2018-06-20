import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';
import Ranking from './containers/Ranking';
import Nav from './containers/Nav';
import CategoryList from './containers/CategoryList';


class App extends Component {
  render() {
    return (
      <div className="App" style={{ paddingLeft: 300 }}>
        <Nav />
        <Switch>
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
        </Switch>
      </div>
    );
  }
}

export default App;
