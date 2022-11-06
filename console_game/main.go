package main

import (
	"console_game/helper"
	"fmt"
)

var holeLength, healthBar, respect, weight float64 = 10, 100, 20, 30

func main() {

	creature := helper.New(holeLength, healthBar, respect, weight)

	for {
		fmt.Println("--------------DAY---------------")
		creature.DoDay()
		fmt.Println("--------------NIGHT---------------")
		creature.DoNight()
		fmt.Printf("holeLength %v healthBar  %v respect  %v weight  %v\n",
			creature.HoleLength,
			creature.HealthBar,
			creature.Respect,
			creature.Weight)
		if creature.HoleLength == 0 || creature.HealthBar == 0 || creature.Respect == 0 || creature.Weight == 0 {
			fmt.Println("Defeat")
			break
		}
		if creature.Respect > 100 {
			fmt.Println("Victory")
			break
		}
	}
}
