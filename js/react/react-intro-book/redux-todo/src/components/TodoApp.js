import React from 'react';

export default function TodoApp({ task, tasks, inputTask, addTask, resetTask, redirectToError, asyncAddTask }) {
    return (
        <div>
            <input type='text' onChange={(e) => inputTask(e.target.value)} />
            <input type='button' value='Add' onClick={() => addTask(task)} />
            <input type='button' value='Async Add' onClick={() => {
                console.log(asyncAddTask)
                asyncAddTask(task)
            }} />
            <button onClick={() => resetTask()} >Reset</button>
            <ul>
                {
                    tasks.map(function (item, i) {
                        return (
                            <li key={i}>{item}</li>
                        )
                    })
                }
            </ul>
            <button onClick={() => redirectToError()} >Go to Error</button>
        </div>
    )
}