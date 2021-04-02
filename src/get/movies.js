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
      if (results.rowCount == 0) {
        res.status(500).json("No group found with that ID");
        return;
      }
      res.status(200).json(results.rows);
    }
  );
};

export { getMovies };
