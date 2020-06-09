use std::{fs, io};
use std::path::{ PathBuf };
use fs::ReadDir;
use std::process::Command;

pub fn xc_handler() {
    let paths: ReadDir = fs::read_dir(".")
        .expect("Cannot read");

    let mut filtered_paths: Vec<PathBuf> = paths
        .map(|res| res.map(|e| e.path() ))
        .filter(|e| {
            e.as_ref().unwrap().extension()
                .and_then(|e| e.to_str())
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
        None => println!("Not found 😢")
    };
}