import {
    createStore as reduxCreateStore,
    combineReducers,
    applyMiddleware
} from 'redux';
import { routerReducer, routerMiddleware } from 'react-router-redux';
import tasksReducer from '../reducers/tasks';
import thunk from 'redux-thunk';
import { createLogger } from 'redux-logger';

export default function createStore(history) {
    return reduxCreateStore(
        combineReducers({
            tasks: tasksReducer,
            router: routerReducer,
        }),
        applyMiddleware( //ReduxのAction経由でルーティングを制御できるようにする
            routerMiddleware(history),
            createLogger({
                predicate: (getState, action) => action.type !== 'INPUT_TASK' // mute the log of noisy action
            }),
            thunk
        )
    )
}