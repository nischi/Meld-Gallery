CREATE TABLE `||PRE||mg_display` (
  `displayID` char(35) NOT NULL,
  `displayTypeID` char(35) NOT NULL,
  `objectID` char(35) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateLastUpdate` datetime NOT NULL,
  `siteID` varchar(25) NOT NULL,
  `params` text,
  `notes` text,
  `isActive` tinyint(3) unsigned DEFAULT '0',
  `adminID` char(35) DEFAULT NULL,
  `moduleID` char(35) DEFAULT NULL,
  `contentID` char(35) DEFAULT NULL,
  `isValid` tinyint(3) unsigned DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`displayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `||PRE||mg_displayimage` (
  `displayImageID` char(35) NOT NULL,
  `displayID` char(35) NOT NULL,
  `imageID` char(35) DEFAULT NULL,
  `isProcessed` tinyint(3) unsigned DEFAULT '0',
  `isValid` tinyint(3) unsigned DEFAULT '0',
  `fileID` char(35) DEFAULT NULL,
  `attempts` tinyint(3) unsigned DEFAULT '0',
  `processDate` datetime DEFAULT NULL,
  `isProcessingID` char(35) DEFAULT NULL,
  `dateCreate` datetime NOT NULL,
  `dateLastUpdate` datetime NOT NULL,
  `isExternal` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `linkURL` varchar(150) DEFAULT NULL,
  `isMuraGallery` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`displayImageID`),
  UNIQUE KEY `idxDisplayImage` (`displayID`,`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `||PRE||mg_displaytype` (
  `displaytypeid` char(35) NOT NULL,
  `objectID` char(35) DEFAULT NULL,
  `package` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text,
  `settings` text,
  `isConfigurable` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isActive` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `version` varchar(12) NOT NULL,
  `defaults` text,
  `moduleID` char(35) DEFAULT NULL,
  PRIMARY KEY (`displaytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `||PRE||mg_displaytype` (`displaytypeid`,`objectID`,`package`,`name`,`description`,`settings`,`isConfigurable`,`isActive`,`version`,`defaults`,`moduleID`) VALUES 
 ('095DE279-1D6B-4BC2-B85B85203322F805','','galleryview','Gallery View (jQuery)','Creates a \'GalleryView\' jQuery gallery with film strip','{\"requiresImageGroup\":true}',1,1,'1.0','{\"thumbwidth\":50,\"thumbheight\":50,\"imagewidth\":600,\"imageheight\":450,\"thumbresizetype\":\"crop\",\"resizetype\":\"cropresize\",\"aspecttype\":\"AspectXY\",\"showCaption\":\"false\",\"showDescription\":\"true\",\"panels\":\"true\",\"filmstrip\":\"true\",\"speed\":750,\"interval\":8000,\"overlaypos\":\"bottom\",\"overlayheight\":80}',NULL),
 ('7AB6608A-9BF3-45DC-BD7963F76629EBD8','','cycle','Cycle (jQuery)','Multiple transition effects and formats','{\"requiresImageGroup\":true}',1,1,'1.0','{\"resizetype\":\"cropresize\",\"style\":\"dotnav\",\"interval\":\"5000\",\"speed\":\"500\",\"aspecttype\":\"AspectX\",\"imageheight\":\"450\",\"imagewidth\":\"600\",\"pauseonnav\":\"1\",\"effect\":\"fade\"}',NULL),
 ('E4277F8F-BE07-4788-987F97A33E1AA4EE','','popeye','PopEye Gallery (jQuery)','Creates a PopEye jQuery gallery','{\"requiresImageGroup\":true}',1,1,'1.0','{\"thumbheight\":\"200\",\"aspecttype\":\"AspectX\",\"imageheight\":\"300\",\"showcaption\":\"true\",\"imagewidth\":\"400\",\"direction\":\"right\",\"resizetype\":\"cropresize\",\"thumbwidth\":\"200\"}',NULL),
 ('F72E1EA3-3CEE-4613-B2E6B5BBB0807DF0','','shadowbox','ShadowBox','Creates a Mura-style gallery with ShadowBox component','{\"requiresImageGroup\":true}',1,1,'1.0','{\"showname\":\"true\",\"thumbheight\":\"100\",\"aspecttype\":\"AspectXY\",\"imageheight\":\"450\",\"showcaption\":\"false\",\"imagewidth\":\"600\",\"resizetype\":\"cropresize\",\"thumbwidth\":\"100\"}',NULL);

CREATE TABLE `||PRE||mg_image` (
  `imageID` char(35) NOT NULL,
  `fileID` char(35) NOT NULL,
  `caption` varchar(150) DEFAULT NULL,
  `description` longtext,
  `tags` varchar(255) DEFAULT NULL,
  `categoryID` char(35) DEFAULT NULL,
  `dateCreate` datetime NOT NULL,
  `dateLastUpdate` datetime NOT NULL,
  `siteID` varchar(45) NOT NULL,
  `linkURL` varchar(150) DEFAULT NULL,
  `friendlyName` varchar(150) DEFAULT NULL,
  `isActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) DEFAULT NULL,
  `adminID` char(35) DEFAULT NULL,
  `summary` longtext,
  `name` varchar(150) DEFAULT NULL,
  `remoteID` char(35) DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  KEY `idxSearch` (`caption`,`tags`,`description`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `||PRE||mg_imagegroup` (
  `imageGroupID` char(35) NOT NULL,
  `name` varchar(145) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dateCreate` datetime NOT NULL,
  `dateLastUpdate` datetime NOT NULL,
  `adminID` char(45) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `siteID` varchar(45) NOT NULL,
  `isActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`imageGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `||PRE||mg_imagegroupimage` (
  `imageGroupID` char(35) NOT NULL,
  `imageID` char(35) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `description` text,
  `imageClass` varchar(25) DEFAULT NULL,
  `textClass` varchar(25) DEFAULT NULL,
  `orderNo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`imageGroupID`,`imageID`),
  KEY `idxOrderNo` (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `||PRE||mg_setting` (
  `settingsID` char(35) NOT NULL,
  `siteID` varchar(25) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateLastUpdate` datetime NOT NULL,
  `isMaster` tinyint(3) unsigned NOT NULL,
  `imageWidth` int(10) unsigned NOT NULL DEFAULT '1000',
  `imageHeight` int(10) unsigned NOT NULL DEFAULT '750',
  `imageWidthMedium` int(10) unsigned NOT NULL DEFAULT '250',
  `imageHeightMedium` int(10) unsigned NOT NULL DEFAULT '250',
  `imageWidthSmall` int(10) unsigned NOT NULL DEFAULT '40',
  `imageHeightSmall` int(10) unsigned NOT NULL DEFAULT '40',
  `imageResizeType` varchar(45) NOT NULL DEFAULT 'Resize',
  `imageAspectType` varchar(45) NOT NULL DEFAULT 'AspectX',
  `imageQualityType` varchar(45) NOT NULL DEFAULT 'highestQuality',
  `imageResizeTypeMedium` varchar(45) NOT NULL DEFAULT 'CropResize',
  `imageAspectTypeMedium` varchar(45) NOT NULL DEFAULT 'Square',
  `imageQualityTypeMedium` varchar(45) NOT NULL DEFAULT 'mediumQuality',
  `imageResizeTypeSmall` varchar(45) NOT NULL DEFAULT 'CropResize',
  `imageAspectTypeSmall` varchar(45) NOT NULL DEFAULT 'Square',
  `imageQualityTypeSmall` varchar(45) NOT NULL DEFAULT 'mediumQuality',
  `imageCropType` varchar(45) NOT NULL DEFAULT 'BestXY',
  `imageCropTypeMedium` varchar(45) NOT NULL DEFAULT 'BestXY',
  `imageCropTypeSmall` varchar(45) NOT NULL DEFAULT 'BestXY',
  `defaultDisplayTypeID` char(35) DEFAULT NULL,
  `fileSizeLimit` int(10) unsigned NOT NULL DEFAULT '1500',
  `SyncInfo` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`settingsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `||PRE||mg_setting` (`settingsID`,`siteID`,`dateCreate`,`dateLastUpdate`,`isMaster`,`imageWidth`,`imageHeight`,`imageWidthMedium`,`imageHeightMedium`,`imageWidthSmall`,`imageHeightSmall`,`imageResizeType`,`imageAspectType`,`imageQualityType`,`imageResizeTypeMedium`,`imageAspectTypeMedium`,`imageQualityTypeMedium`,`imageResizeTypeSmall`,`imageAspectTypeSmall`,`imageQualityTypeSmall`,`imageCropType`,`imageCropTypeMedium`,`imageCropTypeSmall`,`defaultDisplayTypeID`,`fileSizeLimit`,`SyncInfo`) VALUES 
('00000001-0001-0001-0000000000000001','default','2010-09-02 01:04:16','2011-01-08 14:38:07',0,1200,900,200,200,40,40,'resize','AspectX','highestQuality','cropresize','','mediumQuality','cropresize','','mediumQuality','BestXY','BestXY','BestXY','095DE279-1D6B-4BC2-B85B85203322F805',5000,0);
