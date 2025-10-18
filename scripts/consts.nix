let
  bat_dir = ''/sys/class/power_supply/BAT0'';
in
let
  bat_info = ''
    $(if [ -d ${bat_dir} ]; then
        printf %b "\n Battery: $(cat ${bat_dir}/capacity)%, $(cat ${bat_dir}/status)"
      fi)
  '';
in

{
  INFO = ''$(printf '%b' "Time: $(date +"%I:%M %p")\nDate: $(date +"%B %d, %Y")${bat_info}")'';
}
