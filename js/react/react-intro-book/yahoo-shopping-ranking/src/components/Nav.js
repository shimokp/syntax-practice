import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom'
import Drawer from '@material-ui/core/Drawer';
import { List, ListItem, ListItemText } from '@material-ui/core';

export default function Nav({ categories, onClick }) {
    const to = category => (
        category.id === '1'
            ? '/all'
            : `/category/${category.id}`
    )

    return (
        <Drawer variant="permanent">
            <List style={{ width: 240 }}>
                {categories.map(category => (
                    <ListItem
                        button
                        key={`menu-item-${category.id}`}
                    >
                        <ListItemText primary={category.name} />
                    </ListItem>
                ))}
                <li><Link to='/categories'>Category List</Link></li>
            </List>
        </Drawer>
    )
}

Nav.propTypes = {
    categories: PropTypes.arrayOf(
        PropTypes.shape({
            id: PropTypes.string.isRequired,
            name: PropTypes.string.isRequired
        })
    ).isRequired,
    onClick: PropTypes.func.isRequired
}