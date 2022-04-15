use std::collections::HashMap;

use anyhow::anyhow;
use ksway::{Client, IpcEvent};

use crate::{Change, WorkSpace, WorkspaceEvent};
use crate::event::WindowEvent;

pub fn sway_workspace() -> anyhow::Result<()> {
    let mut client = Client::connect().map_err(|err| anyhow!(err))?;

    let rx = client
        .subscribe(vec![IpcEvent::Workspace])
        .map_err(|err| anyhow!(err))?;

    let mut workspaces = HashMap::new();

    loop {
        while let Ok((payload_type, payload)) = rx.try_recv() {
            match payload_type {
                IpcEvent::Workspace => {
                    let payload: WorkspaceEvent = serde_json::from_slice(payload.as_slice())?;
                    let id = payload.current.num;
                    let change = payload.change;
                    let current = payload.current;

                    match change {
                        Change::Focus => {
                            workspaces.insert(id, current);
                        }
                        Change::Empty => {
                            workspaces.remove(&id);
                        }
                        _ => {}
                    }

                    let mut workspaces: Vec<&WorkSpace> = workspaces.values().collect();
                    workspaces.sort_by(|a, b| a.num.cmp(&b.num));
                    let yuck_workspaces = workspaces
                        .iter()
                        .map(|w| w.to_yuck(w.num == id))
                        .collect::<Vec<String>>()
                        .join(" ");

                    println!("(box {})", yuck_workspaces);
                }

                _ => {}
            }
        }
        client.poll().map_err(|err| anyhow!(err))?;
    }
}

pub fn sway_windows() -> anyhow::Result<()> {
    let mut client = Client::connect().map_err(|err| anyhow!(err))?;

    let rx = client
        .subscribe(vec![IpcEvent::Window])
        .map_err(|err| anyhow!(err))?;

    loop {
        while let Ok((payload_type, payload)) = rx.try_recv() {
            match payload_type {
                IpcEvent::Window => {
                    let payload: WindowEvent = serde_json::from_slice(payload.as_slice())?;
                    if let Some(name) = payload.container.name {
                        if payload.container.focused {
                            let name = if name.len() > 60 {
                                format!("{}...", &name[0..30])
                            } else {
                                name
                            };

                            println!("{}", name);
                        }
                    }
                }

                _ => {},
            }
        }
        client.poll().map_err(|err| anyhow!(err))?;
    }
}
