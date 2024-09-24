-- DropIndex
DROP INDEX "LLMEvaluation_application_id_key";

-- AlterTable
ALTER TABLE "LLMEvaluation" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AddForeignKey
ALTER TABLE "LLMEvaluation" ADD CONSTRAINT "LLMEvaluation_application_id_fkey" FOREIGN KEY ("application_id") REFERENCES "Application"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
