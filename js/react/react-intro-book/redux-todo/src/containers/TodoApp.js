import { connect } from 'react-redux';
import TodoApp from '../components/TodoApp'
import { inputTask, addTask, resetTask } from '../actions/tasks'

function mapStateToProps({ task, tasks }) {
    return {
        task,
        tasks
    }
}

function mapDispatchToProps(dispatch) {
    return {
        addTask(task) {
            dispatch(addTask(task))
        },
        inputTask(task) {
            dispatch(inputTask(task))
        },
        resetTask() {
            dispatch(resetTask())
        }
    }
}

// TodoAppに整形されたstateがpropsとして渡る
export default connect(mapStateToProps, mapDispatchToProps)(TodoApp)