import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import { createStore } from 'redux';

const initialState = {
    tasks: []
}

function tasksReducer(state = initialState, action) {
    switch (action.type) {
        case 'ADD_TASK':
            return {
                ...state,
                tasks: state.tasks.concat([action.payload.task])
            }
        default:
            return state
    }
}

const addTask = (task) => ({
    type: 'ADD_TASK',
    payload: {
        task
    }
})

const store = createStore(tasksReducer)
function handleChange() {
    console.log('handle change')
    console.log(store.getState())
}

const unsubscribe = store.subscribe(handleChange)

console.log(store.getState())
store.dispatch(addTask('Store learning'))
store.dispatch(addTask('Store learning'))
store.dispatch(addTask('Store learning'))

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();
