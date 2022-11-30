package config

import "github.com/caarlos0/env/v6"

func ParseEnv(prefix string) (Server, error) {
	var cfg Server

	if err := env.Parse(&cfg, env.Options{
		Prefix: prefix,
	}); err != nil {
		return cfg, err
	}

	return cfg, nil
}
