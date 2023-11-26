-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef` (
  `chef_id` varchar(10) NOT NULL,
  `chef_name` varchar(50) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`chef_id`),
  UNIQUE KEY `username` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES ('CHEF001','Alice Johnson','alice_j@gmail.com','pass123'),('CHEF002','Bob Smith','bob_smith@gmail.com','secure456'),('CHEF003','Charlie Davis','charlie_d@gmail.com','pass789'),('CHEF004','David Anderson','david_a@gmail.com','secret123'),('CHEF005','Eva White','eva_w@gmail.com','password123'),('CHEF006','Frank Brown','frank_b@gmail.com','newpass789'),('CHEF007','Grace Green','grace_g@gmail.com','pass456'),('CHEF008','Henry Taylor','henry_t@gmail.com','secure789'),('CHEF009','Isabella Miller','isabella_m@gmail.com','pass789'),('CHEF010','James Brown','james_b@gmail.com','newpass456');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('1','Side Dish'),('10','World Breakfast'),('11','One Pot Dish'),('12','Snack'),('13','Brunch'),('2','Appetizer'),('3','Main Course'),('4','Lunch'),('5','Dinner'),('6','Dessert'),('7','Indian Breakfast'),('8','North Indian Breakfast'),('9','South Indian Breakfast');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `cuisine_id` varchar(10) NOT NULL,
  `cuisine_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cuisine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES ('1','Continental'),('10','Pakistani'),('11','Indo Chinese'),('12','Chinese'),('13','Fusion'),('14','Nepalese'),('15','Sri Lankan'),('16','Arab'),('17','Afghan'),('2','Indian'),('3','Thai'),('4','Asian'),('5','Middle Eastern'),('6','Korean'),('7','African'),('8','Sichuan'),('9','Mughlai');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `phone_number` decimal(10,0) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','John',8478292878,'john@gmail.com','john@123'),('10','Sally',9837283746,'sally@gmail.com','sally@123'),('2','Sarah',9873564789,'sarah@gmail.com','sarah@123'),('3','Sahithi',9182638299,'sahithi@gmail.com','sahithi@123'),('4','Martha',6271836783,'martha@gmail.com','martha@123'),('5','Jyothika',8272919048,'jyothika@gmail.com','jyothika@123'),('6','George',7483728987,'george@gmail.com','george@123'),('7','Leia',2637890489,'leia@gmail.com','leia@123'),('8','Sam',8574892857,'sam@gmail.com','sam@123'),('9','Adam',6758392898,'adam@gmail.com','adam@123');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `order_id` varchar(10) NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `chef_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `chef_id` (`chef_id`),
  CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`chef_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES ('ORDER001','2023-11-23','Completed','CHEF001'),('ORDER002','2023-11-24','Accepted','CHEF002'),('ORDER003','2023-11-25','Completed','CHEF003'),('ORDER004','2023-11-26','Pending','CHEF004'),('ORDER005','2023-11-27','In Progress','CHEF001'),('ORDER006','2023-11-28','Completed','CHEF006'),('ORDER007','2023-11-29','In Progress','CHEF009'),('ORDER008','2023-11-30','Completed','CHEF008'),('ORDER009','2023-11-29','Completed','CHEF010'),('ORDER011','2023-11-30','Completed','CHEF007');
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debug`
--

DROP TABLE IF EXISTS `debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `items` varchar(1000) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `current_value` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debug`
--

LOCK TABLES `debug` WRITE;
/*!40000 ALTER TABLE `debug` DISABLE KEYS */;
INSERT INTO `debug` VALUES (6,' 5',2.00,2.00),(7,'',7.00,5.00),(8,' 34.00, 8, 9, 10, 9',23.00,23.00),(9,' 8, 9, 10, 9',57.00,34.00),(10,' 9, 10, 9',65.00,8.00),(11,' 10, 9',74.00,9.00),(12,' 9',84.00,10.00),(13,'',93.00,9.00);
/*!40000 ALTER TABLE `debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet`
--

DROP TABLE IF EXISTS `diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet` (
  `diet_id` varchar(10) NOT NULL,
  `diet_name` varchar(50) NOT NULL,
  PRIMARY KEY (`diet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet`
--

LOCK TABLES `diet` WRITE;
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
INSERT INTO `diet` VALUES ('1','Vegetarian'),('10','Keto Friendly'),('2','High Protein Non Vegetarian'),('3','No Onion No Garlic (Sattvic)'),('4','Non Vegetarian'),('5','Eggetarian'),('6','Diabetic Friendly'),('7','High Protein Vegetarian'),('8','Gluten Free'),('9','Vegan');
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` varchar(10) NOT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES ('FDB001','Great service and delicious food!','1'),('FDB002','The ambiance was fantastic, and the staff was friendly.','2'),('FDB003','The waitstaff was attentive, and the meal was exceptional.','3'),('FDB004','Enjoyed the experience overall. Will definitely come back!','4'),('FDB005','The chef\'s specials were outstanding!','5'),('FDB006','Prompt service and a diverse menu.','6'),('FDB007','Had a wonderful time. The dessert was heavenly.','7'),('FDB008','The staff went above and beyond. A memorable dining experience.','8'),('FDB009','Delightful atmosphere and courteous service.','9'),('FDB010','The presentation of the dishes was impressive. Highly recommended!','10');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_item`
--

DROP TABLE IF EXISTS `food_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_item` (
  `item_id` varchar(10) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_description` varchar(350) DEFAULT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `cuisine_id` varchar(10) DEFAULT NULL,
  `course_id` varchar(10) DEFAULT NULL,
  `diet_id` varchar(10) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `cuisine_id` (`cuisine_id`),
  KEY `course_id` (`course_id`),
  KEY `diet_id` (`diet_id`),
  CONSTRAINT `food_item_ibfk_1` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine` (`cuisine_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `food_item_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `food_item_ibfk_3` FOREIGN KEY (`diet_id`) REFERENCES `diet` (`diet_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_item`
--

LOCK TABLES `food_item` WRITE;
/*!40000 ALTER TABLE `food_item` DISABLE KEYS */;
INSERT INTO `food_item` VALUES ('1','Szechuan Vegetarian Fried Rice','Szechuan Style Vegetarian Fried Rice Recipe is one of the staple meals found in the region of Sichuan (China).',10.99,'8','4','1','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2016/oct-7/Vegetarian_Sichuan_Fried_Rice-1.jpg'),('10','Mughlai Aloo Matar Gobi Recipe','Mughlai Aloo Matar Gobi as the name suggests is a typical Indian side dish higher on the spicy side with the flavors of Ghee, Curd, and fried onion.',13.99,'9','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Hina_Gujral/Mughlai_Aloo_Matar_Gobi_Recipe.jpg'),('11','Pakistani Chickpeas Pulao Recipe With Sweet Hot Date Onion Chutney','Pakistani Chickpeas Pulao Recipe is slightly saucy with the mixture of rice and chickpeas and is packed with spices.',16.99,'10','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Karthika_Gopalakrishnan/Pakistani_Chickpeas_Pulao_with_Sweet_Hot_Date_Onion_Chutney.jpg'),('12','Tofu Fried Rice Recipe','Tofu Fried Rice is a delicious Indo Chinese preparation of rice with vegetables and tofu.',14.99,'12','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Raksha_Kamat/Tofu_Fried_Rice.jpg'),('13','Tuna Rasam Bhaji Recipe (Tuna Sabzi Flavored With Rasam Powder)','Tuna Rasam Bhaji is a dish that goes best with daal and rice. The earthy flavor of the tuna fish paired with crunchy vegetable is delicious.',19.99,'13','1','2','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/roopakamath1997-gmail.com/Tuna_Rasam_sabzi.jpg'),('14','Mushroom Ghee Roast Recipe','Mushroom Ghee Roast Recipe is a finger-licking good recipe made of mushrooms the South Indian way. Cooked in ghee made similar to that of a Mangalorean ghee roast.',18.99,'13','2','1','https://www.archanaskitchen.com/images/archanaskitchen/0-Affiliate-Articles/Mushroom_Ghee_Roast_Recipe_6_1600.jpg'),('15','Nepalese Style Dhal Bhat Recipe','Nepalese Style Dhal Bhat Recipe is a very classical combination of dal and rice that is usually served side by side as a lunch meal.',16.99,'14','4','7','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Nepalese_Style_Dhal_Bhat_Recipe_.jpg'),('16','Mughlai Aloo Lajawab Recipe - Mughlai Aloo Sabzi Recipe','Mughlai Aloo Lajawab Recipe is a rich and luscious potato gravy, which originates from the house of Nawabs. The potatoes are roasted and then simmered in a thick cashew, cream, tomato-based gravy.',21.99,'9','3','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/nithya.anantham/Mughlai_Aloo_Lajawab_Recipe.jpg'),('17','Mushroom Masala Cheese Omelette Recipe','Mushroom Masala Cheese Omelette Recipe is a wholesome and high protein omelette that is packed with taste from mushrooms, green chillies, and coriander. The addition of cheese adds to the creaminess and fluffiness.',14.99,'1','8','2','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/admin/Mushroom_Masala_Cheese_Omelette_Recipe.jpg'),('18','Mughlai Zafrani Murg Recipe','Mughlai Zafrani Murg Recipe is a delicious recipe made with chicken in yogurt gravy, flavored with saffron.',24.99,'9','2','4','https://www.archanaskitchen.com/images/archanaskitchen/Indian_Non_Veg_Recipes/Mughlai_zafrani_murg_recipe.JPG'),('19','Mughlai Keema Paratha Recipe','Mughlai Keema Paratha is a classic recipe of street food found on the streets of Bengal of a stuffed paratha with a layer of egg and spicy mutton keema wrapped to make a lifafa-envelope style flaky parathas',13.99,'9','3','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/shaheen_ali/Mughlai_Kheema_Paratha_.jpg'),('2','Veg Mughlai Paratha Recipe','Veg Mughlai Paratha Recipe is a paratha where crumbled paneer tossed with veggies is cooked in ground spices and filled with eggs in Indian Flat Bread to shape a thick fat square packet and served with tangy mint and coriander chutney.',12.99,'9','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Veg_Mughlai_Paratha_Recipe.jpg'),('20','Baklava Rolls Recipe - Turkish Sweet Rolls','Baklava is a Middle Eastern sweet/dessert made from phyllo sheets and nuts that are soaked in syrup.',12.99,'5','6','1','https://www.archanaskitchen.com/images/archanaskitchen/Dessert_Gourmet_Favorites/baklava_rolls_recipe_shutterstock_126929408.jpg'),('21','Mushroom Corn Masala Dosa Recipe Using Ragi Idli Dosa Batter','Mushroom Corn Masala Dosa Recipe Using Ragi Idli Dosa Batter is a fusion recipe, where a crispy South Indian Ragi dosa is stuffed with chatpata pav bhaji Corn & Mushroom masala.',14.99,'13','9','1','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2019/Mushroom_Corn_Masala_Dosa_Using_Ragi_Idli_Dosa_Batter_Video__8_1600.jpg'),('22','Schezwan Masala Dosa Recipe Using Classic Idli Dosa Batter','The Schezwan Masala Dosa or Dosa is a famous Mumbai street food combining the Indo Chinese flavors which are loved by one and all.',15.99,'13','12','1','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2019/Schezwan_Masala_Dosa_Recipe_Using_Classic_Idli_Dosa_Batter_34_1600.jpg'),('23','Paneer Chilli Dosa Recipe - Spicy Cottage Cheese Dosa','Paneer Chilli Dosa is a healthy fusion breakfast dish. The filling for this dosa is full of nutrition from the vegetables and paneer. The Paneer chili filling is easy to make and has the familiar flavors of Indo Chinese.',17.99,'13','7','7','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Jyothi_Rajesh/Paneer_Chili_Dosa.jpg'),('24','Cheesy Masala Omelette Recipe With Roasted Vegetables','Cheesy Masala Omelette With Roasted Vegetables Recipe is a wholesome omelette loaded with vegetables like baby corn and red bell peppers and then cooked along with cheese which adds to the deliciousness of this dish.',16.99,'1','11','5','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2019/Cheesy_Veg_Omelette_With_Asian_Roasted_Vegetables_Britanna_Cheesy_Kitchen_Recipe_videos_3_1600.jpg'),('25','Watalappan Recipe - Steamed Egg Pudding With Jaggery','Watalappan Recipe is a traditional pudding made using Kithul jaggery, eggs and fresh coconut milk.',13.99,'15','6','5','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/contact-tastepot.com/Watalappan.jpg'),('26','Apple And Raisin Chutney Recipe','Apple and Raisin Chutney Recipe is a British style savory spread made with apples and raisin and a hint of cinnamon that provides the much-required warmth.',11.99,'1','13','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Hina_Gujral/Apple_and_Raisin_Chutney_Recipe_1600.jpg'),('27','Mughlai Bhindi Recipe - Spicy Okra Curry','Mughlai Bhindi is the vegetarian version of the rich and diverse Mughlai cuisine.',14.99,'9','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Nusrath_Jahan/Mughlai_bhindi_recipe_okra_curry_1600.jpg'),('28','Kesar Pista Phirni Recipe','The Kesar Pista Phirni is a traditional dessert made during festivals like Ramadan. Basmati rice is ground into a coarse paste and then cooked in milk along with cardamom and saffron which adds to the delicious flavour and taste.',13.99,'9','6','1','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2019/Kesar_Pista_Phirni_video_recipe_11_1600.jpg'),('29','Traditional Shahi Tukda Recipe - Hyderabadi Double Ka Meetha','Shahi Tukda Recipe is a delicious and yet simple sweet dish made with ghee-roasted bread that is topped with a creamy kesar Rabri and nuts. The addition of spices like saffron and cardamom along with rose water, pistachios, and almonds in the Rabri brings in delectable flavours and taste to the dish.',15.99,'9','6','1','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2019/Shahi_Tukda_video_Recipe_Hyderabadi_Dessert_Double_Ka_meetha_21_1600.jpg'),('3','Chicken Keema Paratha Recipe - Minced Chicken Flat Bread','Chicken Keema Paratha Recipe is a delicious high protein paratha where the chicken keema is delicately spiced with garam masala and then stuffed into atta to make a crispy flaky paratha.',15.99,'9','4','2','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2018/Chicken_Keema_Paratha_Recipe-1.jpg'),('30','Pakistani Style Tinde Ki Tarkari Recipe - Apple Gourds Cooked With Tomatoes','Pakistani Style Tinde Ki Tarkari Recipe is an Apple Gourd\'s curry recipe cooked with tomatoes.',15.99,'10','1','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/nithya.anantham/Tinde_Ki_Tarkari_Pakistani_Style_Apple_Gourds_Cooked_With_Tomatoes.jpg'),('31','Paneer Bhutuwa Recipe -Nepalese Paneer Curry','This a vegetarian version of famous Nepalese dish \"Lamb Bhutuwa\" which is often sold at roadside eateries.',12.99,'14','4','7','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/garimasgautam-gmail.com/Paneer_Bhutuwa.jpg'),('32','Mughlai Style Aloo Matar Gobi Gravy Recipe','Mughlai Style Aloo Matar Gobi Curry/Sabzi Recipe is a rich onion-based gravy that will keep you wanting to eat more than just one serving. This curry is prepared with day-to-day vegetables such as Potato/Aloo, Matar/Peas, and Gobi/Cauliflower, but the gravy it is cooked in gives it that extra flavor to these humble vegetables.',12.99,'9','3','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/swathynandhini/Mughlai_Style_Aloo_Matar_Gobi_Curry_Gravy_Recipe.jpg'),('33','One Pot Chickpea And Brinjal Curry Recipe','One Pot Chickpea and Brinjal Curry Recipe is a flavorful dish that has just everything in one curry. The curry consists of chickpeas, brinjals, lightly ripened raw mango that are stewed in rich coconut milk along with whole spice like star anise, cinnamon, and cardamom.',14.99,'3','3','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/One_Pot_Chickpea_and_Brinjal_Curry_Recipe.jpg'),('34','Shabnam Curry Recipe - Mughlai Style Mushroom And Peas Gravy','Shabnam Curry is a creamy dish from the Mughlai Cuisine.',13.99,'9','3','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/varshajchhabria-gmail.com/Shabnam_Curry__1600.jpg'),('35','Kunafa With Mango Cottage Cheese Cream Recipe','Kunafa With Mango Cottage Cheese Cream is a quintessential Arabic Dessert. Kunafa is made by baking Kataifi dough with the center layer made of cheese.',15.99,'16','6','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Shalu_Jain/KUNAFA_WITH_MANGO_COTTAGE_CHEESE_CREAM.jpg'),('36','Alu Bukhara Murgh Recipe - Chicken With Indian Plums','Alu Bukhara Murgh is a delicacy that comes from the Nizam province. The dish is also majorly cooked in various parts of Awadh and also loved in Pakistan. Usually, the delicacy is prepared with goat meat. But now with the passage of time, Indian plums got a whole new look when cooked with chicken.',16.99,'10','4','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Shaheen_Ali/Alu_Bhukhara_Murgh__Chicken_cooked_with_Indian_Plums.jpg'),('37','Lavand-E-Murgh Recipe - Afghani Chicken In Yoghurt Gravy','Lavand-e-murgh is a rich, creamy chicken curry where chicken is slow-cooked in yoghurt along with spices to create a tasty, satisfying, and delicious dish.',18.99,'17','5','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/foodiemomskitchen-gmail.com/Lavand_e_Murgh_in_Yoghurt.jpg'),('38','Chilli Paneer & Oats Dosa Recipe','Chilli Paneer & Oats Dosa Recipe is a Chinese twist given to the regular dosa.',13.99,'13','12','1','https://www.archanaskitchen.com/images/archanaskitchen/0-Saffola_FitFoodie/5-chilli_paneer_and_oats_dosa_recipe.jpg'),('39','Andhra Cheese & Vegetables Pesarattu Recipe','Andhra Cheese Vegetables Pesarattu Recipe is a fusion recipe where a pesarattu is made with cheese and veggies topping. This pesarattu is prepared with moong beans.',9.99,'13','9','7','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/panditp253-gmail.com/ANDHRA_Style_PESARATTU_PIZZA_recipe_edited.jpg'),('4','Mughlai Style Chicken Haleem Recipe','Haleem is a Mughlai recipe popular in Hyderabad. Haleem is usually made from lamb/mutton with chana dal and broken wheat.',18.99,'9','3','2','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/jyothir/mughlai-style-chicken-haleem-recipe-edited.jpg'),('40','Chicken Dimsums Recipe - Steamed Chicken Dumplings','The delicious appetizers filled with yummy stuffings surely steal the show on the dinner table. They are easy to make and require a few ingredients. The spiced Chicken stuffing makes it even more delicious.',15.99,'4','2','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/garimasgautam-gmail.com/Chicken_Dimsums.jpg'),('41','Bread Halwa Recipe','Bread Halwa also called as Double Ka Meetha is a delicious dessert recipe that originated during the Mughals and Nizam Era.',8.99,'9','6','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/shaheen_ali/Bread_Halwa.jpg'),('42','Mughlai Fish Curry Recipe','Mughlai Fish Curry Recipe is a rich and yet spicy flavored curry that is cooked along with Mackerel fish to create a wonderful side dish that can go along with pulao, hot steamed rice, or just plain with phulka. The gravy has a different twist to the usual coconut-based curry.',16.99,'9','3','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Mughlai_fish_curry_Recipe.jpg'),('43','Spinach And Sweet Potato Kofta In Green Curry Recipe','Spinach and Sweet Potato Kofta in Green Curry Recipe is a western version of koftas cooked in a luscious green curry made with a blend of coriander and mint leaves. The curry has a bursting of flavors when seasoned well with some dried oregano and cinnamon powder.',14.99,'1','3','7','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Spinach_and_Sweet_Potato_Kofta_in_Green_Curry_Recipe_.jpg'),('44','Sri Lankan Egg Curry Recipe','Sri Lankan Egg Curry Recipe belongs to authentic Sri Lankan cuisine which is a result of colonial influence on trade and culture. Sri Lankan curry powder is used to build the essential aroma and flavor to this Egg Curry Recipe. This amazingly aromatic curry powder is also used in nonveg preparations as well.',13.99,'15','3','5','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Shaheen_Ali/SRI_LANKAN_EGG_CURRY.jpg'),('45','Sri Lankan Style Fried Egg Curry Recipe','Sri Lankan Style Fried Egg Curry Recipe is a comforting spicy egg curry recipe and is also cooked in rich coconut milk.',12.99,'15','3','5','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Srilankan_Style_Fried_Egg_Curry_Recipe_.jpg'),('46','Shahi Vegetable Pulao Recipe','The Shahi Vegetable Pulao recipe is a royal dish that has a perfect blend of spices. The addition of dry fruits, along with saffron and Kohinoor Authentic Basmati Rice heightens the flavor of the dish.',16.99,'9','3','8','https://www.archanaskitchen.com/images/archanaskitchen/Indian_Rice/Shahi_Vegetable_Pulao_Recipe_With_Kohinoor_Platinum_Basmati_Rice-1.jpg'),('47','Italian Cheese And Basil Uttappam Recipe','Italian Cheese And Basil Uttapam Recipe is a wonderful fusion recipe of Indian Uttapam blended with Italian flavors of basil and parmesan cheese. Uttapam are fluffy savory pancakes made with rice and Urad Dal flour and topped with various toppings like, potato, onion, tomato, coconut etc.',14.99,'13','2','7','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Shaheen_Ali/ITALIAN_CHEESE_AND_BASIL_UTTAPPAM.jpg'),('48','Quinoa Vegetable Upma Recipe','Quinoa Vegetable Khichdi Recipe is a hearty preparation of quinoa, vegetables and spices, cooked together in a single pot.',15.99,'13','6','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Divya_Shivaraman_/Quinoa_Vegetable_Kichadi.jpg'),('49','Ceylon Egg Parotta Recipe','Ceylon Egg Parotta Recipe is also one of the very famous street dishes originating from Sri Lanka. The Parotta is stuffed with mutton kheema or even seafood along with egg and other vegetables.',13.99,'15','5','5','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2017/20-nov/Srilankan_Ceylon_Egg_Muttai_Parotta_Paratha_Recipe-1_1600.jpg'),('5','Shahjahani Khichdi Recipe - Spiced Green Moong Dal Khichdi','Shahjahani Khichdi Recipe is a wholesome dish from the Mughlai cuisine, where the green moong dal is cooked along with rice and tossed along with whole spices and cashew nuts.',14.99,'9','4','7','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Shahjahani_Khichdi_Recipe_Green_Moong_Dal_Rice.jpg'),('50','Veechu Parotta Or Ceylon Parotta Recipe','Veechu Parotta Recipe is a very famous bread in Sri Lanka mainly made from maida or all-purpose flour.',9.99,'15','4','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Veechu_Parotta_Recipe_.jpg'),('51','Tangy & Spicy Chunky Pineapple Chutney Recipe','Tangy & Spicy Chunky Pineapple Chutney Recipe is a delicious chutney with minimal cooking and absolutely no grinding.',5.99,'15','4','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sneha-archanaskitchen.com/Tangy__Spicy_Pineapple_Chunky_Chutney_Recipe.jpg'),('52','Peshawari Karahi Gosht Recipe','Peshawari Karahi Gosht Recipe is a dish that is prepared during almost all the main festivals in Pakistan. The pulpy tomatoes give a rich and tangy flavor to the mutton when it is cooked in the pressure cooker.',17.99,'10','4','5','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Peshawari_Karahi_Gosht_Recipe.jpg'),('53','Nepalese Mutton Curry Recipe','Nepalese Mutton Curry, also known as Khasi Ko Masu, is a common household recipe from Nepal often served with beaten rice. It is a fiery traditional curry from our lovely neighboring country. It is typically cooked in a pressure cooker on low heat, which brings out all the flavor from spices.',18.99,'14','5','5','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/garimasgautam-gmail.com/Nepalese_mutton_Curry_recipe_edited1.JPG'),('54','Mutton Chaap Recipe - Slow Cooked Lamb Chops','Slow-cooked goat ribs/meat chops with aromatic Indian spices like cardamom, cinnamon, saffron.',21.99,'9','2','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/ruby_pathak-yahoo.com/Mutton_Chaap.jpg'),('55','Lahori Aloo Recipe','Lahori Aloo is a rich yet spicy curry which gets tanginess from tomatoes and creaminess from the dry coconut, poppy seeds and milk. This curry made with baby potatoes is perfect with poori, parathas or even rice.',14.99,'10','4','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Monika_Manchanda/Lahori_Aloo.jpg'),('56','Asian Chicken Noodle Soup Recipe','Asian Chicken Noodle Soup Recipe is a comforting soup recipe that you must try when one is craving for a nice hot bowl packed with Asian flavors. This soup has everything in just one bowl.',10.99,'4','1','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Asian_Chicken_Noodle_Soup_Recipe.jpg'),('57','Chicken Korma Recipe - Mughlai Style Chicken Curry','Korma is an Indian style Mughlai gravy with marinated chicken or vegetables. A dish dates back to the 16th century prepared in the Mughal kitchen and said to have been served to Shah Jahan and his guests at the Taj Mahal inauguration, as mentioned in the history.',18.99,'9','2','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/ruby_pathak-yahoo.com/Chicken_Korma.jpg'),('58','Nepalese Chicken Sekuwa Recipe','Nepalese Chicken Sekuwa Recipe is a popular street food from Nepal. Traditionally it is cooked on an open charcoal grill, besides we have used an oven here to make it much more convenient for home cooking.',16.99,'14','1','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/garimasgautam-gmail.com/Nepalese_Chicken_Sekuwa.jpg'),('59','Chicken Pasanda Recipe','Chicken Pasanda Recipe was a favorite dish in the courts of the Mughal emperors. It was popular meat dish among the courtyards.',19.99,'9','4','5','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Pakistani_Style_Chicken_Pasanda_Recipe.jpg'),('6','Pakistani Bhuna Gosht Recipe','Pakistani Bhuna Gosht is a delicacy with mutton pieces slow-cooked in whole spices, chopped onion and ginger garlic is later fried (bhuna) with lots of ghee and garnished with coriander.',21.99,'10','5','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Shaheen_Ali/PAKISTANI_BHUNA_GOSHT.jpg'),('60','Peanut Butter Chicken Recipe','When the heart wants Indian but the tastebuds want a bit more what do you do? You make peanut butter chicken, douse it with Chinese chilli oil, serve it on a bed of lemon rice and you are set.',22.99,'4','2','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/onewholesomeal-gmail.com/Peanutbutter_chicken.jpg'),('61','Eggless Thandai Mini Cheesecake Recipe','Thandai Mini Cheesecake Recipe is a delicious and creamy dessert that has brilliant flavours from the Thandai Masala and combined along with cream cheese and nuts. The addition of Thandai Masala along with rose water, gives the cheesecake unique refreshing taste to the palate.',15.99,'13','5','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Rupal_Patel/mini_cheese_cake_1600.jpg'),('62','Mushroom Pasanda Recipe (Butter Fried Mushrooms in Tomato Almonds and Cream Gravy)','Mushroom Pasanda is delicious creamy Mughlai gravy made with button mushroom, spices, saffron and cream. The addition of almonds into the curry along with roasted mushrooms and spices, brings out a very festive feel to this dish.',18.99,'9','2','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Farrukh_Aziz_Ansari/Mushroom_Pasanda_Recipe_Butter_Fried_Mushrooms_in_Tomato_Almonds_and_Cream_Gravy.jpg'),('63','Garlic Chickpeas And Spinach Curry Recipe','Garlic Chickpeas And Spinach Curry Recipe is a Middle Eastern-inspired curry with light flavours. It is perfect to serve with roti, rice, breads or just as it is, like soup from the bowl.',16.99,'5','2','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Monika_Manchanda/Garlic_Chickpeas__Spinach_Curry.jpg'),('64','Peshawari Kala Chana Recipe','Peshawari Kala Chana Recipe is simple, yet flavorful with nutritional benefits of sprouted black chickpeas or kala chana.',14.99,'10','4','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Nithya_Anantham/Peshawari_Kala_Chana_Recipe.jpg'),('65','Okra Bamia Recipe','Bamia is a simple Okra (Bhindi) and Tomato stew, popular across the Middle East. Okra is gently simmered with tomatoes to make this classic dish, which can be served with Rice or bread. Meat may also be added to this stew, but this vegetarian version is equally delicious.',14.99,'5','2','10','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Madhuli_Ajay/Bamya_Middle_Eastern_Okra_and_Tomato_stew.jpg'),('66','Black Rice, Barley & Flax Seeds Congee Recipe','This soup or congee is a combination of black rice, barley, flax seeds roasted and powdered coarsely and cooked along with tossed garlic & spinach.',13.99,'4','5','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Neeru_Srikanth/Black_RiceBarley__Flax_seeds_Congee.jpg'),('67','Fenugreek & Egg Fried Rice Recipe (Anda Methi Chawal)','Fenugreek & Egg Fried Rice Recipe (Anda Methi Chawal) is a dish with the addition of fenugreek (methi leaves) and scrambled eggs.',11.99,'11','2','9','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Rekha_Vengalil/Fenugreek_fried_rice_original_1600.jpg'),('68','Egg and Bread Fried Rice Recipe','Egg and Bread Fried Rice is an easy and delicious variety rice.',10.99,'13','5','9','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/swathynandhini/bread_friedrice.jpg'),('69','Crispy Crab Rangoons Recipe','Crab Rangoons or crab wontons are crispy American Chinese snack prepared by wrapping Chinese wontons with crab meat, scallions, cream cheese, with some ginger or garlic and then deep fried.',18.99,'11','1','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/poojanadkarni/Crispy_Crab_Rangoons.jpg'),('7','Murgh Malai Kebab Recipe - Chicken Malai Kebab','Murgh Malai Kebab Recipe is a rich creamy kebab recipe in a white marination of fresh cream, hung yogurt and cheese spread, with the addition of ginger-garlic-green chilli paste, further seasoned with some spice powders like nutmeg and cardamom lending their earthy notes to this royal dish.',24.99,'9','2','4','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2021/Murgh_Malai_Kebab_Recipe_Chicken_Malai_Kebab_1_1600.jpg'),('70','Mande Roti Recipe','Mande Roti Recipe, a flat Indian bread which is flavored with saffron, nutmeg, and cardamom pods.',8.99,'10','5','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl-archanaskitchen.com/Mande_Roti_Recipe_.jpg'),('71','Iranian Baida Curry Recipe','Iranian Baida Curry Recipe is a creamy and comfort egg curry recipe. The gravy is simply made from roasted almonds, poppy seeds, sesame seeds, freshly grated coconut that is ground to make a creamy paste.',14.99,'5','2','9','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2017/10-oct/Iranian_Egg_Curry_Recipe-9424.jpg'),('72','Khamiri Roti Recipe','Khamiri Roti Recipe is a very famous Indian bread that has its origin from Mughalai cuisine.',5.99,'9','5','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Khamiri_Roti_Recipe_.jpg'),('73','Dahi Chivda Recipe (Fruit, Yogurt & Flattened Rice Breakfast Parfait)','Dahi Chivda Recipe is a Fruit, Yogurt, and Flattened Rice Breakfast Parfait. This Dahi Chivda is a no-cook, gluten-free, healthy breakfast parfait that is popular among everyone irrespective of ages.',9.99,'13','1','9','https://www.archanaskitchen.com/images/archanaskitchen/World_Breakfast/Dahi_Chiwda_Recipe_Fruit_Yogurt_and_Flattened_Rice_Breakfast_Parfait-1.jpg'),('74','Mughalai Shahi Kaju Aloo Ki Sabzi Recipe','Mughalai Shahi Kaju Aloo Ki Sabzi is a rich creamy curry prepared with cashews, milk, and curd.',16.99,'9','2','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/KarthikaKrishnan/Mughalai_Shahi_Kaju_Aloo_Ki_Sabzi.jpg'),('75','Nepali Aloo Tareko Recipe','Nepali Aloo Tareko Recipe is a flavorful potato fry dish.',7.99,'14','5','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/nithya.anantham/Nepali_Aloo_Tareko_Recipe.jpg'),('76','Sandesh Panna Cotta Recipe','Sandesh Panna Cotta Recipe is a fusion between Bengali Sandesh and Italian panna cotta. This is a succulent and rich dessert with the creamy taste of paneer, milk, and an aromatic flavor of saffron.',12.99,'13','4','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/swapna_sunil/Sandesh_Panna_Cotta.jpg'),('77','Cajun Kidney beans Rice With Soya Chunks Recipe','Cajun Kidney beans Rice with Soya Chunks Recipe is a one-pot meal with kidney beans mixed along with some Cajun spice mix. Soya Chunks are also added to give an extra texture to the whole dish. The rice is slightly sweet and spicy with added flavors from thyme and oregano.',11.99,'5','1','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Cajun_Kidney_beans_Rice_with_Soya_Chunks_Recipe.jpg'),('78','Schezwan Poha Recipe (Fusion Recipe)','Schezwan Poha is delicious, hot and tangy, loaded with vegetables, making the breakfast all the more exciting.',9.99,'11','1','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/nithya.anantham/Schezwan_Poha.jpg'),('79','Vegan Curried Rice with Chickpeas Recipe','Vegan Curried Rice with Chickpeas Recipe is a comforting meal that you would want to try for a cozy dinner or lunch. The rice is mixed with mild flavors of curry powder and tossed in with chickpeas.',10.99,'4','5','9','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Vegan_Curried_Rice_with_Chickpeas_Recipe.jpg'),('8','Arabian Chicken Mandi Recipe - Yemeni Style Rice & Chicken','Arabian Chicken Mandi is a traditional Yemeni dish and it is very popular among all the Arab countries.',19.99,'5','4','4','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Shaharban/Arabian_Chicken_Mandhi.jpg'),('80','Curry Powder Recipe','Curry Powder Recipe is a spice mix that has got influenced from the South Asian Flavors. It has simple ingredients that are roasted and ground to form a smooth powder which is added into various dishes to create amazing flavors.',5.99,'4','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/_Curry_Powder_Recipe_.jpg'),('81','Zucchini Pesarattu Recipe','Pesarattu is a wholesome and a healthy dosa from Andhra and Zucchini pesarattu recipe uses Zucchini in an interesting way to take the health quotient a notch higher.',8.99,'13','1','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Gauravi_Vinay/Zucchini_pesarattu.jpg'),('82','Ras El Hanout Recipe (Moroccan Spice Powder)','This spice blend is complex in flavors and can be used in marinade of meats, in tagines, whisked in yogurt to give an amazing dip/spread and many more or even sprinkle it over salads for a kick.',6.99,'7','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/jyothir/Ras_El_Hanout_Moroccon_Spice_Blend.jpg'),('83','Bamboo Shoot Stir Fry Recipe','Bamboo Shoot Stir Fry Recipe is prepared from the stemmed out bamboo shoots beside the bamboo plant. Served with phulka or as a side dish with rice and sambar.',7.99,'4','6','5','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/divya_shivaraman/Bamboo_Shoot_Stir_Fry.jpg'),('84','Kala Chana Pilaf Recipe','Kala Chana Pilaf Recipe is adapted from the Pakistani Cuisine. Pilaf is a flavorful rice dish, usually cooked with the white or red meats in Pakistan. The addition of whole garam masala adds a beautiful flavor to the dish.',9.99,'10','1','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/nithya.anantham/Kala_Chana_Pilaf_Recipe.jpg'),('85','Korean Style Gochujang Recipe (Hot Pepper Paste Recipe)','Korean Style Gochujang Recipe (Hot Pepper Paste Recipe) is a fermented red chili paste made from a mixture of glutinous rice and barley and mixed into a spice mixture.',7.99,'6','4','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Korean_Style_Gochujang_Recipe_Hot_Pepper_Paste_Recipe_.jpg'),('86','Paneer Kulcha Recipe-Cottage Cheese Stuffed Leavened Flatbread','Paneer Kulcha Recipe is a popular variety of leavened flat bread stuffed with cottage cheese and seasoned with spices.',9.99,'2','5','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Richa_Gupta/Paneer_Kulcha.jpg'),('87','Dhaba Style Dal Fry Recipe | Mixed Dal Tadka','The creamy dal fry consists of different kinds of dals like Toor Dal, Urad Dal, Masoor Dal, and Chana Dal and also a little rajma and Kala chana to give it that added texture and taste.',8.99,'2','2','8','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2021/Dhaba_Style_Dal_Fry_Mixed_Dal_Tadka_recipe_1600.jpg'),('88','Hara Chana Masala Recipe','Hara Chana or popularly known as Choliya or Green Chickpeas is a winter specialty of Northern India. The fresh green chickpeas are tender, sweet, and a delight to munch on.',10.99,'2','2','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Nithya_Anantham/Hara_Chana_Masala_Recipe.jpg'),('89','Shahi Dal Recipe','Shahi Dal Recipe is a creamy and rich dal made from whole urad dal. The dal also has soaked almonds for the crunch and is then topped with sauteed onions, tomatoes, cumin seeds, and red chili powder on top.',11.99,'2','2','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Shahi_Dal_Recipe.jpg'),('9','Burnt Garlic Veg Fried Rice Recipe','Burnt Garlic Veg Fried Rice Recipe has a very distinct, slightly bitter and nutty flavor. It blends itself very well with the Chinese sauces and Vegetables.',11.99,'11','4','1','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Burnt_Garlic_Veg_Fried_Rice_Recipe.jpg'),('90','Methi Murgh Recipe - Chicken with Fenugreek Leaves','Methi Murgh Recipe also known as Chicken with Fenugreek Leaves Recipe is a classic combination of chicken and fenugreek leaves. The chicken is cooked in fresh methi leaves that complement really well with the tender chicken.',12.99,'2','2','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/sibyl_sunitha/Methi_Murgh_Recipe_Chicken_with_Fenugreek_Leaves_Recipe.jpg'),('91','How to Make Homemade Jalebi Recipe','The Homemade Jalebi Recipe is a delicious mithai dish that you can make right in your own kitchen. The Jalebi is a traditional sweet dish that is made on every festival, special occasions, and monsoons.',8.99,'2','4','3','https://www.archanaskitchen.com/images/archanaskitchen/Indian_Sweets_Mithai/Homemade_Jalebi_Recipe-1-2.jpg'),('92','Aloo Bhindi Masala Gravy Recipe','Aloo Bhindi Masala Gravy Recipe is an everyday gravy sabzi that is cooked along with spices in a tomato and onion gravy. Served along with phulkas and a dal tadka for lunch or dinner.',10.99,'2','2','8','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2019/Aloo_Bhindi_Masala_Curry_Recipe_Video_North_Indian_Gravy_Dish_10_1600.jpg'),('93','Mushroom Tikka Masala Recipe (Mushroom & Bell Peppers In Spicy Tomato Gravy)','Mushroom Tikka Masala Recipe is perfectly roasted chunks of marinated mushrooms and bell pepper in a fragrant and spicy tomato-based gravy.',11.99,'2','5','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Curryandvanilla/Mushroom_Tikka_Masala.jpg'),('94','Khatte Chole Recipe - A Delicious North Indian Chana Masala','Khatte Chole Recipe is a very popular Delhi-style street food. It is spicy and tart, making for a perfect accompaniment with Gehu Bajra Thepla or even a Kulcha for those special monsoon days. The tartness comes from the addition of dried mango powder or amchoor and ginger, making it flavorful and delicious.',9.99,'2','2','8','https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2019/Khatte_Chole_Recipe_-_North_Indian_Chana_Masala_16_1600.jpg'),('95','Raw Mango Dal Fry Recipe','Raw Mango Dal Fry Recipe is a wonderful and tangy twist to the regular dal fry recipe, with the addition of raw mangoes. Grated raw mangoes are added to the arhar dal and other basic spices to prepare this side dish.',8.99,'2','2','8','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/garimasgautam-gmail.com/Mango_Dal_Fry.jpg'),('96','Hariyali Tawa Fish Fry Recipe','Hariyali Tawa Fish Fry Recipe is a lip-smacking non-vegetarian fish recipe where the fish is marinated with a hint of traditional spices like garam masala powder, lemon, coriander leaves and also mint leaves and then pan-fried.',14.99,'2','1','9','https://www.archanaskitchen.com/images/archanaskitchen/1-Author/garimasgautam-gmail.com/Haryiali_Tawa_Fish_Fry.jpg');
/*!40000 ALTER TABLE `food_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` varchar(10) NOT NULL,
  `manager_name` varchar(50) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`manager_id`),
  UNIQUE KEY `username` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('MGR001','John Doe','john_doe@gmail.com','pass123'),('MGR002','Jane Smith','jane_smith@gmail.com','secure456'),('MGR003','Robert Johnson','robert_j@gmail.com','pass789'),('MGR004','Christopher Anderson','chris_a@gmail.com','secret123'),('MGR005','Emily Davis','emily_d@gmail.com','password123'),('MGR006','Michael White','michael_w@gmail.com','newpass789'),('MGR007','Olivia Brown','olivia_b@gmail.com','pass456'),('MGR008','Daniel Green','daniel_g@gmail.com','secure789'),('MGR009','Sophia Taylor','sophia_t@gmail.com','pass789'),('MGR010','Ethan Miller','ethan_m@gmail.com','newpass456');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_id` varchar(10) NOT NULL,
  `item_id` varchar(10) NOT NULL,
  `quantity` varchar(10) NOT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `food_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES ('ORDER001','1','2'),('ORDER001','7','3'),('ORDER001','8','1'),('ORDER002','5','2'),('ORDER002','6','4'),('ORDER003','2','3'),('ORDER003','3','2'),('ORDER003','4','1'),('ORDER004','2','3'),('ORDER005','9','1'),('ORDER006','20','1'),('ORDER008','64','3'),('ORDER008','90','1');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` varchar(10) NOT NULL,
  `table_number` decimal(2,0) DEFAULT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `number_of_people` int DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('13D13C52',7,'2023-11-30','05:01:00','1',8),('29698C87',6,'2023-11-24','03:00:00','1',5),('40CE02E9',3,'2023-11-28','01:00:00','1',3),('RES001',1,'2023-11-23','18:00:00','1',NULL),('RES002',2,'2023-11-24','19:30:00','2',NULL),('RES003',3,'2023-11-25','20:00:00','3',NULL),('RES004',4,'2023-11-26','18:30:00','4',NULL),('RES005',5,'2023-11-27','19:00:00','5',NULL),('RES006',6,'2023-11-28','20:30:00','6',NULL),('RES007',7,'2023-11-29','21:00:00','7',NULL),('RES008',8,'2023-11-30','18:45:00','8',NULL),('RES009',9,'2023-12-01','19:15:00','9',NULL),('RES010',10,'2023-12-02','20:45:00','10',NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_manager`
--

DROP TABLE IF EXISTS `reservation_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_manager` (
  `reservation_id` varchar(10) NOT NULL,
  `manager_id` varchar(10) NOT NULL,
  PRIMARY KEY (`reservation_id`,`manager_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `reservation_manager_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_manager_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_manager`
--

LOCK TABLES `reservation_manager` WRITE;
/*!40000 ALTER TABLE `reservation_manager` DISABLE KEYS */;
INSERT INTO `reservation_manager` VALUES ('RES001','MGR001'),('RES004','MGR001'),('RES002','MGR002'),('RES007','MGR002'),('RES003','MGR003'),('RES005','MGR005'),('RES006','MGR006'),('RES008','MGR008'),('RES009','MGR009'),('RES010','MGR010');
/*!40000 ALTER TABLE `reservation_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiting_list`
--

DROP TABLE IF EXISTS `waiting_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiting_list` (
  `waiting_list_id` varchar(10) NOT NULL,
  `waiting_list_date` date NOT NULL,
  `waiting_list_time` time NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `number_of_people` int DEFAULT NULL,
  PRIMARY KEY (`waiting_list_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `waiting_list_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_list`
--

LOCK TABLES `waiting_list` WRITE;
/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
INSERT INTO `waiting_list` VALUES ('WL001','2023-11-23','18:30:00','10',NULL),('WL002','2023-11-24','19:00:00','9',NULL),('WL003','2023-11-25','20:30:00','8',NULL),('WL004','2023-11-26','21:00:00','7',NULL),('WL005','2023-11-27','18:45:00','6',NULL),('WL006','2023-11-28','19:15:00','5',NULL),('WL007','2023-11-29','20:45:00','4',NULL),('WL008','2023-11-30','21:15:00','3',NULL),('WL009','2023-12-01','18:15:00','2',NULL),('WL010','2023-12-02','19:45:00','1',NULL);
/*!40000 ALTER TABLE `waiting_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'restaurant'
--

--
-- Dumping routines for database 'restaurant'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_total_cost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_total_cost`(item_costs VARCHAR(1000)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10, 2) DEFAULT 0;
    DECLARE current_value DECIMAL(10, 2);

    IF item_costs IS NULL OR item_costs = '' THEN
        RETURN total_cost;
    END IF;

    WHILE LENGTH(item_costs) > 0 DO
        SET @current_length = LENGTH(SUBSTRING_INDEX(item_costs, ',', 1));
        SET current_value = CAST(SUBSTRING_INDEX(item_costs, ',', 1) AS DECIMAL(10, 2));

        SET total_cost = total_cost + current_value;

        SET item_costs = TRIM(BOTH ',' FROM SUBSTRING(item_costs, @current_length + 2));
    END WHILE;

    RETURN total_cost;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_cuisine_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_cuisine_count`() RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cuisine_count INT;
    SELECT COUNT(*) INTO cuisine_count
    FROM cuisine;
    RETURN cuisine_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_item_count_by_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_item_count_by_cuisine`(cuisine_id_param varchar(10)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE item_count INT;
    SELECT COUNT(*) INTO item_count
    FROM food_item
    WHERE cuisine_id = cuisine_id_param;
    RETURN item_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer`(
IN u_id VARCHAR(255),
    IN u_name VARCHAR(255),
    IN u_email VARCHAR(255),
    IN u_password VARCHAR(255),
    IN u_contactno VARCHAR(20)
)
BEGIN
    INSERT INTO customer (customer_id, customer_name,phone_number,email_id, password)
    VALUES (u_id,u_name, u_contactno,u_email, u_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_reservation`(
IN r_id VARCHAR(10),
    IN table_num INT,
    IN r_date DATE,
    IN r_time TIME,
    IN c_id VARCHAR(10),
    num_people INT
)
BEGIN
    INSERT INTO reservation (reservation_id, table_number, reservation_date, reservation_time, customer_id, number_of_people)
    VALUES (r_id, table_num, r_date, r_time, c_id, num_people);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_order_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_order_id`(
    IN p_order_id VARCHAR(10)
)
BEGIN
    DELETE FROM customer_order
    WHERE order_id = p_order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetChefDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetChefDetails`()
BEGIN
    SELECT * FROM chef;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCuisineDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCuisineDetails`()
BEGIN
select * from cuisine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCustomerDetails`()
BEGIN
    SELECT * FROM customer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetManagerDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetManagerDetails`()
BEGIN
    SELECT * FROM manager;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_food_item_cuisine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_food_item_cuisine`(in c_id varchar(10))
BEGIN
select item_id, item_name, item_description, item_price, cuisine_name, course_name, diet_name, image_url from food_item 
inner join cuisine on food_item.cuisine_id = cuisine.cuisine_id
inner join course on food_item.course_id = course.course_id
inner join diet on food_item.diet_id = diet.diet_id
where food_item.cuisine_id=c_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_order_status`(
    IN p_order_id VARCHAR(10),
    IN p_order_status VARCHAR(20)
)
BEGIN
    UPDATE customer_order
    SET order_status = p_order_status
    WHERE order_id = p_order_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-26  2:57:54
