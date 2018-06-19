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
                <ol>
                    {
                        this.props.categories.map(item => (
                            <li key={`category-list-${item.id}`}>{item.title}</li>
                        ))
                    }
                </ol>
            </div>
        )
    }
}

CategoryList.propTypes = {
    onLoad: PropTypes.func.isRequired,

    categories: PropTypes.arrayOf(PropTypes.shape({
        title: PropTypes.string.isRequired,
        url: PropTypes.string.isRequired,
        id: PropTypes.string.isRequired
    }))
}