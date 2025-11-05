use clap::{Parser, Subcommand};
use reqwest;
use serde_yaml;
use std::error::Error;
use std::fs;
use std::path::PathBuf;

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    /// Generate color schemes from a local YAML file
    FromFile {
        /// Path to the base16 YAML theme file
        path: PathBuf,
    },
    /// Download and generate color schemes from a base16 theme
    FromRepo {
        /// Name of the theme (e.g., "rose-pine")
        theme: String,
    },
    /// List available themes from base16 repository
    List,
    /// Fetch all theme and write them to our dotfiles
    All,
}

#[derive(Debug, serde::Deserialize)]
struct Base16Theme {
    scheme: String,
    author: String,
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
    base0A: String,
    base0B: String,
    base0C: String,
    base0D: String,
    base0E: String,
    base0F: String,
}

fn generate_toml(theme: &Base16Theme) -> String {
    let mut output = String::new();

    // Base color variables
    for i in 0..16 {
        let base = format!("base{:02X}", i);
        let color = theme.get_color(&base);
        output.push_str(&format!("{} = \"{}\"\n", base, color));
    }

    // GTK colors as raw string
    output.push_str("\ngtk_colors = \"\"\"\n");
    output.push_str(&generate_gtk(theme));
    output.push_str("\"\"\"\n");

    // SCSS colors as raw string
    output.push_str("\nscss_colors = \"\"\"\n");
    output.push_str(&generate_scss(theme));
    output.push_str("\"\"\"\n");

    output
}

fn generate_gtk(theme: &Base16Theme) -> String {
    let mut output = String::new();

    for i in 0..16 {
        let base = format!("base{:02X}", i);
        let color = theme.get_color(&base);
        output.push_str(&format!(
            "@define-color {}  #{};
",
            base, color
        ));
    }

    output
}

fn generate_scss(theme: &Base16Theme) -> String {
    let mut output = String::new();

    for i in 0..16 {
        let base = format!("base{:02X}", i);
        let color = theme.get_color(&base);
        output.push_str(&format!(
            "${}: #{};
",
            base, color
        ));
    }

    output
}

impl Base16Theme {
    fn get_color(&self, base: &str) -> &str {
        match base {
            "base00" => &self.base00,
            "base01" => &self.base01,
            "base02" => &self.base02,
            "base03" => &self.base03,
            "base04" => &self.base04,
            "base05" => &self.base05,
            "base06" => &self.base06,
            "base07" => &self.base07,
            "base08" => &self.base08,
            "base09" => &self.base09,
            "base0A" => &self.base0A,
            "base0B" => &self.base0B,
            "base0C" => &self.base0C,
            "base0D" => &self.base0D,
            "base0E" => &self.base0E,
            "base0F" => &self.base0F,
            _ => panic!("Invalid base color"),
        }
    }
}

async fn download_theme(theme_name: &str) -> Result<Base16Theme, Box<dyn Error>> {
    let url = format!(
        "https://raw.githubusercontent.com/base16-project/base16-schemes/master/{}.yaml",
        theme_name
    );

    let response = reqwest::get(&url).await?;
    let yaml_content = response.text().await?;
    let theme: Base16Theme = serde_yaml::from_str(&yaml_content)?;

    Ok(theme)
}

async fn list_themes() -> Result<Vec<String>, Box<dyn Error>> {
    let url = "https://api.github.com/repos/base16-project/base16-schemes/contents/";
    let client = reqwest::Client::new();
    let response = client
        .get(url)
        .header("User-Agent", "base16-theme-generator")
        .send()
        .await?;

    #[derive(serde::Deserialize)]
    struct GithubFile {
        name: String,
    }

    let files: Vec<GithubFile> = response.json().await?;
    Ok(files
        .into_iter()
        .filter(|f| f.name.ends_with(".yaml"))
        .map(|f| f.name.replace(".yaml", ""))
        .collect())
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let cli = Cli::parse();

    match &cli.command {
        Commands::FromFile { path } => {
            let content = fs::read_to_string(path)?;
            let theme: Base16Theme = serde_yaml::from_str(&content)?;
            println!("{}", generate_toml(&theme));
        }
        Commands::FromRepo { theme } => {
            let theme = download_theme(theme).await?;
            println!("{}", generate_toml(&theme));
        }
        Commands::List => {
            let themes = list_themes().await?;
            for theme in themes {
                println!("{}", theme);
            }
        }
        Commands::All => {
            let themes = list_themes().await?;
            for theme in themes {
                let base16 = download_theme(&theme).await?;
                let content = generate_toml(&base16);
                fs::write(
                    format!("/home/okno/dotfiles/profiles/themes/{theme}.toml"),
                    &content,
                )?;
            }
        }
    }

    Ok(())
}
