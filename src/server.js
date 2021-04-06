import express from "express";
import { pool } from "../config";
import cors from "cors";
import { index } from "./get/index";
import { getMovies } from "./get/movies";
import { getUserInfo } from "./post/users";
import { addMovie, markSeen } from "./post/movies";

const app = express();
app.use(cors());
app.use(express.json());

app.route("/").get(index);
app.route("/api/(:groupId)/movies").get(getMovies);

app.route("/api/user-info").post(getUserInfo);
app.route("/api/movies/add").post(addMovie);
app.route("/api/movies/seen").post(markSeen);

// Start server
app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening`);
});
