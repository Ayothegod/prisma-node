/*
  Warnings:

  - You are about to drop the column `logInfoId` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `postId` on the `user` table. All the data in the column will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `logInfo` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `logInfo` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_logInfoId_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_postId_fkey";

-- DropIndex
DROP INDEX "user_logInfoId_key";

-- AlterTable
ALTER TABLE "logInfo" ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "user" DROP COLUMN "logInfoId",
DROP COLUMN "postId";

-- DropTable
DROP TABLE "post";

-- CreateIndex
CREATE UNIQUE INDEX "logInfo_userId_key" ON "logInfo"("userId");

-- AddForeignKey
ALTER TABLE "logInfo" ADD CONSTRAINT "logInfo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
