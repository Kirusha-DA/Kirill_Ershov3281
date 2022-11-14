package helper

import (
	"fmt"
	"math/rand"
)

type creature struct {
	HoleLength, HealthBar, Respect, Weight float64
}

func New(holeLength, healthBar, respect, weight float64) *creature {
	return &creature{holeLength,
		healthBar,
		respect,
		weight}
}

func (c *creature) DoNight() {
	c.HoleLength -= 2
	c.HealthBar += 20
	c.Respect -= 2
	c.Weight -= 5
}

func (c *creature) DoDay() {
	fmt.Print("Choose:\n" +
		"1 : Dig the hole\n" +
		"2 : Eat a grass\n" +
		"3 : Fight\n" +
		"4 : Sleep\n" +
		"Type here: ")
	var playerInput int64
	fmt.Scan(&playerInput)
	switch playerInput {
	case 1:
		c.dig(playerInput)
	case 2:
		c.eat(playerInput)
	case 3:
		c.fight(playerInput)
	case 4:
		c.sleep()
	}
}

func (c *creature) dig(playerInput int64) {
	fmt.Print("Choose:\n" +
		"1 Intensively\n" +
		"2 Lasily\n" +
		"Type here: ")
	fmt.Scan(&playerInput)
	switch playerInput {
	case 1:
		c.HoleLength += 5
		c.HealthBar -= 30
	case 2:
		c.HoleLength += 2
		c.HealthBar -= 10
	}
}

func (c *creature) eat(playerInput int64) {
	fmt.Print("Choose:\n" +
		"1 Withered\n" +
		"2 Green\n" +
		"Type here: ")
	fmt.Scan(&playerInput)
	switch playerInput {
	case 1:
		c.HealthBar += 10
		c.Weight += 15
	case 2:
		if c.Respect >= 30 {
			c.HealthBar += 30
			c.Weight += 30
		} else {
			c.HealthBar -= 30
		}
	}
}

func (c *creature) fight(playerInput int64) {
	var enemyWeight float64
	var winP float64
	fmt.Print("Choose your enemy:\n" +
		"1 Weak\n" +
		"2 Avarage\n" +
		"3 Strong\n" +
		"Type here: ")
	fmt.Scan(&playerInput)
	switch playerInput {
	case 1:
		enemyWeight = 30
		winP = c.Weight / (c.Weight + enemyWeight)
	case 2:
		enemyWeight = 50
		winP = c.Weight / (c.Weight + enemyWeight)
	case 3:
		enemyWeight = 70
		winP = c.Weight / (c.Weight + enemyWeight)
	}
	randPoint := rand.Float64()
	if 0 < randPoint && randPoint <= winP {
		fmt.Println("You lost")
	} else {
		fmt.Println("You won")
		if c.Weight < enemyWeight {
			c.Respect += 40
			c.HealthBar -= 40
		} else if c.Weight == enemyWeight {
			c.Respect += 20
			c.HealthBar -= 20
		} else {
			c.Respect += 10
			c.HealthBar -= 10
		}
	}

}

func (c *creature) sleep() {
	c.HoleLength -= 2
	c.HealthBar += 20
	c.Respect -= 2
	c.Weight -= 5
}
