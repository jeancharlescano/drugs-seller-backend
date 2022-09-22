import * as dotenv from "dotenv";
dotenv.config();
import pkg from "pg";
const { Pool } = pkg;

console.log(process.env.DB_USERNAME);
export const pool = new Pool({
  user: process.env.DB_USERNAME,
  host: process.env.DB_HOSTNAME,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWD,
  port: process.env.DB_PORT,
});

pool.connect;

// export async function checkUserBdd() {
//     console.log("toto");
//     return await pool
//         .query(`SELECT * FROM Members;`)
//         .then((res) => {
//             console.log(res.rows[0]);
//             return res.rows
//         })
//         .catch((error) => console.error(error.stack));
// }
