package config

type WorldProfiler struct {
	Host *string `env:"HOST" toml:"host" yaml:"host,omitempty" json:"host,omitempty"`
	Port *uint16 `env:"PORT" toml:"port" yaml:"port,omitempty" json:"port,omitempty"`
}

type JsModuleInspector struct {
	Host *string `env:"HOST" toml:"host" yaml:"host,omitempty" json:"host,omitempty"`
	Port *uint16 `env:"PORT" toml:"port" yaml:"port,omitempty" json:"port,omitempty"`
}

type JsModule struct {
	SourceMaps      *bool             `env:"SOURCE_MAPS" toml:"source-maps" yaml:"sourceMaps,omitempty" json:"sourceMaps,omitempty"`
	HeapProfiler    *bool             `env:"HEAP_PROFILER" toml:"heap-profiler" yaml:"heapProfiler,omitempty" json:"heapProfiler,omitempty"`
	Profiler        *bool             `env:"PROFILER" toml:"profiler" yaml:"profiler,omitempty" json:"profiler,omitempty"`
	GlobalFetch     *bool             `env:"GLOBAL_FETCH" toml:"global-fetch" yaml:"globalFetch,omitempty" json:"globalFetch,omitempty"`
	GlobalWebCrypto *bool             `env:"GLOBAL_WEB_CRYPTO" toml:"global-webcrypto" yaml:"globalWebcrypto,omitempty" json:"globalWebcrypto,omitempty"`
	NetworkImports  *bool             `env:"NETWORK_IMPORTS" toml:"network-imports" yaml:"networkImports,omitempty" json:"networkImports,omitempty"`
	ExtraCliArgs    []string          `env:"EXTRA_CLI_ARGS" toml:"extra-cli-args" yaml:"extraCliArgs,omitempty,flow" json:"extraCliArgs,omitempty"`
	Inspector       JsModuleInspector `envPrefix:"INSPECTOR_" toml:"inspector,omitempty" yaml:"inspector,omitempty" json:"inspector,omitempty"`
}

type CsharpModule struct {
	DisableDependencyDownload *bool `env:"DISABLE_DEPENDENCY_DOWNLOAD" toml:"disableDependencyDownload" yaml:"disableDependencyDownload,omitempty" json:"disableDependencyDownload,omitempty"`
}

type Voice struct {
	Bitrate            *uint   `env:"BITRATE" toml:"bitrate" yaml:"bitrate,omitempty" json:"bitrate,omitempty"`
	ExternalSecret     *string `env:"EXTERNAL_SECRET" toml:"externalSecret" yaml:"externalSecret,omitempty" json:"externalSecret,omitempty"`
	ExternalHost       *string `env:"EXTERNAL_HOST" toml:"externalHost" yaml:"externalHost,omitempty" json:"externalHost,omitempty"`
	ExternalPort       *uint16 `env:"EXTERNAL_PORT" toml:"externalPort" yaml:"externalPort,omitempty" json:"externalPort,omitempty"`
	ExternalPublicHost *string `env:"EXTERNAL_PUBLIC_HOST" toml:"externalPublicHost" yaml:"externalPublicHost,omitempty" json:"externalPublicHost,omitempty"`
	ExternalPublicPort *uint16 `env:"EXTERNAL_PUBLIC_PORT" toml:"externalPublicPort" yaml:"externalPublicPort,omitempty" json:"externalPublicPort,omitempty"`
}

type Server struct {
	Name                       *string `env:"NAME" toml:"name" yaml:"name,omitempty" json:"name,omitempty"`
	Host                       *string `env:"HOST" toml:"host" yaml:"host,omitempty" json:"host,omitempty"`
	Port                       *uint16 `env:"PORT" toml:"port" yaml:"port,omitempty" json:"port,omitempty"`
	Players                    *uint   `env:"PLAYERS" toml:"players" yaml:"players,omitempty" json:"players,omitempty"`
	Password                   *string `env:"PASSWORD" toml:"password" yaml:"password,omitempty" json:"password,omitempty"`
	Announce                   *bool   `env:"ANNOUNCE" toml:"announce" yaml:"announce,omitempty" json:"announce,omitempty"`
	Token                      *string `env:"TOKEN" toml:"token" yaml:"token,omitempty" json:"token,omitempty"`
	Gamemode                   *string `env:"GAMEMODE" toml:"gamemode" yaml:"gamemode,omitempty" json:"gamemode,omitempty"`
	Website                    *string `env:"WEBSITE" toml:"website" yaml:"website,omitempty" json:"website,omitempty"`
	Language                   *string `env:"LANGUAGE" toml:"language" yaml:"language,omitempty" json:"language,omitempty"`
	Description                *string `env:"DESCRIPTION" toml:"description" yaml:"description,omitempty" json:"description,omitempty"`
	Debug                      *bool   `env:"DEBUG" toml:"debug" yaml:"debug,omitempty" json:"debug,omitempty"`
	StreamingDistance          *uint   `env:"STREAMING_DISTANCE" toml:"streamingDistance" yaml:"streamingDistance,omitempty" json:"streamingDistance,omitempty"`
	MigrationDistance          *uint   `env:"MIGRATION_DISTANCE" toml:"migrationDistance" yaml:"migrationDistance,omitempty" json:"migrationDistance,omitempty"`
	Timeout                    *uint   `env:"TIMEOUT" toml:"timeout" yaml:"timeout,omitempty" json:"timeout,omitempty"`
	AnnounceRetryErrorDelay    *uint   `env:"ANNOUNCE_RETRY_ERROR_DELAY" toml:"announceRetryErrorDelay" yaml:"announceRetryErrorDelay,omitempty" json:"announceRetryErrorDelay,omitempty"`
	AnnounceRetryErrorAttempts *uint   `env:"ANNOUNCE_RETRY_ERROR_ATTEMPTS" toml:"announceRetryErrorAttempts" yaml:"announceRetryErrorAttempts,omitempty" json:"announceRetryErrorAttempts,omitempty"`
	DuplicatePlayers           *uint   `env:"DUPLICATE_PLAYERS" toml:"duplicatePlayers" yaml:"duplicatePlayers,omitempty" json:"duplicatePlayers,omitempty"`

	MapBoundsMinX *uint `env:"MAP_BOUNDS_MIN_X" toml:"mapBoundsMinX" yaml:"mapBoundsMinX,omitempty" json:"mapBoundsMinX,omitempty"`
	MapBoundsMinY *uint `env:"MAP_BOUNDS_MIN_Y" toml:"mapBoundsMinY" yaml:"mapBoundsMinY,omitempty" json:"mapBoundsMinY,omitempty"`
	MapBoundsMaxX *uint `env:"MAP_BOUNDS_MAX_X" toml:"mapBoundsMaxX" yaml:"mapBoundsMaxX,omitempty" json:"mapBoundsMaxX,omitempty"`
	MapBoundsMaxY *uint `env:"MAP_BOUNDS_MAX_Y" toml:"mapBoundsMaxY" yaml:"mapBoundsMaxY,omitempty" json:"mapBoundsMaxY,omitempty"`

	ColShapeTickRate  *uint         `env:"COL_SHAPE_TICK_RATE" toml:"colShapeTickRate" yaml:"colShapeTickRate,omitempty" json:"colShapeTickRate,omitempty"`
	LogStreams        []string      `env:"LOG_STREAMS" toml:"logStreams" yaml:"logStreams,omitempty,flow" json:"logStreams,omitempty,flow"`
	EntityWorkerCount *uint         `env:"ENTITY_WORKER_COUNT" toml:"entityWorkerCount" yaml:"entityWorkerCount,omitempty" json:"entityWorkerCount,omitempty"`
	Tags              []string      `env:"TAGS" toml:"tags" yaml:"tags,omitempty,flow" json:"tags,omitempty,flow"`
	ConnectionQueue   *bool         `env:"CONNECTION_QUEUE" toml:"connectionQueue" yaml:"connectionQueue,omitempty" json:"connectionQueue,omitempty"`
	UseEarlyAuth      *bool         `env:"USE_EARLY_AUTH" toml:"useEarlyAuth" yaml:"useEarlyAuth,omitempty" json:"useEarlyAuth,omitempty"`
	EarlyAuthUrl      *string       `env:"EARLY_AUTH_URL" toml:"earlyAuthUrl" yaml:"earlyAuthUrl,omitempty" json:"earlyAuthUrl,omitempty"`
	UseCDN            *bool         `env:"USE_CDN" toml:"useCdn" yaml:"useCdn,omitempty" json:"useCdn,omitempty"`
	CDNUrl            *string       `env:"CDN_URL" toml:"cdnUrl" yaml:"cdnUrl,omitempty" json:"cdnUrl,omitempty"`
	SendPlayerNames   *bool         `env:"SEND_PLAYER_NAMES" toml:"sendPlayerNames" yaml:"sendPlayerNames,omitempty" json:"sendPlayerNames,omitempty"`
	Resources         []string      `env:"RESOURCES" toml:"resources" yaml:"resources,omitempty,flow" json:"resources,omitempty,flow"`
	Modules           []string      `env:"MODULES" toml:"modules" yaml:"modules,omitempty,flow" json:"modules,omitempty,flow"`
	WorldProfiler     WorldProfiler `envPrefix:"WORLD_PROFILER_" toml:"worldProfiler,omitempty" yaml:"worldProfiler,omitempty,flow" json:"worldProfiler,omitempty"`
	JsModule          JsModule      `envPrefix:"JS_MODULE_" toml:"js-module,omitempty" yaml:"jsModule,omitempty,flow" json:"jsModule,omitempty"`
	CsharpModule      CsharpModule  `envPrefix:"CSHARP_MODULE_" toml:"csharp-module,omitempty" yaml:"csharpModule,omitempty,flow" json:"csharpModule,omitempty"`
	Voice             Voice         `envPrefix:"VOICE_" toml:"voice,omitempty" yaml:"voice,omitempty,flow" json:"voice,omitempty"`
}
