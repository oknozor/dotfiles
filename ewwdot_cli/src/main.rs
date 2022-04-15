use crate::event::{Change, WorkSpace, WorkspaceEvent};
use crate::sway::{sway_windows, sway_workspace};
use clap::Parser;
mod event;
mod eww;
mod sway;

#[derive(Parser)]
#[clap(name = "ewwdot", author = "Paul D. <paul.delafosse@protonmail.com>")]
struct Cli {
    /// Which window manager should the cli listen to
    #[clap(
        short,
        long = "window-manager",
        value_name = "Window Manager",
        possible_values = ["sway", "i3"]
    )]
    wm: String,

    /// The kind of Wm event to listen to, window will simply output the currently focused 'window', 'workspace'
    /// send an eww representation of the workspace layout
    #[clap(
        short,
        long = "event",
        value_name = "Event",
        possible_values = ["window", "workspace"]
    )]
    event: String,
}

enum Wm {
    Sway,
    I3,
}

impl Wm {
    fn listen(&self, event_type: Event) -> anyhow::Result<()> {
        match self {
            Wm::Sway => match event_type {
                Event::Window => sway_windows(),
                Event::Workspace => sway_workspace(),
            },
            Wm::I3 => todo!(),
        }
    }
}

impl From<&str> for Wm {
    fn from(arg: &str) -> Self {
        match arg {
            "i3" => Wm::I3,
            "sway" => Wm::Sway,
            _ => unreachable!(),
        }
    }
}

enum Event {
    Window,
    Workspace,
}

impl From<&str> for Event {
    fn from(arg: &str) -> Self {
        match arg {
            "window" => Event::Window,
            "workspace" => Event::Workspace,
            _ => unreachable!(),
        }
    }
}

fn main() -> anyhow::Result<()> {
    let cli = Cli::parse();
    let wm = Wm::from(cli.wm.as_str());
    let event = Event::from(cli.event.as_str());
    wm.listen(event)
}
