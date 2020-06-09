extern crate clap;
use clap::{App, SubCommand};
use std::{fs, io};
use std::path::{ PathBuf, Path };
use fs::ReadDir;
// use std::path::{Path};
use std::ffi::OsStr;

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

    let entries: Vec<PathBuf> = paths
        .map(|res| res.map(|e| e.path() ))
        .filter(|e| {
            let e = e.as_ref().unwrap();
            e.extension().unwrap().to_str().unwrap() == "xcworkspace"
            || e.extension().unwrap().to_str().unwrap() == "xcodeproj"
        })
        .collect::<Result<Vec<_>, io::Error>>()
        .unwrap();

    println!("{:?}", entries);
}