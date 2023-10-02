import json

filepath = "/home/Hunter/.steam/steam/steamapps/workshop/content/387990/2817316401/data.json"

fileread = b""

with open("data.bin", "rb") as f:
    fileread = f.read()

output = []
counter = 0
for i in range(0, len(fileread), 2):
    output.append([counter, (fileread[i]<<8)|fileread[i+1]])
    counter += 1

with open(filepath, "w") as f:
    json.dump(output, f)
print("Finished exporting!")
print(json.dumps(output))