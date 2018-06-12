import React, { Component } from 'react';
import TodoInput from './components/TodoInput'
import TodoList from './components/TodoList'

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      tasks: [
        { title: 'first task', id: 0 },
        { title: 'second task', id: 1 },
      ],
      uniqueId: 1,
    }
    this.addTodo = this.addTodo.bind(this)
    this.resetTodo = this.resetTodo.bind(this)
  }

  addTodo(title) {
    const {
      tasks,
      uniqueId
    } = this.state

    tasks.push({
      title,
      id: uniqueId
    })

    this.setState({
      tasks,
      uniqueId: uniqueId + 1,
    })
  }

  resetTodo() {
    this.setState({
      tasks: []
    })
  }

  render() {
    return (
      <div>
        <h1>TODO App</h1>
        <button onClick={this.resetTodo} >Reset</button>
        <TodoInput addTodo={this.addTodo} />
        <TodoList tasks={this.state.tasks} />
      </div>
    );
  }
}

export default App;
