/*
  Warnings:

  - You are about to drop the column `business_hours` on the `YelpLookup` table. All the data in the column will be lost.
  - Added the required column `alias` to the `YelpLookup` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "YelpLookup_yelp_id_key";

-- AlterTable
ALTER TABLE "YelpLookup" DROP COLUMN "business_hours",
ADD COLUMN     "alias" TEXT NOT NULL,
ADD COLUMN     "hours" JSONB;
