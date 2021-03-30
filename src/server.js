import express from "express";
import { pool } from "../config";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.json());

const getGroupId = async (firebase_id) => {
  return await pool
    .query(
      "SELECT mg.id FROM movie_groups mg LEFT JOIN movie_group_members mgm on mgm.group_id = mg.id LEFT JOIN users u on mgm.user_id = u.id WHERE u.firebase_id = " +
        firebase_id
    )
    .then((result) => {
      return result.rows[0].id;
    })
    .catch((err) => {
      throw err;
    });
};

const getMovies = async (request, response) => {
  var groupId = await getGroupId("'id'").catch((err) => {
    throw err;
  });
  console.log(groupId);
  pool.query(
    "SELECT * FROM movies WHERE group_id = " + groupId,
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).json(results.rows);
    }
  );
};

const getIMDBMovies = (request, response) => {
  pool.query("SELECT * FROM imdb_movies", (error, results) => {
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
