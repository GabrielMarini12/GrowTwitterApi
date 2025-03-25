-- CreateEnum
CREATE TYPE "TipoTweet" AS ENUM ('TWEET', 'RETWEET');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "email" VARCHAR(200) NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "senha" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tweet" (
    "id" SERIAL NOT NULL,
    "conteudo" VARCHAR(300),
    "tipo" "TipoTweet" NOT NULL,
    "idUser" INTEGER NOT NULL,

    CONSTRAINT "Tweet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Like" (
    "idUser" INTEGER NOT NULL,
    "idTweet" INTEGER NOT NULL,

    CONSTRAINT "Like_pkey" PRIMARY KEY ("idUser","idTweet")
);

-- CreateTable
CREATE TABLE "Retweet" (
    "idUser" INTEGER NOT NULL,
    "idTweet" INTEGER NOT NULL,

    CONSTRAINT "Retweet_pkey" PRIMARY KEY ("idUser","idTweet")
);

-- CreateTable
CREATE TABLE "Seguidor" (
    "idUser" INTEGER NOT NULL,
    "idSeguidor" INTEGER NOT NULL,

    CONSTRAINT "Seguidor_pkey" PRIMARY KEY ("idUser","idSeguidor")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "Tweet" ADD CONSTRAINT "Tweet_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Like" ADD CONSTRAINT "Like_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Like" ADD CONSTRAINT "Like_idTweet_fkey" FOREIGN KEY ("idTweet") REFERENCES "Tweet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Retweet" ADD CONSTRAINT "Retweet_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Retweet" ADD CONSTRAINT "Retweet_idTweet_fkey" FOREIGN KEY ("idTweet") REFERENCES "Tweet"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seguidor" ADD CONSTRAINT "Seguidor_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Seguidor" ADD CONSTRAINT "Seguidor_idSeguidor_fkey" FOREIGN KEY ("idSeguidor") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
