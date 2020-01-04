const express = require("express");
const userController = require("../Controllers/user");
const verifyToken = require("../Configs/auth");

const Router = express.Router();

Router.post("/email", userController.getUserByEmail);
Router.post("/login", userController.loginUser);
Router.post("/register", userController.registerUser);
Router.post("/add", userController.addAdmin);

module.exports = Router;
