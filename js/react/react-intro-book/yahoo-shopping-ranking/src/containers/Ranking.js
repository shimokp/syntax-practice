import Ranking from "../components/Ranking";
import { connect } from 'react-redux'
import * as actions from '../actions/Ranking'

const mapStateToProps = (state, ownProps) => ({
    categoryId: ownProps.categoryId,
    category: state.ranking.category,
    ranking: state.ranking.ranking,
    error: state.ranking.error,
})

const mapDispatchToProps = dispatch => ({
    onMount(categoryId) {
        dispatch(actions.fetchRanking(categoryId))
    },
    onUpdate(categoryId) {
        dispatch(actions.fetchRanking(categoryId))
    }
})

export default connect(mapStateToProps, mapDispatchToProps)(Ranking)