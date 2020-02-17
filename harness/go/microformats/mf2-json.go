package main

import (
	"encoding/json"
	"io"
	"net/url"
	"os"
	"willnorris.com/go/microformats"
)

func main() {
	var r io.Reader
	r, _ = os.Open(os.Args[1])
	u, _ := url.Parse(os.Args[2])

	var data *microformats.Data
	data = microformats.Parse(r, u)

	enc := json.NewEncoder(os.Stdout)
	enc.SetEscapeHTML(false)
	enc.SetIndent("", "  ")
	enc.Encode(data)
}
