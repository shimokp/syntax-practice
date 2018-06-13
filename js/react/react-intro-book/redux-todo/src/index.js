import React from 'react';
import { Provider } from 'react-redux';
import { ConnectedRouter } from 'react-router-redux';
import { Route } from 'react-router-dom';
import createStore from './store'; // /indexは省略できる
import { render } from 'react-dom';
import TodoApp from './containers/TodoApp'
import Error from './components/Error'
import createBrowserHistory from 'history/createBrowserHistory';

const history = createBrowserHistory();
const store = createStore(history);

function renderApp(store) {
    render(
        <Provider store={store} >
            <ConnectedRouter history={history}>
                { /* Storeのルーティング情報をRouterと同期できるようにする */}
                <div>
                    <Route exact path='/' component={TodoApp} />
                    <Route exact path='/error' component={Error} />
                </div>
            </ConnectedRouter>
        </Provider>,
        document.getElementById('root')
    )
}

store.subscribe(() => renderApp(store))

renderApp(store)
