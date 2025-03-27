import { User } from "@prisma/client";
import { prismaClient } from "../database/prisma.client";
import { ListarUsersDto } from "../dtos/users.dto";
import { validate as isValidUid } from "uuid";
import { HTTPError } from "../utils/http.error";

// Tipos Utilitários TS
type UserParcial = Omit<User, "authToken" | "senha">;

export class UsersService {
  public async listar({ nome }: ListarUsersDto): Promise<UserParcial[]> {
    // ...

    const usersDB = await prismaClient.user.findMany({
      where: {
        nome: {
          contains: nome,
          mode: "insensitive",
        },
      },
      orderBy: {
        nome: "asc",
      },
      omit: {
        authToken: true,
        senha: true,
      },
    });

    return usersDB;
  }
}
