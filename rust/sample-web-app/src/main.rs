use warp::{ Filter, Reply, Rejection };

#[tokio::main]
async fn main() {
    let hello = hello().and(name()).and_then(greet_hander);
    warp::serve(hello).run(([127, 0, 0, 1], 3030)).await;
}

fn hello() -> warp::filters::BoxedFilter<()> {
    warp::path("hello").boxed()
}

fn name() -> warp::filters::BoxedFilter<(String,)> {
    warp::path::param().boxed()
}

async fn greet_hander(name: String) -> Result<impl Reply, Rejection> {
    let reply = format!("hello {}", name);
    Ok(warp::reply::html(reply))
}