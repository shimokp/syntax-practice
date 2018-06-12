import React, { Component } from 'react';
import TodoInput from './components/TodoInput'
import TodoList from './components/TodoList'

class App extends Component {
  render() {
    const tasks = [
      { title: 'first task', id: 0 },
      { title: 'second task', id: 1 },
    ]
    return (
      <div>
        <h1>TODO App</h1>
        <TodoInput />
        <TodoList tasks={tasks} />
      </div>
    );
  }
}

export default App;
