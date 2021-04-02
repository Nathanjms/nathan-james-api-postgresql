import { pool } from "../../config";
import { getGroupId } from "../get/users";

const addMovie = async (request, response) => {
  if (!request.body.title) {
    response.status(500).json("Title Required");
    return;
  }
  if (!request.body.firebaseId) {
    response.status(404).json("User ID not found");
  }
  const { title, firebaseId } = request.body;
  var groupId = await getGroupId(firebaseId).catch((err) => {
    response.status(500).json(err.message);
  });

  pool.query(
    "INSERT INTO movies (title, group_id) VALUES ($1, $2)",
    [title, groupId],
    (error) => {
      if (error) {
        response.status(500).json(error);
        return;
      }
      response.status(201).json({ status: "success", message: "Movie added." });
    }
  );
};

const markSeen = async (request, response) => {
  if (!request.body.userId) {
    response.status(404).json("User ID not found");
  }
  if (!request.body.movieId) {
    response.status(404).json("Movie ID not found");
  }
  const { movieId, userId } = request.body;
  var groupId = await getGroupId(userId).catch((err) => {
    response.status(500).json(err.message);
  });

  pool.query(
    "UPDATE movies SET seen = true where id = $1 AND group_id = $2",
    [movieId, groupId],
    (error) => {
      if (error) {
        response.status(500).json(error);
        return;
      }
      response.status(201).json({ status: "success", message: "Movie added." });
    }
  );
};

export { addMovie, markSeen };
