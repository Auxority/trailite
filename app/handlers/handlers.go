package handlers

import "github.com/gofiber/fiber/v2"

func Home(c *fiber.Ctx) error {
	return c.SendString("Welcome to Trailite!")
}

func Ping(c *fiber.Ctx) error {
	return c.SendString("Pong!")
}
