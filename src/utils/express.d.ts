declare namespace Express {
  interface Request {
    userLogado: {
      id: number;
      nome: string;
      email: string;
    };
  }
}
