import React from 'react';
import { Provider } from 'react-redux';
import { ConnectedRouter } from 'react-router-redux';
import createStore from './store'; // /indexは省略できる
import { render } from 'react-dom';
import TodoApp from './containers/TodoApp'
import createBrowserHistory from 'history/createBrowserHistory';

const history = createBrowserHistory();
const store = createStore(history);

function renderApp(store) {
    render(
        <Provider store={store} >
            <ConnectedRouter history={history}>
                { /* Storeのルーティング情報をRouterと同期できるようにする */}
                <TodoApp />
            </ConnectedRouter>
        </Provider>,
        document.getElementById('root')
    )
}

store.subscribe(() => renderApp(store))

renderApp(store)
