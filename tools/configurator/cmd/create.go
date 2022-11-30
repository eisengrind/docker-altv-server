package cmd

import (
	"github.com/eisengrind/docker-altv-server/tools/configurator/config"
	"github.com/spf13/cobra"
	"log"
)

// createCmd represents the create command
var createCmd = &cobra.Command{
	Use:   "create",
	Short: "Creates an alt:V config file using environment variables.",
	Run: func(cmd *cobra.Command, args []string) {
		output, err := cmd.Flags().GetString("output")
		if err != nil {
			log.Fatalln(err)
		}

		cfg, err := config.ParseEnv(envPrefix)
		if err != nil {
			log.Fatalln(err)
		}

		if err := config.Write(output, cfg); err != nil {
			log.Fatalln(err)
		}
	},
}

func init() {
	rootCmd.AddCommand(createCmd)
}
