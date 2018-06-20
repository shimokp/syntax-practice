import PropTypes from 'prop-types';
import React from 'react';
import { Link } from 'react-router-dom'

export default class CategoryList extends React.Component {
    componentWillMount() {
        this.props.onLoad()
    }

    render() {
        return (
            <div>
                <h1>Category List</h1>
                {(() => {
                    if (this.props.isLoading) {
                        return <p>Loading...</p>
                    }
                })()}
                < ol >
                    {
                        this.props.categories.map(item => (
                            <li key={`category-item-${item.id}`}><Link to={`/category/${item.id}`}>{item.name}</Link></li>
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
        name: PropTypes.string.isRequired,
        url: PropTypes.string.isRequired,
        id: PropTypes.string.isRequired
    }))
}