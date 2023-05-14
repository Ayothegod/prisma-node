/*
  Warnings:

  - You are about to drop the `logInfo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "logInfo" DROP CONSTRAINT "logInfo_userId_fkey";

-- DropTable
DROP TABLE "logInfo";

-- DropTable
DROP TABLE "user";
