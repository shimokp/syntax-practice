use warp::{ Filter, Reply, Rejection };

pub mod db;
pub mod models;

pub use models::*;

#[tokio::main]
async fn main() {
    let database = db::init_db();
    let hello = hello().and(name()).and_then(greet_hander);
    warp::serve(hello).run(([127, 0, 0, 1], 3030)).await;
}

fn hello() -> warp::filters::BoxedFilter<()> {
    warp::path("hello").boxed()
}

fn name() -> warp::filters::BoxedFilter<(models::Name,)> {
    warp::path::param().boxed()
}

async fn greet_hander(name: Name) -> Result<impl Reply, Rejection> {
    let reply = format!("hello {}", name);
    Ok(warp::reply::html(reply))
}


#[test]
fn test_name() {
    let ok_value = "Nrskt";
    assert!(Name::new(ok_value).is_ok());

    let ok_value = "N";
    assert!(Name::new(ok_value).is_ok());

    let ng_value = "0";
    assert!(Name::new(ng_value).is_err());
}