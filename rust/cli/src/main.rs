extern crate clap;

use clap::{App, SubCommand};
mod handlers;
use handlers::xc_handler::xc_handler;

fn main() {
    let matches = App::new("Commands")
        .version("0.0.1")
        .author("Kazumasa Shimomura <kazu.devapp@gmail.com>")
        .about("My custom commands")
        .subcommand(
            SubCommand::with_name("xc")
                .about("Open xcode project file")
        )
        .get_matches();

    if matches.subcommand_matches("xc").is_some() {
        xc_handler()
    }
}
