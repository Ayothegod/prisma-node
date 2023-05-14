/*
  Warnings:

  - You are about to drop the column `authorId` on the `post` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "post" DROP CONSTRAINT "post_authorId_fkey";

-- AlterTable
ALTER TABLE "post" DROP COLUMN "authorId";

-- AlterTable
ALTER TABLE "user" ADD COLUMN     "postId" TEXT;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_postId_fkey" FOREIGN KEY ("postId") REFERENCES "post"("id") ON DELETE SET NULL ON UPDATE CASCADE;
