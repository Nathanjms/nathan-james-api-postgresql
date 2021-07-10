import { pool } from "../../config";

const getGroupId = async (firebaseId) => {
  return await pool
    .query(
      `SELECT mg.id 
        FROM movie_groups mg 
        LEFT JOIN movie_group_members mgm on mgm.group_id = mg.id 
        LEFT JOIN users u on mgm.user_id = u.id 
        WHERE u.firebase_id = '${firebaseId}';`
    )
    .then((result) => {
      return result.rows[0].id;
    })
    .catch((err) => {
      throw err;
    });
};

export { getGroupId };
