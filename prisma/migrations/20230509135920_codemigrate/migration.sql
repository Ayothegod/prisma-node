/*
  Warnings:

  - The primary key for the `person` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `person_loginfo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('BASIC', 'ADMIN');

-- DropForeignKey
ALTER TABLE "person_loginfo" DROP CONSTRAINT "person_loginfo_personId_fkey";

-- AlterTable
ALTER TABLE "person" DROP CONSTRAINT "person_pkey",
ADD COLUMN     "role" "Role" NOT NULL DEFAULT 'BASIC',
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "person_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "person_id_seq";

-- DropTable
DROP TABLE "person_loginfo";

-- DropTable
DROP TABLE "user";

-- CreateTable
CREATE TABLE "preference" (
    "id" TEXT NOT NULL,
    "cookie" BOOLEAN NOT NULL,
    "personId" TEXT NOT NULL,

    CONSTRAINT "preference_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "post" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "authorId" TEXT NOT NULL,

    CONSTRAINT "post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "category" (
    "id" TEXT NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_categoryTopost" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "preference_personId_key" ON "preference"("personId");

-- CreateIndex
CREATE UNIQUE INDEX "_categoryTopost_AB_unique" ON "_categoryTopost"("A", "B");

-- CreateIndex
CREATE INDEX "_categoryTopost_B_index" ON "_categoryTopost"("B");

-- CreateIndex
CREATE INDEX "person_email_idx" ON "person"("email");

-- AddForeignKey
ALTER TABLE "preference" ADD CONSTRAINT "preference_personId_fkey" FOREIGN KEY ("personId") REFERENCES "person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post" ADD CONSTRAINT "post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_categoryTopost" ADD CONSTRAINT "_categoryTopost_A_fkey" FOREIGN KEY ("A") REFERENCES "category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_categoryTopost" ADD CONSTRAINT "_categoryTopost_B_fkey" FOREIGN KEY ("B") REFERENCES "post"("id") ON DELETE CASCADE ON UPDATE CASCADE;
