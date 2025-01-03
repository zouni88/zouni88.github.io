package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
	"time"
)

var proxyip = "http://proxy-zouni88:qaz521@150.109.172.165:6006"
var domain = "https://api.ip.cc/en"

func main() {

	u, _ := url.Parse(proxyip)
	t := &http.Transport{
		MaxIdleConns:    10,
		MaxConnsPerHost: 10,
		IdleConnTimeout: time.Duration(10) * time.Second,
		//Proxy: http.ProxyURL(url),
		Proxy: http.ProxyURL(u),
	}
	c := &http.Client{
		Transport: t,
		Timeout:   time.Duration(10) * time.Second,
	}
	reqest, err := http.NewRequest("GET", domain, nil)
	if err != nil {
		panic(err)
	}
	response, err := c.Do(reqest)
	if err != nil {
		panic(err)
	}
	defer response.Body.Close()
	res, err := ioutil.ReadAll(response.Body)
	if err != nil {
		panic(err)
	}
	fmt.Println(string(res))

}
