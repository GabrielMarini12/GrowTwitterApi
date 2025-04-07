/*
  Warnings:

  - You are about to drop the `Like` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Retweet` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Seguidor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Tweet` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "TweetType" AS ENUM ('TWEET', 'RETWEET');

-- DropForeignKey
ALTER TABLE "Like" DROP CONSTRAINT "Like_idTweet_fkey";

-- DropForeignKey
ALTER TABLE "Like" DROP CONSTRAINT "Like_idUser_fkey";

-- DropForeignKey
ALTER TABLE "Retweet" DROP CONSTRAINT "Retweet_idTweet_fkey";

-- DropForeignKey
ALTER TABLE "Retweet" DROP CONSTRAINT "Retweet_idUser_fkey";

-- DropForeignKey
ALTER TABLE "Seguidor" DROP CONSTRAINT "Seguidor_idSeguidor_fkey";

-- DropForeignKey
ALTER TABLE "Seguidor" DROP CONSTRAINT "Seguidor_idUser_fkey";

-- DropForeignKey
ALTER TABLE "Tweet" DROP CONSTRAINT "Tweet_idUser_fkey";

-- DropTable
DROP TABLE "Like";

-- DropTable
DROP TABLE "Retweet";

-- DropTable
DROP TABLE "Seguidor";

-- DropTable
DROP TABLE "Tweet";

-- DropTable
DROP TABLE "User";

-- DropEnum
DROP TYPE "TipoTweet";

-- CreateTable
CREATE TABLE "usuario" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "senha" TEXT NOT NULL,
    "auth_Token" UUID,

    CONSTRAINT "usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tweets" (
    "id" SERIAL NOT NULL,
    "conteudo" VARCHAR(300),
    "tipo" "TweetType" NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "tweets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "likes" (
    "userId" INTEGER NOT NULL,
    "tweetId" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "retweets" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "tweetId" INTEGER NOT NULL,

    CONSTRAINT "retweets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "followers" (
    "userId" INTEGER NOT NULL,
    "followerId" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "usuario_email_key" ON "usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_username_key" ON "usuario"("username");

-- CreateIndex
CREATE UNIQUE INDEX "likes_userId_tweetId_key" ON "likes"("userId", "tweetId");

-- CreateIndex
CREATE UNIQUE INDEX "retweets_userId_tweetId_key" ON "retweets"("userId", "tweetId");

-- CreateIndex
CREATE UNIQUE INDEX "followers_userId_followerId_key" ON "followers"("userId", "followerId");

-- AddForeignKey
ALTER TABLE "tweets" ADD CONSTRAINT "tweets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_tweetId_fkey" FOREIGN KEY ("tweetId") REFERENCES "tweets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "retweets" ADD CONSTRAINT "retweets_tweetId_fkey" FOREIGN KEY ("tweetId") REFERENCES "tweets"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "retweets" ADD CONSTRAINT "retweets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "followers" ADD CONSTRAINT "followers_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "followers" ADD CONSTRAINT "followers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
