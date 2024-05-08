package main

import (
	"github.com/Auxority/trailite/routes"
	"github.com/gofiber/fiber/v2"
)

func main() {
	app := fiber.New()

	routes.Setup(app)

	err := app.Listen(":3000")
	if err != nil {
		panic(err)
	}
}
