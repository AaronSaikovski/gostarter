package testing

/*
A Sample test harness.
*/

import (
	"testing"

	"github.com/AaronSaikovski/gostarter/internal/pkg/samplemodule"
)

// A testing function.
func TestSampleFunction(t *testing.T) {

	msg := samplemodule.SampleFunction()
	expected := "O1K"

	if msg != expected {
		t.Errorf("Module expected '%q' but got '%q'", expected, msg)
	}
}
