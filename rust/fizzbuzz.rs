fn main() {
    for i in 1..=30 {
        let mut output = String::new();

        if i % (3 * 5) == 0 {
            output = "FizzBuzz".to_string();
        }
        else if i % 3 == 0 {
            output = "Fizz".to_string();
        } else if i % 5 == 0 {
            output = "Buzz".to_string();
        } else {
            output = i.to_string();
        }

        println!("{}", output)
    }
}

