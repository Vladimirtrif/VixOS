{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "change-audio-input-rofi";
  runtimeInputs = with pkgs; [
    rofi-wayland
    pipewire
    jq
    pulseaudio
  ];
  text = ''
    CHOSEN=$(pw-dump |\
             jq -r '.[] | select(.info.props."media.class" == "Audio/Source") | "\(.id) - \(.info.props."node.description")"' |\
             rofi -dmenu -i)

    if [ -z "$CHOSEN" ]; then
      exit 0
    fi

    SINK_ID=$(echo "$CHOSEN" | awk '{print $1}')

    wpctl set-default "$SINK_ID"

    NODE_NAME=$(pw-dump | jq -r --arg id "$SINK_ID" '.[] | select(.id == ($id|tonumber)) | .info.props."node.name"')

    # Move all currently playing streams (The "Force" move)
    pactl list short source-outputs | awk '{print $1}' | while read -r STREAM_ID; do
        pactl move-source-output "$STREAM_ID" "$NODE_NAME" || true
    done
  '';
}
