import { App } from "astal/gtk4"
import style from "./style.scss"
import TopBar from "./widget/TopBar"

App.start({
    css: style,
    main() {
        App.get_monitors().map(TopBar)
    },
})
