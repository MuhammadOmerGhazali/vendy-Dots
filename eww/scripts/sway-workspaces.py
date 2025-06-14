# #!/usr/bin/env python3
# # Original Author: Elkowar https://github.com/elkowar/dots-of-war/blob/master/eww-bar/.config/eww-bar/swayspaces.py

# import subprocess
# import json


# def get_workspaces():
#     output = subprocess.check_output(["swaymsg", "-t", "get_workspaces"])
#     return json.loads(output.decode("utf-8")) 


# def generate_workspace_data() -> dict:
#     data = {}
#     for wsp in get_workspaces():
#         if wsp["output"] not in data:
#             data[wsp["output"]] = []
#         i = { "name": wsp["name"],
#               "monitor": wsp["output"],
#               "focused": wsp["focused"],
#               "visible": wsp["visible"],
#             }
#         if wsp["focused"]:
#             i["class"] = "focused"
#             i["icon"] = ""
#         elif wsp["visible"]:
#             i["class"] = "visible"
#             i["icon"] = ""
#         else:
#             i["class"] = "hidden"
#             i["icon"] = ""
#         data[wsp["output"]].append(i)


#     return data


# if __name__ == "__main__":
#     process = subprocess.Popen(
#         ["swaymsg", "-t", "subscribe", "-m", '["workspace"]', "--raw"],
#         stdout=subprocess.PIPE,
#     )
#     if process.stdout is None:
#         print("Error: could not subscribe to sway events")
#         exit(1)
#     while True:
#         print(json.dumps(generate_workspace_data()), flush=True)
#         line = process.stdout.readline().decode("utf-8")
#         if line == "":
#             break


#!/usr/bin/env python3
# Modified from Elkowar's swayspaces.py for single-monitor EWW setup

import subprocess
import json


def get_workspaces():
    output = subprocess.check_output(["swaymsg", "-t", "get_workspaces"])
    return json.loads(output.decode("utf-8"))


def generate_workspace_data() -> list:
    data = []
    for wsp in get_workspaces():
        i = {
            "name": wsp["name"],
            "focused": wsp["focused"],
            # Optional fields for compatibility or future use
            "monitor": wsp["output"],
            "visible": wsp["visible"],
            "class": "focused" if wsp["focused"] else "visible" if wsp["visible"] else "hidden",
            "icon": "" if wsp["focused"] or wsp["visible"] else ""
        }
        data.append(i)
    return data


if __name__ == "__main__":
    process = subprocess.Popen(
        ["swaymsg", "-t", "subscribe", "-m", '["workspace"]', "--raw"],
        stdout=subprocess.PIPE,
    )
    if process.stdout is None:
        print("Error: could not subscribe to sway events")
        exit(1)
    while True:
        print(json.dumps(generate_workspace_data()), flush=True)
        line = process.stdout.readline().decode("utf-8")
        if line == "":
            break