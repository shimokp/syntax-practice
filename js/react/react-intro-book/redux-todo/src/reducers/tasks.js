const initialState = {
    taskTitle: '',
    tasks: []
}

export default function tasksReducer(state = initialState, action) {
    switch (action.type) {
        case 'ADD_TASK':
            return {
                ...state,
                tasks: state.tasks.concat([{
                    title: action.payload.taskTitle,
                    id: action.payload.id
                }])
            }
        case 'INPUT_TASK':
            return {
                ...state,
                taskTitle: action.payload.taskTitle
            }
        case 'RESET_TASK':
            return {
                ...state,
                tasks: []
            }
        default:
            return state
    }
}