package testing

/*
A Sample test harness.
*/

import (
	"github.com/AaronSaikovski/gostarter/cmd/gostarter"
	"testing"
)

// A testing function.
func TestConstant(t *testing.T) {

	expected := 10
	if LoopConstant != expected {
		t.Errorf("const expected '%d' but got '%d'", expected, LoopConstant)
	}
}
