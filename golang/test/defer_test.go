package main

import (
	"log"
	"testing"
)

func TestDefer(t *testing.T) {
	defer log.Println("第一个")
	defer log.Println("第二个")
	defer log.Println("第三个")

	panic("恐慌开始了")

}
