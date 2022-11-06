package main

import (
	"fmt"
	"github.com/RyabovNick/databasecourse_2/golang/tasks/people_service/service/store"
)

func main() {
	conn := "postgresql://ershov:ershov@95.217.232.188:7777/ershov"
	s := store.NewStore(conn)
	fmt.Println(s.GetPeopleByID("400"))
	fmt.Println(s.ListPeople())
}
