package main

import (
	"fmt"
	"os"

	"github.com/AaronSaikovski/gostarter/internal/pkg/samplemodule"
	"github.com/AaronSaikovski/gostarter/internal/pkg/utils"
	"github.com/logrusorgru/aurora"

	"github.com/AaronSaikovski/gostarter/internal/app/constants"
	"github.com/AaronSaikovski/gostarter/internal/app/types"
)

// run - main run method
func run() error {

	fmt.Println(aurora.BrightGreen(string("This is the main function.\n")))

	for i := 0; i < constants.LoopConstant; i++ {
		fmt.Printf("print using loop const \n")
	}

	samplemodule.SampleFunction()

	fmt.Print(types.Sample{SampleString: "hello from struct", SampleInt: 1})

	return nil
}

// main - program main
func main() {
	if err := run(); err != nil {
		utils.HandleError(err)
		os.Exit(1)
	}
}
