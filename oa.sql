/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.62-community : Database - oa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `oa`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `did` bigint(20) NOT NULL AUTO_INCREMENT,
  `dname` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`did`,`dname`,`description`) values (4,'研发部','研发部很多男的'),(5,'学生会','学生会有很多学生'),(6,'现代教育','掌握软件开发'),(7,'销售部','卖软件的一年行情好可以赚不少'),(11,'就业部','奥术大师多'),(12,'古代教育','掌握古代文言文'),(13,'人事部',NULL);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `mid` bigint(20) NOT NULL DEFAULT '0',
  `pid` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `isParent` bit(1) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`mid`,`pid`,`name`,`isParent`,`icon`,`url`) values (1,0,'办公自动化','','css/images/MenuIcon/FUNC20082.gif',NULL),(2,1,'个人办公','','css/images/MenuIcon/FUNC20001.gif',''),(3,1,'审批流转','','css/images/MenuIcon/FUNC20057.gif',NULL),(4,1,'知识管理','\0','css/images/MenuIcon/FUNC20056.gif',NULL),(5,1,'管理行政','','css/images/MenuIcon/manager.gif',NULL),(6,1,'人力资源','','css/images/MenuIcon/FUNC20001.gif',NULL),(7,1,'电子邮件','\0','css/images/MenuIcon/eml.gif',NULL),(8,1,'实用工具','','css/images/MenuIcon/FUNC20076.gif',NULL),(9,1,'个人设置','','css/images/MenuIcon/FUNC20001.gif',NULL),(10,1,'系统管理','','css/images/MenuIcon/system.gif',NULL),(11,1,'权限管理','','css/images/MenuIcon/system.gif',NULL),(21,2,'个人考勤','\0','css/images/MenuIcon/FUNC20054.gif',NULL),(22,2,'日程安排','\0','css/images/MenuIcon/FUNC20064.gif',NULL),(23,2,'工作计划','\0','css/images/MenuIcon/FUNC20069.gif',NULL),(24,2,'工作日记','\0','css/images/MenuIcon/FUNC20056.gif',NULL),(25,2,'通讯录','\0','css/images/MenuIcon/time_date.gif',NULL),(31,3,'审批流程管理','\0','css/images/MenuIcon/manager.gif',NULL),(32,3,'表单模板管理','\0','css/images/MenuIcon/formmodel.gif',NULL),(33,3,'发起申请','\0','css/images/MenuIcon/FUNC241000.gif',NULL),(34,3,'审批申请','\0','css/images/MenuIcon/FUNC20029.gif',NULL),(35,3,'状态查询','\0','css/images/MenuIcon/FUNC20029.gif',NULL),(51,5,'考勤管理','\0','css/images/MenuIcon/FUNC20070.gif',NULL),(52,5,'会议管理','\0','css/images/MenuIcon/FUNC20064.gif',NULL),(53,5,'车辆管理','\0','css/images/MenuIcon/radio_blue.gif',NULL),(61,6,'档案管理','\0','css/images/MenuIcon/FUNC20076.gif',NULL),(62,6,'培训记录','\0','css/images/MenuIcon/FUNC55000.gif',NULL),(63,6,'奖赏记录','\0','css/images/MenuIcon/FUNC55000.gif',NULL),(64,6,'职位变更','\0','css/images/MenuIcon/FUNC55000.gif',NULL),(65,6,'人事合同','\0','css/images/MenuIcon/FUNC55000.gif',NULL),(66,6,'薪酬制度','\0','css/images/MenuIcon/FUNC20001.gif',NULL),(81,8,'车票预定','\0','css/images/MenuIcon/FUNC220000.gif',NULL),(82,8,'GIS查询','\0','css/images/MenuIcon/search.gif',NULL),(83,8,'邮政编码','\0','css/images/MenuIcon/FUNC69000.gif',NULL),(91,9,'个人信息','\0','css/images/MenuIcon/FUNC20001.gif',NULL),(92,9,'密码修改','\0','css/images/MenuIcon/FUNC61000.gif',NULL),(101,10,'岗位管理','\0','css/images/MenuIcon/FUNC20001.gif','/post/list.do'),(102,10,'部门管理','\0','css/images/MenuIcon/department.gif','/department/list.do'),(103,10,'用户管理','\0','css/images/MenuIcon/FUNC20001.gif','/user/page.do');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `post` */

insert  into `post`(`pid`,`pname`,`description`) values (1,'超级管理员','超级管理员有一切权限'),(3,'研发经理','负责项目课程的研发'),(4,'销售主管','负责管理公司的销售业务'),(6,'普通员工','基层岗位123123213'),(8,'CEO','大佬');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`email`,`sex`,`department_id`) values (14,'张三','202cb962ac59075b964b07152d234b70','asdfas@qq.com','女',7),(15,'李四','202cb962ac59075b964b07152d234b70','asdfas@qq.com','女',6),(16,'王五','47bce5c74f589f4867dbd57e9ca9f808','asdfas@qq.com','女',7),(17,'赵六','0b7691d86d96aebd21dd9e138f90840','asdfas@qq.com','男',5),(18,'哈哈','0b7691d86d96aebd21dd9e138f90840','123123','女',7),(19,'嘿嘿','0b7691d86d96aebd21dd9e138f90840','asdfas@qq.com','女',7),(20,'小王','e10adc3949ba59abbe56e057f20f883e','222@qq.com','女',7),(21,'张三','e10adc3949ba59abbe56e057f20f883e','123123@qq.com','女',4),(22,'嘿嘿','e10adc3949ba59abbe56e057f20f883e','123123@qq.com','男',5),(24,'admin','202cb962ac59075b964b07152d234b70','13294158776@163.com','男',6);

/*Table structure for table `user_menu` */

DROP TABLE IF EXISTS `user_menu`;

CREATE TABLE `user_menu` (
  `uid` bigint(11) NOT NULL DEFAULT '0',
  `mid` bigint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_menu` */

insert  into `user_menu`(`uid`,`mid`) values (16,1),(16,5),(16,52),(16,6),(16,62),(16,63),(18,1),(18,3),(18,31),(18,32),(18,33),(18,34),(18,35),(19,1),(19,2),(19,21),(19,22),(19,23),(19,24),(19,25),(20,1),(20,5),(20,51),(20,6),(20,62),(15,1),(15,2),(15,21),(15,22),(15,23),(15,24),(15,25),(24,1),(24,2),(24,21),(24,22),(24,23),(24,24),(24,25),(24,6),(24,61),(24,62),(24,63),(24,64),(24,65),(24,66),(24,7),(24,8),(24,81),(24,82),(24,83),(24,9),(24,91),(24,92),(24,10),(24,101),(24,102),(24,103),(24,11),(14,1),(14,2),(14,21),(14,22),(14,23),(14,24),(14,25),(14,3),(14,4),(14,6),(14,8),(14,81),(14,82),(14,83),(14,10),(14,101),(14,102),(14,103);

/*Table structure for table `user_post` */

DROP TABLE IF EXISTS `user_post`;

CREATE TABLE `user_post` (
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_post` */

insert  into `user_post`(`user_id`,`post_id`) values (14,1),(15,1),(15,3),(15,4),(16,3),(16,4),(17,1),(17,4),(18,4),(19,4),(20,1),(20,4),(21,1),(21,3),(22,4),(30,1),(30,4),(24,1),(24,8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
