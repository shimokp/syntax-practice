import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom'
import Drawer from '@material-ui/core/Drawer';
import { List, ListItem, ListItemText } from '@material-ui/core';

const to = category => (
    category.id === '1'
        ? '/all'
        : `/category/${category.id}`
)
export default class Nav extends React.Component {
    componentWillMount() {
        this.props.onLoad()
    }

    render() {
        return (
            <Drawer variant="permanent" >
                <List style={{ width: 300 }}>
                    {this.props.categories.map(category => (
                        <ListItem
                            button
                            key={`menu-item-${category.id}`}
                            onClick={() => this.props.onClick(`/category/${category.id}`)}
                        >
                            <ListItemText primary={category.name} />
                        </ListItem>
                    ))}
                </List>
            </Drawer>
        )
    }
}

Nav.propTypes = {
    categories: PropTypes.arrayOf(
        PropTypes.shape({
            id: PropTypes.string.isRequired,
            name: PropTypes.string.isRequired
        })
    ).isRequired,
    onClick: PropTypes.func.isRequired,
    onLoad: PropTypes.func.isRequired
}