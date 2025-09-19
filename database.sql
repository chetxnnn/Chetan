-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `travel_india` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `travel_india`;

-- Table structure for table `users`
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `destinations`
CREATE TABLE `destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `subtitle` varchar(100) NOT NULL,
  `heroImage` varchar(255) NOT NULL,
  `introduction` text NOT NULL,
  `culture` text NOT NULL,
  `bestTime` text NOT NULL,
  `conclusion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `destinations`
INSERT INTO `destinations` (`id`, `title`, `subtitle`, `heroImage`, `introduction`, `culture`, `bestTime`, `conclusion`) VALUES
(1, 'Agra', 'The City of the Taj', 'https://images.unsplash.com/photo-1524492412937-b28074a5d7da?auto=format&fit=crop&w=1200&q=80', 'Welcome to Agra, a city that tells tales of love, loss, and architectural genius. Once the heart of the Mughal Empire, Agra is globally renowned for the Taj Mahal, a monument that is not just an architectural marvel, but an eternal symbol of love.', 'Respect is key in Agra. Dress modestly when visiting religious sites. A simple \'Namaste\' (a greeting with folded hands) will be warmly received.', 'The best time to visit is from October to March, when the weather is cool and pleasant, perfect for sightseeing.', 'Agra is more than just a city; it\'s an experience that transports you to a bygone era of emperors and romance.'),
(2, 'Jaipur', 'The Pink City', 'https://images.unsplash.com/photo-1603261643216-f737520e7428?auto=format&fit=crop&w=1200&q=80', 'Jaipur, the capital of Rajasthan, is a city of vibrant colors, majestic forts, and bustling bazaars. Known as the \'Pink City\' for its distinctively colored buildings, Jaipur is a perfect blend of royal heritage and modern culture.', 'Jaipur\'s culture is rich with traditional arts and crafts. Explore the local markets for beautiful textiles, pottery, and jewelry.', 'Visit between October and March. The weather is cool and ideal for exploring the city\'s many attractions.', 'With its royal past and lively present, Jaipur promises an unforgettable adventure.'),
(3, 'Kerala', 'God\'s Own Country', 'https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?auto=format&fit=crop&w=1200&q=80', 'Welcome to Kerala, a slice of tropical paradise. Famous for its palm-lined beaches, serene backwaters, and sprawling tea plantations, Kerala offers a tranquil escape into nature\'s lap.', 'Kerala is known for unique art forms like Kathakali. The local cuisine, rich in coconut and spices, is a must-try.', 'The period from September to March is ideal, offering pleasant weather for exploring beaches and backwaters.', 'Kerala\'s serene beauty and rich cultural tapestry provide a refreshing and rejuvenating experience.'),
(4, 'Goa', 'The Pearl of the Orient', 'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=1200&q=80', 'Goa is India\'s pocket-sized paradise, a coastal state known for its endless beaches, vibrant nightlife, laid-back atmosphere, and unique blend of Indian and Portuguese cultures. From sunbathing on golden sands to exploring colonial churches, Goa has something for everyone.', 'Goan culture is a unique fusion of Konkani and Portuguese influences. The cuisine is famous for its seafood and spicy Vindaloo. Don\'t miss the flea markets at Anjuna and Mapusa.', 'The best time to visit is from November to February when the weather is cool and dry. The monsoon season (June-September) is lush and green but with fewer beach activities.', 'Whether you\'re seeking relaxation or adventure, Goa\'s susegad (laid-back) lifestyle and scenic beauty will capture your heart.'),
(5, 'Himalayas', 'Retreat to the Mountains', 'https://images.unsplash.com/photo-1617653292511-b8403358d343?auto=format&fit=crop&w=1200&q=80', 'Escape to the majestic Himalayas, a realm of serene beauty, towering peaks, and spiritual tranquility. From the charming hill station of Shimla to the adventurous terrains of Ladakh, the Indian Himalayas offer a breathtaking retreat from the hustle of city life.', 'The Himalayan region is a mosaic of cultures, predominantly influenced by Tibetan Buddhism and Hinduism. The people are known for their warm hospitality. Experience the simple, peaceful mountain life.', 'The summer months from April to June are perfect for visiting most hill stations. For snow lovers, December to February is ideal.', 'The Himalayas are not just a destination, but a journey of self-discovery amidst the grandest landscapes on Earth.');

-- Table structure for table `gallery`
CREATE TABLE `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `gallery`
INSERT INTO `gallery` (`id`, `destination_id`, `image_url`) VALUES
(1, 1, 'https://images.unsplash.com/photo-1548013146-72479768bada?auto=format&fit=crop&w=400&q=80'),
(2, 1, 'https://images.unsplash.com/photo-1570752331042-205e4a387431?auto=format&fit=crop&w=400&q=80'),
(3, 1, 'https://images.unsplash.com/photo-1573453813635-06c5a0a1639d?auto=format&fit=crop&w=400&q=80'),
(4, 2, 'https://images.unsplash.com/photo-1557690756-62754e202496?auto=format&fit=crop&w=400&q=80'),
(5, 2, 'https://images.unsplash.com/photo-1599661046223-e0658853633a?auto=format&fit=crop&w=400&q=80'),
(6, 2, 'https://images.unsplash.com/photo-1549992313-243460515152?auto=format&fit=crop&w=400&q=80'),
(7, 3, 'https://images.unsplash.com/photo-1523359193496-b675f0a1d489?auto=format&fit=crop&w=400&q=80'),
(8, 3, 'https://images.unsplash.com/photo-1593693397649-65d2a403d125?auto=format&fit=crop&w=400&q=80'),
(9, 3, 'https://images.unsplash.com/photo-1579751626652-5956795b5275?auto=format&fit=crop&w=400&q=80'),
(10, 4, 'https://images.unsplash.com/photo-1536420127960-10b925b206f6?auto=format&fit=crop&w=400&q=80'),
(11, 4, 'https://images.unsplash.com/photo-1570242759699-a03c2a635814?auto=format&fit=crop&w=400&q=80'),
(12, 4, 'https://images.unsplash.com/photo-1574229971165-4a68297353f8?auto=format&fit=crop&w=400&q=80'),
(13, 5, 'https://images.unsplash.com/photo-1588925434159-4a34b2138723?auto=format&fit=crop&w=400&q=80'),
(14, 5, 'https://images.unsplash.com/photo-1559524955-c49a65397554?auto=format&fit=crop&w=400&q=80'),
(15, 5, 'https://images.unsplash.com/photo-1549880181-56a44cf4a9a5?auto=format&fit=crop&w=400&q=80');

-- Table structure for table `attractions`
CREATE TABLE `attractions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `attractions_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `attractions`
INSERT INTO `attractions` (`id`, `destination_id`, `name`, `description`) VALUES
(1, 1, 'Taj Mahal', 'The ivory-white marble mausoleum, a UNESCO World Heritage site.'),
(2, 1, 'Agra Fort', 'A colossal red sandstone fort that served as the main residence of the Mughal emperors.'),
(3, 1, 'Mehtab Bagh', 'A garden complex offering a stunning, symmetrical view of the Taj Mahal at sunset.'),
(4, 2, 'Hawa Mahal', 'The \'Palace of Winds,\' an iconic five-story pink sandstone facade with 953 windows.'),
(5, 2, 'Amber Fort', 'A magnificent fort-palace overlooking Maota Lake, known for its artistic Hindu-style elements.'),
(6, 2, 'City Palace', 'A grand complex of courtyards, gardens, and buildings blending Rajasthani and Mughal architecture.'),
(7, 3, 'Alleppey Backwaters', 'Cruise through the tranquil network of lakes and canals on a traditional houseboat.'),
(8, 3, 'Munnar Tea Gardens', 'Walk through endless stretches of lush green tea plantations and visit a tea museum.'),
(9, 3, 'Fort Kochi', 'A charming coastal area known for its colonial architecture and iconic Chinese Fishing Nets.'),
(10, 4, 'Palolem Beach', 'A picturesque crescent-shaped beach known for its calm waters and vibrant beach huts.'),
(11, 4, 'Old Goa (Velha Goa)', 'A UNESCO World Heritage site featuring magnificent colonial-era churches like the Basilica of Bom Jesus.'),
(12, 4, 'Dudhsagar Falls', 'A majestic four-tiered waterfall located on the Mandovi River, a spectacular sight in the monsoon.'),
(13, 5, 'The Ridge, Shimla', 'The hub of all cultural activities in Shimla, offering stunning views of the mountain ranges.'),
(14, 5, 'Monasteries of Ladakh', 'Explore ancient Buddhist monasteries perched on hilltops, such as Thiksey and Hemis.'),
(15, 5, 'Trekking & Adventure', 'Embark on world-class treks, river rafting, and mountaineering expeditions.');
