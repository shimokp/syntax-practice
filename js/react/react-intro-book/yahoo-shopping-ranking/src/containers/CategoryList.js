import { connect } from 'react-redux';
import CategoryList from '../components/CategoryList';
import { fetchCategories } from '../actions/CategoryList';

const mapStateToProps = state => {
    return {
        categories: state.categoryList.categories,
        isLoading: state.categoryList.isLoading
    }
}

const mapDispatchToProps = dispatch => ({
    onLoad() {
        dispatch(fetchCategories())
    }
})

export default connect(mapStateToProps, mapDispatchToProps)(CategoryList)