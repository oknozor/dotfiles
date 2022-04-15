use crate::event::WorkSpace;

impl WorkSpace {
    pub fn to_yuck(&self, focus: bool) -> String {
        let class = if focus {
            "\"workspace focused\""
        } else {
            "\"workspace normal\""
        };

        format!(
            "(box :class \"workspace_box\" (workspace_icon :class {} :icon workspace_{}))",
            class, self.num
        )
    }
}
