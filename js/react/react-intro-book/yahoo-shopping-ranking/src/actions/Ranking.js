import secret from "../secret";
import fetchJsonp from 'fetch-jsonp'
import qs from 'qs'

const startRequest = categoryId => ({
    type: 'START_REQUEST',
    payload: { categoryId }
})

const receiveData = (categoryId, error, response) => ({
    type: 'RECEIVE_DATA',
    payload: { categoryId, error, response }
})

const finishRequest = categoryId => ({
    type: 'FINISH_REQUEST',
    payload: { categoryId }
})

export const fetchRanking = categoryId => {
    return async dispatch => {
        dispatch(startRequest(categoryId))

        const queryString = qs.stringify({
            appid: `${secret.APP_ID}-`,
            categoryId
        })

        try {
            const response = await fetchJsonp(`${secret.API_URL}?${queryString}`)
            const data = await response.json()
            dispatch(receiveData(categoryId, null, data))
        } catch (err) {
            dispatch(receiveData(categoryId, err))
        }
        dispatch(finishRequest(categoryId))
    }
}