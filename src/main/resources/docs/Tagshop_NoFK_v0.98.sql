-- MySQL Script generated by MySQL Workbench
-- Thu Jul 11 11:50:38 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tagshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tagshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tagshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `tagshop` ;

-- -----------------------------------------------------
-- Table `tagshop`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Users` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Users` (
  `Userid` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(1000) NOT NULL,
  `Enabled` TINYINT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Phone` VARCHAR(20) NULL,
  `EmailKey` VARCHAR(50) NULL,
  `CreateDate` DATE NULL,
  `UpdateDate` DATE NULL,
  PRIMARY KEY (`Userid`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Shops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Shops` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Shops` (
  `ShopId` VARCHAR(50) NOT NULL,
  `Userid` VARCHAR(50) NOT NULL,
  `CorporateName` VARCHAR(100) NULL,
  `CorporateRegisterNumber` VARCHAR(20) NULL,
  `BrandName` VARCHAR(100) NULL,
  `Phone` VARCHAR(50) NULL,
  `Enabled` TINYINT NULL,
  `BankCode` VARCHAR(50) NULL,
  `BankAccount` VARCHAR(50) NULL,
  `CreateDate` DATE NULL,
  `UpdateDate` DATE NULL,
  PRIMARY KEY (`ShopId`, `Userid`),
  INDEX `fk_Shops_Users1_idx` (`Userid` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Products` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Products` (
  `ProductId` BIGINT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(200) NULL,
  `Description` LONGTEXT NULL,
  `Price` DOUBLE NULL,
  `PhotoFile` VARCHAR(100) NULL,
  `SmallCategoryCode` VARCHAR(9) NULL,
  `MainColor` VARCHAR(50) NULL,
  `CreateDate` DATE NULL,
  `UpdateDate` DATE NULL,
  `ShopId` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ProductId`),
  INDEX `fk_Products_Shop1_idx` (`ShopId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Profile` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Profile` (
  `Userid` VARCHAR(50) NOT NULL,
  `Introduction` VARCHAR(2000) NULL,
  `Website` VARCHAR(100) NULL,
  `PhotoName` VARCHAR(50) NULL,
  `RecipientName` VARCHAR(100) NULL,
  `Address1` VARCHAR(100) NULL,
  `Address2` VARCHAR(100) NULL,
  `PostalCode` VARCHAR(50) NULL,
  `CountryCode` VARCHAR(3) NULL,
  `DeliveryMemo` VARCHAR(1000) NULL,
  `Point` INT NULL,
  `RepostNumber` INT NULL,
  INDEX `fk_Profile_Users1_idx` (`Userid` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Photo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Photo` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Photo` (
  `PhotoId` BIGINT NOT NULL AUTO_INCREMENT,
  `FileName` VARCHAR(50) NULL,
  `Description` VARCHAR(500) NULL,
  `RefPhotoId` BIGINT NULL,
  `RefProductId` BIGINT NULL,
  `RefShopid` VARCHAR(50) NULL,
  `RefLink` VARCHAR(100) NULL,
  `CreateDate` DATE NULL,
  `UpdateDate` DATE NULL,
  `Userid` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`PhotoId`),
  INDEX `fk_Photo_Users1_idx` (`Userid` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Following`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Following` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Following` (
  `FollowingId` VARCHAR(50) NOT NULL,
  `UsersUserid` VARCHAR(50) NOT NULL,
  INDEX `fk_Following_Users1_idx` (`UsersUserid` ASC),
  PRIMARY KEY (`FollowingId`, `UsersUserid`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Follower`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Follower` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Follower` (
  `FollowerId` VARCHAR(50) NOT NULL,
  `UsersUserid` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`FollowerId`, `UsersUserid`),
  INDEX `fk_Follower_Users1_idx` (`UsersUserid` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Likes` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Likes` (
  `PhotoId` BIGINT NOT NULL,
  `UsersUserid` VARCHAR(50) NOT NULL,
  `LikeYn` TINYINT NULL,
  `BuyYn` TINYINT NULL,
  INDEX `fk_Likes_Photo1_idx` (`PhotoId` ASC),
  INDEX `fk_Likes_Users1_idx` (`UsersUserid` ASC),
  PRIMARY KEY (`PhotoId`, `UsersUserid`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Comments` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Comments` (
  `CommentsId` BIGINT NOT NULL AUTO_INCREMENT,
  `Comments` VARCHAR(200) NULL,
  `BuyYn` TINYINT NULL,
  `CreateDate` DATE NULL,
  `UpdateDate` DATE NULL,
  `PhotoId` BIGINT NOT NULL,
  `UsersUserid` VARCHAR(50) NOT NULL,
  INDEX `fk_Comments_Photo1_idx` (`PhotoId` ASC),
  INDEX `fk_Comments_Users1_idx` (`UsersUserid` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`TagsLocale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`TagsLocale` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`TagsLocale` (
  `TagsId` BIGINT NOT NULL AUTO_INCREMENT,
  `TagsNameEn` VARCHAR(100) NULL,
  `TagsNameEs` VARCHAR(100) NULL,
  `TagsNameZh` VARCHAR(100) NULL,
  `TagsNameHi` VARCHAR(100) NULL,
  `TagsNameJa` VARCHAR(100) NULL,
  `TagsNameRu` VARCHAR(100) NULL,
  `TagsNamePt` VARCHAR(100) NULL,
  `TagsNameKo` VARCHAR(100) NULL,
  PRIMARY KEY (`TagsId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`PhotoTags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`PhotoTags` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`PhotoTags` (
  `PhotoId` BIGINT NOT NULL,
  `TagsId` BIGINT NOT NULL,
  INDEX `fk_Tags_Photo1_idx` (`PhotoId` ASC),
  INDEX `fk_Tags_TagsLocale1_idx` (`TagsId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`TagsPriceHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`TagsPriceHistory` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`TagsPriceHistory` (
  `BaseDate` VARCHAR(8) NOT NULL,
  `TagsId` BIGINT NOT NULL,
  `CurrencyCode` VARCHAR(3) NOT NULL,
  `Rank` INT NULL,
  `Price` DOUBLE NULL,
  INDEX `fk_TagsPriceHistory_TagsLocale1_idx` (`TagsId` ASC),
  PRIMARY KEY (`BaseDate`, `TagsId`, `CurrencyCode`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Baskets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Baskets` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Baskets` (
  `BasketId` BIGINT NOT NULL AUTO_INCREMENT,
  `DeliveryFee` DOUBLE NULL,
  `UsedPoint` DOUBLE NULL,
  `PayTypeCode` VARCHAR(10) NULL,
  `CreateDate` DATE NULL,
  `UpdateDate` DATE NULL,
  `Userid` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`BasketId`),
  INDEX `fk_Baskets_Users1_idx` (`Userid` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`ProductItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`ProductItem` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`ProductItem` (
  `ProductItemId` BIGINT NOT NULL,
  `ProductName` VARCHAR(100) NULL,
  `UnitPrice` DOUBLE NULL,
  `ProductId` BIGINT NOT NULL,
  PRIMARY KEY (`ProductItemId`),
  INDEX `fk_ProductItem_Products1_idx` (`ProductId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`BuyItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`BuyItems` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`BuyItems` (
  `BuyItemsId` BIGINT NOT NULL AUTO_INCREMENT,
  `UnitPrice` DOUBLE NULL,
  `Quantity` INT NULL,
  `OrderStatusCode` VARCHAR(10) NULL,
  `BasketId` BIGINT NOT NULL,
  `ProductItemId` BIGINT NOT NULL,
  PRIMARY KEY (`BuyItemsId`),
  INDEX `fk_BuyItems_Baskets1_idx` (`BasketId` ASC),
  INDEX `fk_BuyItems_ProductItem1_idx` (`ProductItemId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Options` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Options` (
  `OptionId` BIGINT NOT NULL AUTO_INCREMENT,
  `OptionType` VARCHAR(50) NULL,
  `OptionCode` VARCHAR(50) NULL,
  `ProductItemId` BIGINT NOT NULL,
  PRIMARY KEY (`OptionId`),
  INDEX `fk_Options_ProductItem1_idx` (`ProductItemId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`SelectedOption`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`SelectedOption` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`SelectedOption` (
  `OptionId` BIGINT NOT NULL AUTO_INCREMENT,
  `OptionType` VARCHAR(5) NULL,
  `OptionCode` VARCHAR(50) NULL,
  `BuyItemsId` BIGINT NOT NULL,
  PRIMARY KEY (`OptionId`),
  INDEX `fk_SelectedOption_BuyItems1_idx` (`BuyItemsId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Roles` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Roles` (
  `Authority` VARCHAR(50) NOT NULL,
  `RoleName` VARCHAR(200) NULL,
  `CreateDate` DATE NULL,
  `UpdateDate` DATE NULL,
  PRIMARY KEY (`Authority`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Authorities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Authorities` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Authorities` (
  `Userid` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NULL,
  `Authority` VARCHAR(50) NOT NULL,
  INDEX `fk_Authorities_Users1_idx` (`Userid` ASC),
  INDEX `fk_Authorities_Roles1_idx` (`Authority` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Categories` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Categories` (
  `LargeCategoryCode` VARCHAR(3) NOT NULL,
  `LargeCategoryName` VARCHAR(100) NULL,
  `MidCategoryCode` VARCHAR(6) NOT NULL,
  `MidCategoryName` VARCHAR(100) NULL,
  `SmallCategoryCode` VARCHAR(9) NULL,
  `SmallCategoryName` VARCHAR(100) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`ProductTags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`ProductTags` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`ProductTags` (
  `TagsId` BIGINT NOT NULL,
  `ProductId` BIGINT NOT NULL,
  INDEX `fk_Tags_TagsLocale1_idx` (`TagsId` ASC),
  INDEX `fk_ProductTags_Products1_idx` (`ProductId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Code` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Code` (
  `ClassCode` VARCHAR(10) NOT NULL,
  `ClassName` VARCHAR(50) NULL,
  `Code` VARCHAR(10) NOT NULL,
  `CodeName` VARCHAR(50) NULL,
  `Orders` INT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Reposts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Reposts` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Reposts` (
  `PhotoId` BIGINT NOT NULL,
  `UsersUserid` VARCHAR(50) NOT NULL,
  `BuyYn` TINYINT NULL,
  INDEX `fk_Reposts_Users1_idx` (`UsersUserid` ASC),
  INDEX `fk_Reposts_Photo1_idx` (`PhotoId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`SelectedCategories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`SelectedCategories` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`SelectedCategories` (
  `ShopId` VARCHAR(50) NOT NULL,
  `MidCategoryCode` VARCHAR(6) NULL,
  INDEX `fk_SelectedCategories_Shops1_idx` (`ShopId` ASC)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Logs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Logs` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Logs` (
  `DateTime` DATETIME NULL,
  `Userid` VARCHAR(50) NULL,
  `IpAddress` VARCHAR(50) NULL,
  `Uri` VARCHAR(300) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Performance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Performance` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Performance` (
  `BaseDate` VARCHAR(8) NOT NULL,
  `Users` INT NULL,
  `Signup` INT NULL,
  `PhotoViews` INT NULL,
  `PrdtPhoto` INT NULL,
  `BuyPhoto` INT NULL,
  `BuyShop` INT NULL,
  `Rebuy` INT NULL,
  `Sales` INT NULL,
  PRIMARY KEY (`BaseDate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagshop`.`Coordinates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Coordinates` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Coordinates` (
  `PhotoId` BIGINT NOT NULL,
  `Ax1` INT NULL,
  `Ax2` INT NULL,
  `Ay1` INT NULL,
  `Ay2` INT NULL,
  `ARefProductid` BIGINT NULL,
  `ARefShopid` VARCHAR(50) NULL,
  `ARefLink` VARCHAR(100) NULL,
  `Bx1` INT NULL,
  `Bx2` INT NULL,
  `By1` INT NULL,
  `By2` INT NULL,
  `BRefProductid` BIGINT NULL,
  `BRefShopid` VARCHAR(50) NULL,
  `BRefLink` VARCHAR(100) NULL,
  PRIMARY KEY (`PhotoId`),
  INDEX `fk_Coordinates_Photo1_idx` (`PhotoId` ASC),
  CONSTRAINT `fk_Coordinates_Photo1`
    FOREIGN KEY (`PhotoId`)
    REFERENCES `tagshop`.`Photo` (`PhotoId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `tagshop`.`Weights`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tagshop`.`Weights` ;

CREATE TABLE IF NOT EXISTS `tagshop`.`Weights` (
  `WeightsId` BIGINT NOT NULL AUTO_INCREMENT,
  `BaseDate` VARCHAR(8) NOT NULL,
  `wLinks` DOUBLE NULL DEFAULT 0.0,
  `wBuyLinks` DOUBLE NULL DEFAULT 0.0,
  `wComments` DOUBLE NULL DEFAULT 0.0,
  `wBuyCmts` DOUBLE NULL DEFAULT 0.0,
  `wRepost` DOUBLE NULL DEFAULT 0.0,
  `wFollowing` DOUBLE NULL DEFAULT 0.0,
  PRIMARY KEY (`WeightsId`, `BaseDate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
