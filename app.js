require("dotenv").config();
const express = require("express");
// const logger = require("morgan");
const bodyParser = require("body-parser");
const router = require("./src/Routes/index");
const app = express();
const cors = require("cors");

const port = process.env.PORT || 8000;
app.listen(port, () => {
  // console.log("Server is Running ...\nPort:", port);
  console.log("Magic happen on port:", port);
});
app.use(cors());
// app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use("/", router);

module.exports = app;
