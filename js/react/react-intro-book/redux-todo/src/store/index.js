import {
    createStore as reduxCreateStore,
    combineReducers,
    applyMiddleware
} from 'redux';
import { routerReducer, routerMiddleware } from 'react-router-redux';
import tasksReducer from '../reducers/tasks';

export default function createStore(history) {
    return reduxCreateStore(
        combineReducers({
            tasks: tasksReducer,
            router: routerReducer,
        }),
        applyMiddleware( //ReduxのAction経由でルーティングを制御できるようにする
            routerMiddleware(history)
        )
    )
}