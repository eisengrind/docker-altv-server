package cmd

import (
	"os"

	"github.com/spf13/cobra"
)

const envPrefix = "ALTV_SERVER_"

// rootCmd represents the base command when called without any subcommands
var rootCmd = &cobra.Command{
	Use:   "configurator",
	Short: "Allows for creation of an alt:V config file using ENV args or just an example config.",
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
	rootCmd.PersistentFlags().StringP("output", "o", "server.yaml", "Output filename. Only .yml, .yaml, .cfg, .toml file extension can be specified.")
}
