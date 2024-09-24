-- CreateTable
CREATE TABLE "LLMEvaluation" (
    "id" TEXT NOT NULL,
    "risk_bucket" TEXT NOT NULL,
    "explanation" TEXT,
    "application_id" TEXT NOT NULL,
    "configuration_id" TEXT NOT NULL,

    CONSTRAINT "LLMEvaluation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LLMConfiguration" (
    "id" TEXT NOT NULL,
    "configuration" JSONB NOT NULL,
    "configuration_version" TEXT NOT NULL,

    CONSTRAINT "LLMConfiguration_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "LLMEvaluation_application_id_key" ON "LLMEvaluation"("application_id");

-- AddForeignKey
ALTER TABLE "LLMEvaluation" ADD CONSTRAINT "LLMEvaluation_configuration_id_fkey" FOREIGN KEY ("configuration_id") REFERENCES "LLMConfiguration"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
