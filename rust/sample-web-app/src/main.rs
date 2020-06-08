pub mod db;
pub mod models;
pub mod filters;
pub mod handlers;

pub use models::*;

#[tokio::main]
async fn main() {
    let database = db::init_db();
    warp::serve(filters::users_api(database)).run(([127, 0, 0, 1], 3030)).await;
}