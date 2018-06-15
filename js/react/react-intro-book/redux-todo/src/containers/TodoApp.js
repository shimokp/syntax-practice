import { connect } from 'react-redux';
import TodoApp from '../components/TodoApp'
import { inputTask, addTask, resetTask, asyncAddTask } from '../actions/tasks'
import { push } from 'react-router-redux';

function mapStateToProps({ tasks }) {
    return {
        taskTitle: tasks.taskTitle,
        tasks: tasks.tasks
    }
}

function mapDispatchToProps(dispatch) {
    return {
        addTask(taskTitle) {
            dispatch(addTask(taskTitle))
        },
        inputTask(taskTitle) {
            dispatch(inputTask(taskTitle))
        },
        resetTask() {
            dispatch(resetTask())
        },
        redirectToError() {
            dispatch(push('/error'))
        },
        asyncAddTask(taskTitle) {
            dispatch(asyncAddTask(taskTitle))
        }
    }
}

// TodoAppに整形されたstateがpropsとして渡る
export default connect(mapStateToProps, mapDispatchToProps)(TodoApp)