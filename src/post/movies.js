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
  const { title } = request.body.title;
  var groupId = await getGroupId(request.body.firebaseId).catch((err) => {
    response.status(500).json(err);
  });
  pool.query(
    "INSERT INTO movies (title, group_id) VALUES ($1, $2)",
    [title, groupId],
    (error) => {
      if (error) {
        response.status(500).json(error);
      }
      response.status(201).json({ status: "success", message: "Movie added." });
    }
  );
};

export { addMovie };
