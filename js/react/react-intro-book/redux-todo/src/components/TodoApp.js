import React from 'react';
import Reboot from 'material-ui/Reboot';
import Button from 'material-ui/Button';
import AppBar from 'material-ui/AppBar';
import Toolbar from 'material-ui/Toolbar';
import Typography from 'material-ui/Typography';
import Input from 'material-ui/Input';
import List, { ListItem, ListItemText } from 'material-ui/List';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';
import './TodoApp.css'

export default function TodoApp({ taskTitle, tasks, inputTask, addTask, resetTask, redirectToError, asyncAddTask }) {
    return (
        <div>
            <Reboot />
            <AppBar position='static'>
                <Toolbar>
                    <Typography type='title' color='inherit'>
                        Todo
                    </Typography>
                </Toolbar>
            </AppBar>
            <div style={{ padding: 16 }}>
                <Input onChange={(e) => inputTask(e.target.value)} value={taskTitle} />
                <Button raised color='primary' onClick={() => addTask(taskTitle)}>Add</Button>
                <Button raised color='secondary' onClick={() => {
                    console.log(asyncAddTask)
                    asyncAddTask(taskTitle)
                }}>Async Add</Button>
                <Button raised color='inherit' onClick={() => resetTask()}>Reset</Button>
                <List>
                    <ReactCSSTransitionGroup transitionName='example' transitionEnterTimeout={300} transitionLeaveTimeout={0}>
                        {
                            tasks.map(function (item, i) {
                                return (
                                    <ListItem key={i}>
                                        <ListItemText primary={`・${item.title}`} />
                                    </ListItem>
                                )
                            })
                        }
                    </ReactCSSTransitionGroup>
                </List>
                <button onClick={() => redirectToError()} >Go to Error</button>
            </div>
        </div>
    )
}