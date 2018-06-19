import secret from "../secret";
import fetchJsonp from 'fetch-jsonp'
import qs from 'qs'
import { replace } from 'react-router-redux';

const startRequest = category => ({
    type: 'START_REQUEST',
    payload: { category }
})

const receiveData = (category, error, response) => ({
    type: 'RECEIVE_DATA',
    payload: { category, error, response }
})

const finishRequest = category => ({
    type: 'FINISH_REQUEST',
    payload: { category }
})

export const fetchRanking = categoryId => {
    return async (dispatch, getState) => {
        const categories = getState().shopping.categories
        const category = categories.find(category => (category.id === categoryId))
        if (typeof category === 'undefined') {
            // 対応するデータがない場合はトップページへリダイレクト
            dispatch(replace('/'))
            return
        }
        dispatch(startRequest(category))

        const queryString = qs.stringify({
            appid: `${secret.APP_ID}-`,
            categoryId
        })

        try {
            const response = await fetchJsonp(`${secret.API_URL}?${queryString}`)
            const data = await response.json()
            dispatch(receiveData(category, null, data))
        } catch (err) {
            dispatch(receiveData(category, err))
        }
        dispatch(finishRequest(category))
    }
}