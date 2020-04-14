use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

static LETTERS: [char; 7] = ['a', 'i', 'n', 'r', 'd', 'l', 'h'];

fn main() {
    if let Ok(lines) = read_lines("/usr/share/dict/words") {
        for line in lines {
            if let Ok(ip) = line {
                if match_words(&ip) {
                    println!("{}", ip);
                }
            }
        }
    }
}

fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}

fn match_words(word: &String) -> bool {
    if word.len() <= 3 || !word.contains('l') {
        return false
    }

    for c in word.trim().chars() {
       if !LETTERS.contains(&c) {
           return false
       } 
    }
    return true 
}

