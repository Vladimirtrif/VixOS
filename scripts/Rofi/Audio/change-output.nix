{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "change-audio-output-rofi";
  runtimeInputs = with pkgs; [
    rofi-wayland
    pipewire
    jq
    #gawk
    pulseaudio
  ];
  text = ''
    CHOSEN=$(pw-dump |\
             jq -r '.[] | select(.info.props."media.class" == "Audio/Sink") | "\(.id) - \(.info.props."node.description")"' |\
             rofi -dmenu -i -p "Change Audio Output")

    if [ -z "$CHOSEN" ]; then
      exit 0
    fi

    SINK_ID=$(echo "$CHOSEN" | awk '{print $1}')

    wpctl set-default "$SINK_ID"

    NODE_NAME=$(pw-dump | jq -r --arg id "$SINK_ID" '.[] | select(.id == ($id|tonumber)) | .info.props."node.name"')

    # Move all currently playing streams (The "Force" move)
    pactl list short sink-inputs | awk '{print $1}' | while read -r STREAM_ID; do
        pactl move-sink-input "$STREAM_ID" "$NODE_NAME" || true
    done
  '';
}
