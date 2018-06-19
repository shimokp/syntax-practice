import secret from "../secret";
import fetchJsonp from 'fetch-jsonp'
import qs from 'qs'

const startRequest = () => ({
    type: 'START_CATEGORY_REQUEST',
})

const receiveData = (response, error) => ({
    type: 'RECEIVE_CATEGORY_DATA',
    payload: { response, error }
})

const finishRequest = () => ({
    type: 'FINISH_CATEGORY_REQUEST',
})

export const fetchCategories = () => {
    return (dispatch) => {

        const queryString = qs.stringify({
            appid: `${secret.APP_ID}-`,
            category_id: 1
        })

        dispatch(startRequest())
        fetchJsonp(`${secret.API_CategorySearch_URL}?${queryString}`)
            .then((response) => {
                return response.json()
            })
            .then((json) => {
                dispatch(receiveData(json))
                dispatch(finishRequest())
            })
            .catch((error) => {
                dispatch(receiveData(null, error))
                dispatch(finishRequest())
            })
    }
}