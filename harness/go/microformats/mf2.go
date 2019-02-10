package main

import (
	"willnorris.com/go/microformats"
	"os"
	"io"
	"net/url"
//	"encoding/json"
	"time"
	"fmt"
	"reflect"
)

func clear(v interface{}) {
    p := reflect.ValueOf(v).Elem()
    p.Set(reflect.Zero(p.Type()))
}

func main() {
	var r io.Reader
	r, _ = os.Open(os.Args[1])
	u, _ := url.Parse(os.Args[2])
	
	//for idx := 0; idx < 10; idx++ {
		start := time.Now()
		_ = microformats.Parse(r, u)
		elapsed := time.Now().Sub(start)
		fmt.Println(elapsed.Nanoseconds() / 1000)
	//}
	
	
	/*
	var data *microformats.Data
	data = microformats.Parse(r, u)

	enc := json.NewEncoder(os.Stdout)
	enc.SetEscapeHTML(false)
	enc.SetIndent("", "  ")
	enc.Encode(data)	
	*/
}
