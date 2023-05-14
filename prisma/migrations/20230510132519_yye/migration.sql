/*
  Warnings:

  - You are about to drop the `_categoryTopost` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_categoryTopost" DROP CONSTRAINT "_categoryTopost_A_fkey";

-- DropForeignKey
ALTER TABLE "_categoryTopost" DROP CONSTRAINT "_categoryTopost_B_fkey";

-- DropForeignKey
ALTER TABLE "post" DROP CONSTRAINT "post_authorId_fkey";

-- DropForeignKey
ALTER TABLE "post" DROP CONSTRAINT "post_favouritePostId_fkey";

-- DropTable
DROP TABLE "_categoryTopost";

-- DropTable
DROP TABLE "category";

-- DropTable
DROP TABLE "post";
