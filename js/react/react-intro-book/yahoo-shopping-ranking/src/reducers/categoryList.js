const getCategories = response => {
    const categories = response.ResultSet['0'].Result.Categories.Children

    const res = []
    for (const key in Object.keys(categories)) {
        if (!categories.hasOwnProperty(key)) continue
        const item = categories[key]
        res.push({
            id: item.Id,
            name: item.Title.Long,
            url: item.Url
        })
    }
    return res
}

const initialState = {
    categories: [],
    error: false,
}

export default (state = initialState, action) => {
    switch (action.type) {
        case 'START_CATEGORY_REQUEST':
            return {
                categories: [],
                error: false,
                isLoading: true
            }
        case 'RECEIVE_CATEGORY_DATA':
            return action.payload.error
                ? {
                    ...state,
                    isLoading: false,
                    error: true
                }
                : {
                    ...state,
                    isLoading: false,
                    categories: getCategories(action.payload.response)
                }
        default:
            return state
    }
}