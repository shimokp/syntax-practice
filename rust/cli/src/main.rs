extern crate clap;
use clap::{App, SubCommand};
use std::{fs};
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
        println!("Execute for Xcode");

        let paths = fs::read_dir("a")
            .expect("Cannot read")
            .filter(|entry| {
                let entry = entry.clone();
                let path = entry.expect("").path();
                let extension = entry.expect("").path().extension().unwrap();
                return extension == ""
                    || extension == "xcworkspace";
            });

        let filteredPaths: Vec<_> = paths
            .into_iter()
            .filter(|dir| {
                let extension = dir.clone().unwrap().path().extension();
                return extension == Some(OsStr::new("a"))
                    || extension == Some(OsStr::new("xcworkspace"));
            })
            .collect();

    }
}