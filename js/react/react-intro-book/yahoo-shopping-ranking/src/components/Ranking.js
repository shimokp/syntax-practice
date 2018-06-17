import PropTypes from 'prop-types'
import React from 'react';

export default function Ranking({ categoryId }) {
    return (
        <div>
            <h2>Ranking component</h2>
            <p>categoryId: {categoryId}</p>
        </div>
    )
}

Ranking.propTypes = {
    categoryId: PropTypes.string
}