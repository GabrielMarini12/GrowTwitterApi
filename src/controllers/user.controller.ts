import { Request, Response } from "express";
import { UsersService } from "../services/users.service";
import { onError } from "../utils/on-error";

export class UserController {
  public async listar(req: Request, res: Response): Promise<void> {
    try {
      const { nome } = req.query;

      const service = new UsersService();
      const resultado = await service.listar({
        nome: nome as string | undefined,
      });

      res.status(200).json({
        sucesso: true,
        mensagem: "Alunos listados com sucesso",
        dados: resultado,
      });
    } catch (error) {
      onError(error, res);
    }
  }
}
