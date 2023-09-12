-- CreateTable
CREATE TABLE "Delivery" (
    "id" TEXT NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "finishTime" TIMESTAMP(3) NOT NULL,
    "plannedStartTime" TIMESTAMP(3) NOT NULL,
    "deliveryName" TEXT NOT NULL,

    CONSTRAINT "Delivery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stop" (
    "id" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "stopIndex" INTEGER NOT NULL,
    "stopStartTime" TIMESTAMP(3) NOT NULL,
    "stopEndTime" TIMESTAMP(3) NOT NULL,
    "unloadingTime" INTEGER NOT NULL,
    "deliveryId" TEXT NOT NULL,

    CONSTRAINT "Stop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Matrix" (
    "id" TEXT NOT NULL,
    "fromStop" TEXT NOT NULL,
    "toStop" TEXT NOT NULL,
    "length" INTEGER NOT NULL,
    "duration" INTEGER NOT NULL,
    "deliveryId" TEXT NOT NULL,

    CONSTRAINT "Matrix_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Delivery_deliveryName_key" ON "Delivery"("deliveryName");

-- CreateIndex
CREATE UNIQUE INDEX "Stop_number_name_key" ON "Stop"("number", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Matrix_fromStop_toStop_key" ON "Matrix"("fromStop", "toStop");

-- AddForeignKey
ALTER TABLE "Stop" ADD CONSTRAINT "Stop_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES "Delivery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matrix" ADD CONSTRAINT "Matrix_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES "Delivery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
