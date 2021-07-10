import { pool } from "../../config";

const getUserInfo = async (req, res) => {
  if (!req.body.firebaseId) {
    res.status(404).json("User not found");
    return;
  }
  var firebaseId = req.body.firebaseId;
  return await pool
    .query(
      `SELECT mg.id as group_id, mg.name as group_name, u.name as user_name
      FROM movie_groups mg 
      LEFT JOIN movie_group_members mgm on mgm.group_id = mg.id 
      LEFT JOIN users u on mgm.user_id = u.id 
      WHERE u.firebase_id = '${firebaseId}';`
    )
    .then((result) => {
      if (result.rowCount == 0) {
        res.status(500).json("No User found with that ID");
        return;
      }
      res.status(200).json(result.rows[0]);
      return;
    })
    .catch((err) => {
      throw err;
    });
};

export { getUserInfo };
