use warp::{Rejection, Reply};
use crate::{db::Database, models::User, models::Message };

pub async fn list_users_handler(db: Database) -> Result<impl Reply, Rejection> {
    let db = db.lock().await;
    let users = db
        .clone()
        .into_iter()
        .map(|(_, v)| v)
        .collect::<Vec<User>>();
    Ok(warp::reply::json(&users))
}

pub async fn get_user_handler(db: Database, id: u64) -> Result<impl Reply, Rejection> {
    let db = db.lock().await;
    let user = db.get(&id);

    match user {
        None => Ok(warp::reply::with_status(
            warp::reply::json(&Message { message: "Not found".to_string() }),
            warp::http::StatusCode::NOT_FOUND
        )),
        Some(u) => Ok(warp::reply::with_status(
            warp::reply::json(u),
            warp::http::StatusCode::OK
        ))
    }
}

pub async fn put_user_handler(db: Database, user: User) -> Result<impl Reply, Rejection> {
    let mut db = db.lock().await;
    db.insert(user.id, user.clone());
    Ok(warp::reply::with_status(
        warp::reply::json(&user),
        warp::http::StatusCode::OK
    ))
}
