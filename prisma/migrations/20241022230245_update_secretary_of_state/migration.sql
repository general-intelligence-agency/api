/*
  Warnings:

  - You are about to drop the column `assumed_name_history` on the `SecretaryOfStateCheck` table. All the data in the column will be lost.
  - You are about to drop the column `entity_details` on the `SecretaryOfStateCheck` table. All the data in the column will be lost.
  - You are about to drop the column `entity_display` on the `SecretaryOfStateCheck` table. All the data in the column will be lost.
  - You are about to drop the column `filing_history` on the `SecretaryOfStateCheck` table. All the data in the column will be lost.
  - You are about to drop the column `merger_history` on the `SecretaryOfStateCheck` table. All the data in the column will be lost.
  - You are about to drop the column `name_history` on the `SecretaryOfStateCheck` table. All the data in the column will be lost.
  - Added the required column `confidence_level` to the `SecretaryOfStateCheck` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date_of_formation` to the `SecretaryOfStateCheck` table without a default value. This is not possible if the table is not empty.
  - Added the required column `entity_type` to the `SecretaryOfStateCheck` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sos_id` to the `SecretaryOfStateCheck` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "SecretaryOfStateCheck" DROP COLUMN "assumed_name_history",
DROP COLUMN "entity_details",
DROP COLUMN "entity_display",
DROP COLUMN "filing_history",
DROP COLUMN "merger_history",
DROP COLUMN "name_history",
ADD COLUMN     "confidence_level" INTEGER NOT NULL,
ADD COLUMN     "data" JSONB,
ADD COLUMN     "date_of_formation" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "entity_type" TEXT NOT NULL,
ADD COLUMN     "officers" JSONB[],
ADD COLUMN     "sos_id" INTEGER NOT NULL;
