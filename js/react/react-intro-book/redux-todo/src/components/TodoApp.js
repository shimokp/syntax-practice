import React from 'react';

export default function TodoApp({ taskTitle, tasks, inputTask, addTask, resetTask, redirectToError, asyncAddTask }) {
    return (
        <div>
            <input type='text' onChange={(e) => inputTask(e.target.value)} value={taskTitle} />
            <input type='button' value='Add' onClick={() => addTask(taskTitle)} />
            <input type='button' value='Async Add' onClick={() => {
                console.log(asyncAddTask)
                asyncAddTask(taskTitle)
            }} />
            <button onClick={() => resetTask()} >Reset</button>
            <ul>
                {
                    tasks.map(function (item, i) {
                        return (
                            <li key={i}>{item.title}</li>
                        )
                    })
                }
            </ul>
            <button onClick={() => redirectToError()} >Go to Error</button>
        </div>
    )
}