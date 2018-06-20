const getRanking = response => {
    const ranking = [];
    const itemLength = response.ResultSet.totalResultsReturned
    for (var index = 0; index < itemLength; index++) {
        const item = response.ResultSet['0'].Result[index + ''] // ???
        ranking.push({
            code: item.Code,
            name: item.Name,
            url: item.Url,
            imageUrl: item.Image.Medium
        })
    }
    return ranking
}

const initialState = {
    category: undefined,
    ranking: [],
    error: false,
    isLoading: false
}

export default (state = initialState, action) => {
    switch (action.type) {
        case 'START_RANKING_REQUEST':
            return {
                category: action.payload.category,
                ranking: [],
                error: false,
                isLoading: true
            }
        case 'RECEIVE_RANKING_DATA':
            return action.payload.error
                ? {
                    ...state,
                    isLoading: false,
                    error: true
                }
                : {
                    ...state,
                    isLoading: false,
                    ranking: getRanking(action.payload.response)
                }
        default:
            return state
    }
}