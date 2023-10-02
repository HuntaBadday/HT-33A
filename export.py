import json
import os

# Make sure to set the path correctly
# Linux
filepath = "/home/$USER/.steam/steam/steamapps/workshop/content/387990/2817316401/data.json"

# Windows
#filepath = r"C:\Program Files (x86)\Steam\steamapps\workshop\content\387990\2817316401\data.json"

# ================================================================

fileread = b""

with open("data.bin", "rb") as f:
    fileread = f.read()

output = []
counter = 0
for i in range(0, len(fileread), 2):
    output.append([counter, (fileread[i]<<8)|fileread[i+1]])
    counter += 1

with open(os.path.expandvars(filepath), "w") as f:
    json.dump(output, f)
print("Finished exporting!")
print(json.dumps(output))