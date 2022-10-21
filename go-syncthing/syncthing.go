// filename: syncthing.go
package main

import "C"

//export GetDeviceId
func GetDeviceId() *C.char {
    theKey := "123-456-789"
    return C.CString(theKey)
}

func main() {}  