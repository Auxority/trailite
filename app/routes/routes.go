package routes

import (
	"github.com/Auxority/trailite/handlers"
	"github.com/Auxority/trailite/middleware"
	"github.com/gofiber/fiber/v2"
)

func Setup(app *fiber.App) {
	app.Use(middleware.RequestLogger())

	app.Get("/", handlers.Home)
	app.Get("/ping", handlers.Ping)
}
