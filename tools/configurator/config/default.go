package config

import "github.com/pelletier/go-toml/v2"

func Default() Server {
	tomlBs := []byte(defaultTomlConfig)

	var cfg Server

	if err := toml.Unmarshal(tomlBs, &cfg); err != nil {
		panic(err)
	}

	return cfg
}

var defaultTomlConfig = `
name = "My server name"
host = "0.0.0.0"
port = 7788
players = 256
password = "mySecretPassword"
announce = true
token = "superSecretToken"
gamemode = "Freeroam"
website = "example.com"
language = "English"
description = "My cool server"
debug = false
streamingDistance = 400
migrationDistance = 150
timeout = 1
announceRetryErrorDelay = 10000
announceRetryErrorAttempts = 50
duplicatePlayers = 4096

mapBoundsMinX = 10000
mapBoundsMinY = 10000
mapBoundsMaxX = 65536
mapBoundsMaxY = 65536
mapCellAreaSize = 100

colShapeTickRate = 200

logStreams = [ "console", "file" ]

entityWorkerCount = 8

tags = [
    "Freeroam",
    "Cool"
]

connectionQueue = false
useEarlyAuth = false
earlyAuthUrl = "https://example.com/login"
useCdn = false
cdnUrl = "https://cdn.example.com"

sendPlayerNames = true

resources = [
    "myResource",
    "vehicles/firstVehicle",
    "vehicles/secondVehicle"
]

modules = [
    "js-module",
    "csharp-module"
]

[worldProfiler]
port = 7797
host = "0.0.0.0"

[js-module]
source-maps = true
heap-profiler = true
profiler = true
global-fetch = true
global-webcrypto = true
network-imports = true
extra-cli-args = ["--inspect=127.0.0.1:9229", "--max-old-space-size=8192"]
[js-module.inspector]
host = "127.0.0.1"
port = 9229

[csharp-module]
disableDependencyDownload= true

[voice]
bitrate = 64000
externalSecret = "1234567890"
externalHost = "127.0.0.1"
externalPort = 7798
externalPublicHost = "xx.xx.xx.xx"
externalPublicPort = 7799
`
