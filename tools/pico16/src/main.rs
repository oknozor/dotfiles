use std::fs;

use image::{GenericImageView, ImageBuffer};
use palette::{FromColor, Hsl, Srgb};

#[derive(Clone, Debug)]
pub struct Color {
    pub rgb: Srgb<f32>,
}

#[derive(Debug, serde::Deserialize)]
struct Base16 {
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
    base_0a: String,
    #[serde(rename = "base0B")]
    base_0b: String,
    #[serde(rename = "base0C")]
    base_0c: String,
    #[serde(rename = "base0D")]
    base_0d: String,
    #[serde(rename = "base0E")]
    base_0e: String,
    #[serde(rename = "base0F")]
    base_0f: String,
}

impl From<Hsl> for Color {
    fn from(hsl: Hsl) -> Self {
        let rgb = Srgb::from_color(hsl).into_format::<f32>();
        Color { rgb }
    }
}

impl Color {
    pub fn new(rgb: (u8, u8, u8)) -> Self {
        let rgb = Srgb::<u8>::from(rgb).into_format();
        Color { rgb }
    }

    pub fn hue(&self) -> f32 {
        let hsl = Hsl::from_color(self.rgb);
        hsl.hue.into_positive_degrees()
    }

    pub fn saturation(&self) -> f32 {
        let hsl = Hsl::from_color(self.rgb);
        hsl.saturation
    }

    fn rotate_hue(self, delta_deg: f32) -> Self {
        let mut hsl: Hsl = Hsl::from_color(self.rgb);
        hsl.hue += delta_deg;
        Color::from(hsl)
    }

    pub fn rgb_u8(&self) -> (u8, u8, u8) {
        let color = self.rgb.into_format::<u8>();
        (color.red, color.green, color.blue)
    }
}

use clap::Parser;

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
struct Cli {
    /// Input image path
    #[arg(short, long)]
    input: String,

    /// Output image path
    #[arg(short, long)]
    output: String,

    #[arg(short, long)]
    theme: String,

    #[arg(short, long)]
    debug: bool,
}

fn calculate_weighted_average_hue(colors: &[(f32, f32)]) -> f32 {
    let mut sin_sum = 0.0;
    let mut cos_sum = 0.0;
    let mut total_weight = 0.0;

    for &(hue, weight) in colors {
        let angle = hue.to_radians();
        sin_sum += angle.sin() * weight;
        cos_sum += angle.cos() * weight;
        total_weight += weight;
    }

    if total_weight == 0.0 {
        return 0.0;
    }

    let avg_angle = f32::atan2(sin_sum / total_weight, cos_sum / total_weight);
    let mut degrees = avg_angle.to_degrees();
    if degrees < 0.0 {
        degrees += 360.0;
    }
    degrees
}

fn main() -> anyhow::Result<()> {
    let cli = Cli::parse();
    let theme = dirs::home_dir()
        .unwrap()
        .join("dotfiles")
        .join("profiles")
        .join("themes")
        .join(format!("{}.toml", cli.theme));

    let theme = fs::read_to_string(theme)?;
    let theme: Base16 = toml::from_str(&theme)?;
    if cli.debug {
        println!("{:?}", theme);
    }

    let img = image::open(&cli.input)?;
    let (width, height) = img.dimensions();

    let pixels: Vec<_> = img.pixels().map(|p| (p.2[0], p.2[1], p.2[2])).collect();
    
    // Calculate weighted average hue for image pixels
    let img_colors: Vec<_> = pixels
        .into_iter()
        .map(Color::new)
        .map(|c| (c.hue(), c.saturation()))
        .collect();
    
    let avg_img_hue = calculate_weighted_average_hue(&img_colors);

    let base16_theme = vec![
        hex_to_rgb(&theme.base00),
        hex_to_rgb(&theme.base01),
        hex_to_rgb(&theme.base02),
        hex_to_rgb(&theme.base03),
        hex_to_rgb(&theme.base04),
        hex_to_rgb(&theme.base05),
        hex_to_rgb(&theme.base06),
        hex_to_rgb(&theme.base07),
        hex_to_rgb(&theme.base08),
        hex_to_rgb(&theme.base09),
        hex_to_rgb(&theme.base_0a),
        hex_to_rgb(&theme.base_0b),
        hex_to_rgb(&theme.base_0c),
        hex_to_rgb(&theme.base_0d),
        hex_to_rgb(&theme.base_0e),
        hex_to_rgb(&theme.base_0f),
    ];

    // Calculate weighted average hue for theme colors
    let theme_colors: Vec<_> = base16_theme
        .into_iter()
        .map(Color::new)
        .map(|c| (c.hue(), c.saturation()))
        .collect();
    
    let avg_theme_hue = calculate_weighted_average_hue(&theme_colors);

    let mut delta_hue = avg_theme_hue - avg_img_hue;
    if delta_hue > 180.0 {
        delta_hue -= 360.0;
    }

    if delta_hue < -180.0 {
        delta_hue += 360.0;
    }

    if cli.debug {
        println!("Average theme hue: {}", avg_theme_hue);
        println!("Average image hue: {}", avg_img_hue);
        println!("Delta hue: {}", delta_hue);
    }

    let new_img = ImageBuffer::from_fn(width, height, |x, y| {
        let px = img.get_pixel(x, y);
        let rgb = (px[0], px[1], px[2]);
        let rgb = Color::new(rgb);
        let shifted = rgb.rotate_hue(delta_hue);
        let (r, g, b) = shifted.rgb_u8();
        image::Rgb([r, g, b])
    });

    new_img.save(&cli.output)?;
    Ok(())
}

fn hex_to_rgb(hex: &str) -> (u8, u8, u8) {
    let hex = hex.trim_start_matches('#');
    let r = u8::from_str_radix(&hex[0..2], 16).unwrap();
    let g = u8::from_str_radix(&hex[2..4], 16).unwrap();
    let b = u8::from_str_radix(&hex[4..6], 16).unwrap();
    (r, g, b)
}