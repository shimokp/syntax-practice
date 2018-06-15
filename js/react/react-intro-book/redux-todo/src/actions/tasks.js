import shortid from 'shortid';

export const addTask = (task) => ({
    type: 'ADD_TASK',
    payload: {
        id: shortid.generate(),
        task
    }
})

export const resetTask = () => ({
    type: 'RESET_TASK',
})

export const inputTask = (task) => ({
    type: 'INPUT_TASK',
    payload: {
        task
    }
})

export const asyncAddTask = (task) => ((dispatch, getState) => {
    console.log('hoge')
    setTimeout(() => {
        dispatch(addTask(task))
    }, 1000)
})