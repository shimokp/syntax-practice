import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

const List = () => {
  return <ul>
    {[1, 2, 3].map(num => <li>{num}</li>)}
  </ul>
}

const Hello = (props) => {
  return <div>Hello, {props.children}!!!</div>
}
class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <List />
        <Hello children='hogehoge'>
        </Hello>
      </div>
    );
  }
}

export default App;
