use warp::{Rejection, Reply};
use crate::{Database, User};

pub async fn list_users_handler(db: Database) -> Result<impl Reply, Rejection> {
    let db = db.lock().await;
    let users = db
        .clone()
        .into_iter()
        .map(|(_, v) v)
        .collect::<Vec<User>>();
    Ok(warp::reply::json(&users))
}