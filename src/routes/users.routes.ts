import { Router } from "express";
import { UserController } from "../controllers/user.controller";

export class UsersRoutes {
  public static bind(): Router {
    const router = Router();

    const controller = new UserController();

    router.get("/users", controller.listar); // listando todos os usuarios

    return router;
  }
}
