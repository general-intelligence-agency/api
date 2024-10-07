-- CreateTable
CREATE TABLE "_EntityToFOIA7aLoanData" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_EntityToFOIA7aLoanData_AB_unique" ON "_EntityToFOIA7aLoanData"("A", "B");

-- CreateIndex
CREATE INDEX "_EntityToFOIA7aLoanData_B_index" ON "_EntityToFOIA7aLoanData"("B");

-- AddForeignKey
ALTER TABLE "_EntityToFOIA7aLoanData" ADD CONSTRAINT "_EntityToFOIA7aLoanData_A_fkey" FOREIGN KEY ("A") REFERENCES "Entity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EntityToFOIA7aLoanData" ADD CONSTRAINT "_EntityToFOIA7aLoanData_B_fkey" FOREIGN KEY ("B") REFERENCES "FOIA7aLoanData"("id") ON DELETE CASCADE ON UPDATE CASCADE;
