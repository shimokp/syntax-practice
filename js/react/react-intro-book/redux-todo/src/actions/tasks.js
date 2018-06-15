import shortid from 'shortid';

export const addTask = (taskTitle) => ({
    type: 'ADD_TASK',
    payload: {
        id: shortid.generate(),
        taskTitle
    }
})

export const resetTask = () => ({
    type: 'RESET_TASK',
})

export const inputTask = (taskTitle) => ({
    type: 'INPUT_TASK',
    payload: {
        taskTitle
    }
})

export const asyncAddTask = (taskTitle) => ((dispatch, getState) => {
    setTimeout(() => {
        dispatch(addTask(taskTitle))
        dispatch(inputTask(''))
    }, 1000)
})