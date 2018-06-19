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
        const { category, ranking, error } = this.props
        return (
            <div>
                <h2>{
                    typeof category !== 'undefined'
                        ? `${category.name}のランキング`
                        : ''
                }</h2>
                {(() => {
                    if (error) {
                        return <p>Error occured...</p>
                    } else if (typeof ranking === 'undefined') {
                        return <p>loading...</p>
                    } else {
                        return (
                            <ol>
                                {
                                    ranking.map(item => (
                                        <li key={`ranking-item-${item.code}`}>
                                            <img src={item.imageUrl} />
                                            <a href={item.url} target='_blank'>{item.name}</a>
                                        </li>
                                    ))
                                }
                            </ol>
                        )
                    }
                })()
                }
            </div>
        )
    }
}

Ranking.propTypes = {
    categoryId: PropTypes.string.isRequired,
    onMount: PropTypes.func.isRequired,
    onUpdate: PropTypes.func.isRequired,
    ranking: PropTypes.array.isRequired
}