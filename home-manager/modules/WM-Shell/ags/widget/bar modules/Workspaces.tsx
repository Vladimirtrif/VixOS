import { Gtk } from "astal/gtk4"
import { bind, Variable } from "astal"
import Hyprland from "gi://AstalHyprland"


function parseWorkspaces(): string {
    const hyprland = Hyprland.get_default()
    let result = ""
    hyprland.workspaces.sort((a, b) => a.id - b.id).forEach((ws) => {
        let icon: string = ""
        if (ws.id === hyprland.focusedWorkspace.id) {
            icon = ""
        }
        result += " " + ws.id + ": " + icon
    });
    return result
}

function checkEvent(name: string): boolean {
    return (name === "workspace" || name === "workspacev2"
        || name === "createworkspace" || name === "createworkspacev2"
        || name === "destroyworkspace" || name === "destroyworkspacev2")
}
export default function Workspaces(): Gtk.Widget {
    const hyprland = Hyprland.get_default()
    let workspaces = Variable(parseWorkspaces())
    // Connect to relevant signals that might update the workspace state
    //hyprland.connect("workspace-changed", () => { workspaces = parseWorkspaces() })
    hyprland.connect("event", (_, eventName, _1) => { if (checkEvent(eventName)) { workspaces.set(parseWorkspaces()) } })
    return <menubutton
        halign={Gtk.Align.CENTER}>
        <label label={workspaces()} />
    </menubutton>
}
