import express from "express";
import pool from "../config";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.json());

const getMovies = (request, response) => {
  pool.query("SELECT * FROM movies", (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
};

const addMovie = (request, response) => {
  const { title } = request.body;

  pool.query("INSERT INTO movies (title) VALUES ($1)", [title], (error) => {
    if (error) {
      throw error;
    }
    response.status(201).json({ status: "success", message: "Movie added." });
  });
};

app
  .route("/movies")
  // GET endpoint
  .get(getMovies)
  // POST endpoint
  .post(addMovie);

// Start server
app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening`);
});
