-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Individual_Project_JessiQuezada
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Individual_Project_JessiQuezada
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Individual_Project_JessiQuezada` DEFAULT CHARACTER SET utf8 ;
USE `Individual_Project_JessiQuezada` ;

-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Customer` (
  `idCustomer` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NOT NULL,
  `CustomerLastName` VARCHAR(45) NOT NULL,
  `CustomerEmail` VARCHAR(45) NULL,
  `CustomerPhoneNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idCustomer` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Employee` (
  `EmployeeID` INT NOT NULL,
  `EmployeeFirstName` VARCHAR(45) NOT NULL,
  `EmployeeLastName` VARCHAR(45) NOT NULL,
  `EmployeeEmail` VARCHAR(45) NOT NULL,
  `EmployeeAddress` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `EmployeeID_UNIQUE` (`EmployeeID` ASC) VISIBLE,
  UNIQUE INDEX `EmployeeEmail_UNIQUE` (`EmployeeEmail` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Order` (
  `OrderID` INT NOT NULL,
  `OrderDate` VARCHAR(45) NOT NULL,
  `OrderTotalPrice` VARCHAR(45) NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  `Employee_EmployeeID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  UNIQUE INDEX `OrderDate_UNIQUE` (`OrderDate` ASC) VISIBLE,
  UNIQUE INDEX `OrderTotalPrice_UNIQUE` (`OrderTotalPrice` ASC) VISIBLE,
  INDEX `fk_Order_Customer_idx` (`Customer_idCustomer` ASC) VISIBLE,
  INDEX `fk_Order_Employee1_idx` (`Employee_EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Customer`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `Individual_Project_JessiQuezada`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Employee1`
    FOREIGN KEY (`Employee_EmployeeID`)
    REFERENCES `Individual_Project_JessiQuezada`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Product` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NOT NULL,
  `ProductPrice` VARCHAR(45) NOT NULL,
  `MaterialName` VARCHAR(45) NOT NULL,
  `Order_OrderID` INT NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `ProductID_UNIQUE` (`ProductID` ASC) VISIBLE,
  INDEX `fk_Product_Order1_idx` (`Order_OrderID` ASC) VISIBLE,
  UNIQUE INDEX `Order_OrderID_UNIQUE` (`Order_OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `Individual_Project_JessiQuezada`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Repair`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Repair` (
  `RepairID` INT NOT NULL,
  `RepairName` VARCHAR(45) NOT NULL,
  `RepairDate` VARCHAR(45) NOT NULL,
  `Order_OrderID` INT NOT NULL,
  PRIMARY KEY (`RepairID`),
  UNIQUE INDEX `RepairID_UNIQUE` (`RepairID` ASC) VISIBLE,
  INDEX `fk_Repair_Order1_idx` (`Order_OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_Repair_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `Individual_Project_JessiQuezada`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Supplier` (
  `SupplierID` INT NOT NULL,
  `SupplierName` VARCHAR(45) NOT NULL,
  `SupplierAddress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE INDEX `SupplierName_UNIQUE` (`SupplierName` ASC) VISIBLE,
  UNIQUE INDEX `SupplierAddress_UNIQUE` (`SupplierAddress` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Material` (
  `MaterialID` INT NOT NULL,
  `MaterialDate` VARCHAR(45) NOT NULL,
  `MaterialColor` VARCHAR(45) NOT NULL,
  `Supplier_SupplierID` INT NOT NULL,
  PRIMARY KEY (`MaterialID`),
  UNIQUE INDEX `MaterialID_UNIQUE` (`MaterialID` ASC) VISIBLE,
  UNIQUE INDEX `MaterialDate_UNIQUE` (`MaterialDate` ASC) VISIBLE,
  INDEX `fk_Material_Supplier1_idx` (`Supplier_SupplierID` ASC) VISIBLE,
  CONSTRAINT `fk_Material_Supplier1`
    FOREIGN KEY (`Supplier_SupplierID`)
    REFERENCES `Individual_Project_JessiQuezada`.`Supplier` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Individual_Project_JessiQuezada`.`Material_has_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Individual_Project_JessiQuezada`.`Material_has_Product` (
  `Material_MaterialID` INT NOT NULL,
  `Product_ProductID` INT NOT NULL,
  PRIMARY KEY (`Material_MaterialID`, `Product_ProductID`),
  INDEX `fk_Material_has_Product_Product1_idx` (`Product_ProductID` ASC) VISIBLE,
  INDEX `fk_Material_has_Product_Material1_idx` (`Material_MaterialID` ASC) VISIBLE,
  CONSTRAINT `fk_Material_has_Product_Material1`
    FOREIGN KEY (`Material_MaterialID`)
    REFERENCES `Individual_Project_JessiQuezada`.`Material` (`MaterialID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Material_has_Product_Product1`
    FOREIGN KEY (`Product_ProductID`)
    REFERENCES `Individual_Project_JessiQuezada`.`Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
