# Before running! Have at least one user created

TRUNCATE ads;
TRUNCATE categories;

INSERT INTO categories (name)
    VALUES ('Apparel'), ('Computers'), ('Kitchenware'), ('Other');

INSERT INTO ads (user_id, title, description, imgpath,  category)
VALUES (1, 'Codeup Coffee Mug',
        'This limited edition coffee mug will keep your beverages warn threw the coldest Arctic conditions. Users have experienced heightened programing knowledge wile using.','https://cdn.filestackcontent.com/8JMmoHbLQXWRRkE0Y8ju', 3),
  (1, 'Codeup Hoodie Sweatshirt',
   'Hoodies aren\'t just for sitting behind the desk anymore. The 100 percent cotton sweatshirt is formal enough to wear as your jacket to Black Tie event. But also casual enough for a night out on the town. You wont wont to leave this bad boy on the coat rack next time you head out.', null, 1),
  (1, 'Codeup Yellow Duck',
   'This banana yellow duck produced exclusively for Codeup students. Has been helping students solve complicated debugging problems. No longer are you the lonely programmer.', null, 4),
  (1, 'Nick Turners New MacBook Pro', '2016 15-inch Apple MacBook Pro, low hours.', null, 2),
  (1, 'Codeup Coffee Maker', 'Heavily used coffee maker. Leaks after use. Makes terrible tasking coffee.', 'https://cdn.filestackcontent.com/OtG111YRTpmFsuG1IlK3', 3),
  (1, 'Codeup Nalgene Bottle',
   'Take this indestructible 1 litter bottle to the moon and back. Whatever the job entails this bottle has all your hydration needs at hand.', 'https://cdn.filestackcontent.com/nsXoXU6jQY2358Km2mmt', 3),
  (1, 'Lasko Tower Fan/Air purifier',
   '50 inch Lasko tower fan/air purifier. Briefly owned by Tony Stark. With osculating mode, and ion filter technology.', 'https://cdn.filestackcontent.com/vdoTh1PTH6rMCjlrMWiT', 4),
  (1, 'Viewsonic HD Projector','Viewsonic projector, various input ports, with auto focus, ceiling hanger included.', 'https://cdn.filestackcontent.com/XG54RH5TS6fKf3GKxoPj', 4);