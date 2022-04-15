use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct WorkspaceEvent {
    pub(crate) change: Change,
    pub(crate) current: WorkSpace,
    pub(crate) old: Option<WorkSpace>,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all(deserialize = "lowercase"))]
pub enum Change {
    Init,
    Focus,
    Title,
    Empty,
    New,
    Close,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct WorkSpace {
    pub num: i32,
    pub nodes: Vec<WorkSpaceNode>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct WorkSpaceNode {
    pub name: Option<String>,
    pub representation: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct WindowEvent {
    pub(crate) change: Change,
    pub container: Window
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Window {
    pub name: Option<String>,
    pub focused: bool,
}
