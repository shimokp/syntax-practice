import PropTypes from 'prop-types'
import React from 'react';

export default class Ranking extends React.Component {
    componentWillMount() {
        this.props.onMount(this.props.categoryId)
    }
    componentWillReceiveProps(nextProps) {
        if (this.props.categoryId !== nextProps.categoryId) {
            this.props.onUpdate(nextProps.categoryId)
        }
    }
    render() {
        return (
            <div>
                <h2>Ranking component</h2>
                <p>categoryId: {this.props.categoryId}</p>
            </div>
        )
    }
}

Ranking.propTypes = {
    categoryId: PropTypes.string,
    onMount: PropTypes.func.isRequired,
    onUpdate: PropTypes.func.isRequired
}