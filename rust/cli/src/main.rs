extern crate clap;
use clap::{App, SubCommand};
use std::{fs, io};
use std::path::{ PathBuf };
use fs::ReadDir;
use std::process::Command;

fn main() {
    let matches = App::new("My Super Program")
                          .version("1.0")
                          .author("Kevin K. <kbknapp@gmail.com>")
                          .about("Does awesome things")
                          .subcommand(SubCommand::with_name("xc")
                                      .about("open xcode projects file")
                                      .version("1.0"))
                          .get_matches();

    if matches.subcommand_matches("xc").is_some() {
        xc_handler()
    }
}

fn xc_handler() {
    println!("Execute for Xcode");

    let paths: ReadDir = fs::read_dir(".")
        .expect("Cannot read");

    let mut filtered_paths: Vec<PathBuf> = paths
        .map(|res| res.map(|e| e.path() ))
        .filter(|e| {
            e.as_ref().unwrap().extension()
            .and_then(|e| e.to_str())
            .map(|e| {
                println!("{:?}", e);
                e
            })
            .and_then(|e| {
                Some(e == "xcworkspace" || e == "xcodeproj")
            })
            .unwrap_or(false)
        })
        .collect::<Result<Vec<_>, io::Error>>()
        .unwrap();

    filtered_paths.sort();

    match filtered_paths.pop() {
        Some(path) => {
            println!("Open {:?} 🚀", path);
            Command::new("open")
                .arg(path)
                .output()
                .expect("Failed to execute process");
        }
        None => println!("Not found")
    }
}