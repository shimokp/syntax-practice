import { connect } from 'react-redux';
import Nav from '../components/Nav';
import { push } from 'react-router-redux'
import { fetchCategories } from '../actions/CategoryList';

const mapStateToProps = state => ({
    // stateのプロパティをprops.categoriesに紐づけ
    categories: state.categoryList.categories
})

const mapDispatchToProps = dispatch => ({
    onClick(path) {
        dispatch(push(path))
    },
    onLoad() {
        dispatch(fetchCategories())
    }
})

export default connect(mapStateToProps, mapDispatchToProps)(Nav)
