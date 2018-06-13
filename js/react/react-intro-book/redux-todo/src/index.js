import React from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import { render } from 'react-dom';
import tasksReducer from './reducers/tasks'
import TodoApp from './containers/TodoApp'

const store = createStore(tasksReducer)

function renderApp(store) {
    render(
        <Provider store={store} >
            <TodoApp />
        </Provider>,
        document.getElementById('root')
    )
}

store.subscribe(() => renderApp(store))

renderApp(store)
