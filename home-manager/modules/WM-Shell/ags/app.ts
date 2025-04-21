import { App } from "astal/gtk4"
import style from "./style.scss"
import Time from "./widget/Time"
import Workspaces from "./widget/Workspaces"

App.start({
    css: style,
    main() {
        // App.get_monitors().map(Time, Workspaces)
    },
})
