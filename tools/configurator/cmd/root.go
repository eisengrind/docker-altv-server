/*
Copyright © 2022 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
	"fmt"
	"github.com/caarlos0/env/v6"
	"github.com/eisengrind/docker-altv-server/tools/configurator/config"
	"github.com/pelletier/go-toml/v2"
	"gopkg.in/yaml.v2"
	"io/ioutil"
	"log"
	"os"

	"github.com/spf13/cobra"
)

const envPrefix = "ALTV_SERVER_"

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "configurator",
	Short: "Creates an alt:V config file from environment vars",
	Run: func(cmd *cobra.Command, args []string) {
		outputFilename, err := cmd.Flags().GetString("output-filename")
		if err != nil {
			log.Fatalln(err)
		}

		outputType, err := cmd.Flags().GetString("output-type")
		if err != nil {
			log.Fatalln(err)
		}

		if outputType != "yaml" && outputType != "toml" {
			log.Fatalln("invalid output type provided")
		}

		var cfg config.Server
		if err := env.Parse(&cfg, env.Options{
			Prefix: envPrefix,
		}); err != nil {
			log.Fatalln(err)
		}

		var bs []byte

		switch outputType {
		case "yaml":
			bs, err = yaml.Marshal(cfg)
			if err != nil {
				log.Fatalln(err)
			}
		case "toml":
			bs, err = toml.Marshal(cfg)
			if err != nil {
				log.Fatalln(err)
			}
		}

		if err := ioutil.WriteFile(fmt.Sprintf("%s.%s", outputFilename, outputType), bs, 0770); err != nil {
			log.Fatalln(err)
		}
	},
}

// Execute adds all child commands to the root command and sets flags appropriately.
// This is called by main.main(). It only needs to happen once to the rootCmd.
func Execute() {
	err := rootCmd.Execute()
	if err != nil {
		os.Exit(1)
	}
}

func init() {
	rootCmd.Flags().String("output-filename", "server", "Output filename")
	rootCmd.Flags().String("output-type", "yaml", "Output format of the config file. Can be 'yaml' or 'toml'")
}
