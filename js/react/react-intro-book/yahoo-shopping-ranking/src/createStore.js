import { createStore as reduxCreateStore, combineReducers, applyMiddleware } from 'redux'
import { routerReducer, routerMiddleware } from 'react-router-redux';
import { reducers } from './reducers'
import logger from 'redux-logger';
import thunk from 'redux-thunk';

export default function createStore(history) {
    return reduxCreateStore(
        combineReducers({
            ...reducers,
            router: routerReducer
        }),
        applyMiddleware(
            logger,
            thunk,
            routerMiddleware(history)
        )
    )
}