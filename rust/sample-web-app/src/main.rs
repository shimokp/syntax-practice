use warp::{ Filter, Reply, Rejection };

#[tokio::main]
async fn main() {
    let hello = hello().and(name()).and_then(greet_hander);
    warp::serve(hello).run(([127, 0, 0, 1], 3030)).await;
}

fn hello() -> warp::filters::BoxedFilter<()> {
    warp::path("hello").boxed()
}

fn name() -> warp::filters::BoxedFilter<(Name,)> {
    warp::path::param().boxed()
}

async fn greet_hander(name: Name) -> Result<impl Reply, Rejection> {
    let reply = format!("hello {}", name);
    Ok(warp::reply::html(reply))
}

#[derive(Clone, Debug)]
struct Name(String);

impl Name {
    pub fn new(name: &str) -> Result<Self, String> {
        let size = name.chars().count();
        if size < 1 || size > 10 {
            return Err("名前は10文字以内で".to_string());
        }

        if name.chars().any(|c| !c.is_ascii_alphabetic()) {
            return Err("Use only A-Z, a-z".to_string());
        }

        Ok(Name(name.to_string()))
    }
}

impl std::str::FromStr for Name {
    type Err = String;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        Name::new(s)
    }
}

impl std::fmt::Display for Name {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.0)
    }
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