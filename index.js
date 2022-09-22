import * as dotenv from "dotenv"; 
dotenv.config();

import express from "express";
import cors from "cors";

import router from "./routes/index.js";

const app = express();

// MiddleWares
app.use(cors());
app.use(express.json());

// Routes
app.use("/api", router);

app.listen(process.env.API_PORT, () =>
  console.log(`Server on port`, process.env.API_PORT)
);
