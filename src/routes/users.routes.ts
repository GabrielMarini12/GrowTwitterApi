import { Router } from "express";
import { UserController } from "../controllers/user.controller";

export class UsersRoutes {
  public static bind(): Router {
    const router = Router();

    const controller = new UserController();

    router.get("/users", controller.listar);
    router.post("/users", controller.cadastrar);
    router.get("/users/:id", controller.listarPorId);
    router.put("/users/:id", controller.atualizarPorId);
    router.delete("/users/:id", controller.deletarPorId);

    return router;
  }
}
