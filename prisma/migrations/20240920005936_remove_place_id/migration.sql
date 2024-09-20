/*
  Warnings:

  - You are about to drop the column `place_id` on the `GoogleMapsDetailsLookup` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "GoogleMapsDetailsLookup_place_id_key";

-- AlterTable
ALTER TABLE "GoogleMapsDetailsLookup" DROP COLUMN "place_id";
