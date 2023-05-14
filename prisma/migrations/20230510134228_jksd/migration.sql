/*
  Warnings:

  - You are about to drop the `person` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `preference` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "person" DROP CONSTRAINT "person_preferenceId_fkey";

-- DropTable
DROP TABLE "person";

-- DropTable
DROP TABLE "preference";

-- DropEnum
DROP TYPE "Role";

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "logInfoId" TEXT,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "logInfo" (
    "id" TEXT NOT NULL,
    "emailSignin" BOOLEAN NOT NULL DEFAULT true,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "logInfo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_logInfoId_key" ON "user"("logInfoId");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_logInfoId_fkey" FOREIGN KEY ("logInfoId") REFERENCES "logInfo"("id") ON DELETE SET NULL ON UPDATE CASCADE;
