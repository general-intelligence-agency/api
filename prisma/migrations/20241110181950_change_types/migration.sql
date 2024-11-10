/*
  Warnings:

  - You are about to drop the column `values` on the `FilledRequirementsList` table. All the data in the column will be lost.
  - You are about to drop the column `requirements` on the `RequirementsList` table. All the data in the column will be lost.
  - Added the required column `valuesCsv` to the `FilledRequirementsList` table without a default value. This is not possible if the table is not empty.
  - Added the required column `requirementsCsv` to the `RequirementsList` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "FilledRequirementsList" DROP COLUMN "values",
ADD COLUMN     "valuesCsv" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "RequirementsList" DROP COLUMN "requirements",
ADD COLUMN     "requirementsCsv" TEXT NOT NULL;
