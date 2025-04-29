use std::{fs, path::PathBuf};

use clap::Parser;
use colored::Colorize;
use serde::Deserialize;

const DOTS: &str = "  •••  ";
const TITLES: [&str; 16] = [
    "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "0A", "0B", "0C", "0D", "0E", "0F",
];

#[derive(Parser)]
struct Cli {
    #[clap(short, long)]
    file: PathBuf,
}

fn main() -> anyhow::Result<()> {
    let cli = Cli::parse();
    let colors = fs::read_to_string(cli.file)?;
    let base16: Base16Colors = toml::from_str(&colors)?;
    let rgbs = base16.to_rgb_vec();
    print_titles();
    print_square(rgbs);
    Ok(())
}

#[derive(Deserialize)]
struct Base16Colors {
    base00: String,
    base01: String,
    base02: String,
    base03: String,
    base04: String,
    base05: String,
    base06: String,
    base07: String,
    base08: String,
    base09: String,
    #[serde(rename = "base0A")]
    base0a: String,
    #[serde(rename = "base0B")]
    base0b: String,
    #[serde(rename = "base0C")]
    base0c: String,
    #[serde(rename = "base0D")]
    base0d: String,
    #[serde(rename = "base0E")]
    base0e: String,
    #[serde(rename = "base0F")]
    base0f: String,
}

impl Base16Colors {
    fn to_rgb_vec(&self) -> [(u8, u8, u8); 16] {
        [
            hex_to_rgb(&self.base00),
            hex_to_rgb(&self.base01),
            hex_to_rgb(&self.base02),
            hex_to_rgb(&self.base03),
            hex_to_rgb(&self.base04),
            hex_to_rgb(&self.base05),
            hex_to_rgb(&self.base06),
            hex_to_rgb(&self.base07),
            hex_to_rgb(&self.base08),
            hex_to_rgb(&self.base09),
            hex_to_rgb(&self.base0a),
            hex_to_rgb(&self.base0b),
            hex_to_rgb(&self.base0c),
            hex_to_rgb(&self.base0d),
            hex_to_rgb(&self.base0e),
            hex_to_rgb(&self.base0f),
        ]
    }
}

fn hex_to_rgb(hex: &str) -> (u8, u8, u8) {
    let hex = hex.trim_start_matches('#');
    let r = u8::from_str_radix(&hex[0..2], 16).unwrap();
    let g = u8::from_str_radix(&hex[2..4], 16).unwrap();
    let b = u8::from_str_radix(&hex[4..6], 16).unwrap();
    (r, g, b)
}

fn print_square(colors: [(u8, u8, u8); 16]) {
    for (i, (r, g, b)) in colors.iter().enumerate() {
        print!("  {}  ", TITLES[i]);
        for (br, bg, bb) in colors {
            print!("{}", DOTS.truecolor(*r, *g, *b).on_truecolor(br, bg, bb));
            print!(" ")
        }

        println!();
    }
}

fn print_titles() {
    print!("      ");
    let titles = TITLES;
    for (_, title) in titles.iter().enumerate() {
        print!("{title}      "); // Prints in two-digit hexadecimal format       print!("   {}m  ", i)
    }

    println!()
}
