const express = require("express");
const app = express();
const fs = require("fs");

app.get("/", (req, res) => {
  const message = process.env.APP_MESSAGE || "Hello from EKS!";
  res.send(`Web App Running: ${message}`);
});

app.get("/config", (req, res) => {
  const config = fs.readFileSync("/config/app-config.txt", "utf8");
  res.send(`Config File Content: ${config}`);
});

app.listen(3000, () => console.log("App running on port 3000"));