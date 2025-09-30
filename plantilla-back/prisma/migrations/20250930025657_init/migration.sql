-- CreateTable
CREATE TABLE `users` (
    `idUser` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `role` ENUM('ADMIN', 'SELLER') NOT NULL DEFAULT 'SELLER',
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `last_login` DATETIME(3) NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`idUser`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Departament` (
    `idDepartament` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    INDEX `Departament_name_idx`(`name`),
    PRIMARY KEY (`idDepartament`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Municipality` (
    `idMunicipality` INTEGER NOT NULL AUTO_INCREMENT,
    `idDepartament` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    INDEX `Municipality_name_idx`(`name`),
    INDEX `Municipality_idDepartament_idx`(`idDepartament`),
    PRIMARY KEY (`idMunicipality`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Company` (
    `idCompany` INTEGER NOT NULL AUTO_INCREMENT,
    `nameCompany` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idCompany`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `idOrder` INTEGER NOT NULL AUTO_INCREMENT,
    `orderDate` DATETIME(3) NOT NULL,
    `fullName` VARCHAR(191) NOT NULL,
    `idMunicipality` INTEGER NOT NULL,
    `orderDetails` LONGTEXT NOT NULL,
    `orderType` ENUM('WHATSAPP', 'META') NOT NULL,
    `paymentType` ENUM('SOLO_ENTREGA', 'RECIBE_PAGO') NOT NULL,
    `paymentAmount` DOUBLE NOT NULL,
    `orderStatus` INTEGER NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,
    `createdBy` INTEGER NOT NULL,
    `address` VARCHAR(191) NULL,
    `idCompany` INTEGER NULL,
    `nit` VARCHAR(191) NULL,
    `phoneTwo` VARCHAR(191) NOT NULL,
    `printerTicker` BOOLEAN NOT NULL DEFAULT false,

    INDEX `Order_orderDate_idx`(`orderDate`),
    INDEX `Order_orderStatus_idx`(`orderStatus`),
    INDEX `Order_orderType_idx`(`orderType`),
    INDEX `Order_paymentType_idx`(`paymentType`),
    INDEX `Order_idMunicipality_idx`(`idMunicipality`),
    INDEX `Order_idCompany_idx`(`idCompany`),
    PRIMARY KEY (`idOrder`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Municipality` ADD CONSTRAINT `Municipality_idDepartament_fkey` FOREIGN KEY (`idDepartament`) REFERENCES `Departament`(`idDepartament`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_idMunicipality_fkey` FOREIGN KEY (`idMunicipality`) REFERENCES `Municipality`(`idMunicipality`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_idCompany_fkey` FOREIGN KEY (`idCompany`) REFERENCES `Company`(`idCompany`) ON DELETE SET NULL ON UPDATE CASCADE;
