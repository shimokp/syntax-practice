import PropTypes from 'prop-types';
import React from 'react';

export default class CategoryList extends React.Component {
    componentWillMount() {
        this.props.onLoad()
    }

    render() {
        return (
            <div>
                <h1>Category List</h1>
            </div>
        )
    }
}

CategoryList.propTypes = {
    onLoad: PropTypes.func.isRequired,

    categories: PropTypes.arrayOf({
        name: PropTypes.string.isRequired
    })
}