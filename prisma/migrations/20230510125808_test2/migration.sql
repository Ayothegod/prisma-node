/*
  Warnings:

  - You are about to drop the column `personId` on the `preference` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[preferenceId]` on the table `person` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "preference" DROP CONSTRAINT "preference_personId_fkey";

-- DropIndex
DROP INDEX "preference_personId_key";

-- AlterTable
ALTER TABLE "person" ADD COLUMN     "preferenceId" TEXT;

-- AlterTable
ALTER TABLE "post" ADD COLUMN     "favouritePostId" TEXT;

-- AlterTable
ALTER TABLE "preference" DROP COLUMN "personId";

-- CreateIndex
CREATE UNIQUE INDEX "person_preferenceId_key" ON "person"("preferenceId");

-- AddForeignKey
ALTER TABLE "person" ADD CONSTRAINT "person_preferenceId_fkey" FOREIGN KEY ("preferenceId") REFERENCES "preference"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post" ADD CONSTRAINT "post_favouritePostId_fkey" FOREIGN KEY ("favouritePostId") REFERENCES "person"("id") ON DELETE SET NULL ON UPDATE CASCADE;
