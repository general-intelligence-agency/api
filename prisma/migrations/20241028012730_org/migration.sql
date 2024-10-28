-- AlterTable
ALTER TABLE "Entity" ALTER COLUMN "owner_first_name" DROP NOT NULL,
ALTER COLUMN "owner_last_name" DROP NOT NULL,
ALTER COLUMN "ownership_percentage" DROP NOT NULL;
