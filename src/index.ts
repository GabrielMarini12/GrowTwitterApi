import express from "express";
import { envs } from "./envs";
import { UsersRoutes } from "./routes/users.routes";

const app = express();
app.use(express.json());

app.get("/", (_, res) => {
  res.status(200).json({
    sucesso: true,
    mensagem: "API is running",
  });
});

app.use(UsersRoutes.bind());

app.listen(envs.PORT, () => console.log("Server is running"));
