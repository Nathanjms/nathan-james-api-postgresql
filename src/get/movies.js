import { pool } from "../../config";

const getMovies = (req, res) => {
  if (!req.params.groupId) {
    res.status(404).json("Group Not Found");
    return;
  }
  var groupId = req.params.groupId;
  pool.query(
    "SELECT * FROM movies WHERE group_id = " + groupId,
    (error, results) => {
      if (error) {
        res.status(404).json(error);
      }
      res.status(200).json(results.rows);
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

export { getMovies };
