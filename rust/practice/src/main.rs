use std::io;

trait Fluit {
    fn get_size(&self) -> i64;
}

struct Apple {
    size: i64
}

struct Pine {
    size: i64
}

impl Fluit for Apple {
    fn get_size(&self) -> i64 {
        println!("get for Apple");
        self.size
    }
}

impl Fluit for Pine {
    fn get_size(&self) -> i64 {
        println!("get for Pine");
        self.size
    }
}

fn main() {
    println!("1: Apple? 2: Pine?");
    let stdin = io::stdin();
    let mut input = String::new();
    let _ = stdin.read_line(&mut input);
    let input = input.trim();

    let apple = Apple { size: 1 };
    let pine = Pine { size: 1 };
    
    let fluit: &dyn Fluit = match input.as_ref() {
        "1" => &apple as &dyn Fluit,
        "2" => &pine as &dyn Fluit,
        _ => panic!("error")
    };

    println!("{}", fluit.get_size());
}
