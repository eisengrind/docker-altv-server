package cmd

import (
	"github.com/eisengrind/docker-altv-server/tools/configurator/config"
	"github.com/spf13/cobra"
	"log"
)

// createExampleCmd represents the createExample command
var createExampleCmd = &cobra.Command{
	Use:   "createExample",
	Short: "Creates an example config file.",
	Run: func(cmd *cobra.Command, args []string) {
		output, err := cmd.Flags().GetString("output")
		if err != nil {
			log.Fatalln(err)
		}

		if err := config.Write(output, config.Default()); err != nil {
			log.Fatalln(err)
		}
	},
}

func init() {
	rootCmd.AddCommand(createExampleCmd)
}
