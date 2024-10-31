/*
  Warnings:

  - Made the column `entity_id` on table `SecretaryOfStateCheck` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "SecretaryOfStateCheck" DROP CONSTRAINT "SecretaryOfStateCheck_entity_id_fkey";

-- AlterTable
ALTER TABLE "SecretaryOfStateCheck" ALTER COLUMN "entity_id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "SecretaryOfStateCheck" ADD CONSTRAINT "SecretaryOfStateCheck_entity_id_fkey" FOREIGN KEY ("entity_id") REFERENCES "Entity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
