
drop table [dbo].[Toys];

drop table [dbo].[Brand];

CREATE TABLE [dbo].[Brand](
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[BrandName] NVARCHAR (30) NOT NULL,
	[BrandDescription] NVARCHAR (100) NOT NULL
)

CREATE TABLE [dbo].[Toys]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[ToyName] NVARCHAR (30) NOT NULL,
	[ToyDescription] NVARCHAR (100) NOT NULL,
	[InStock] INT NOT NULL,
	[ImageName] NVARCHAR (50),
	[Price] DECIMAL(11,2) NOT NULL,
	[BrandId] INT NOT NULL ,
	FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Brand] ([Id]) ON DELETE CASCADE
)

INSERT INTO Brand
    (BrandName, BrandDescription)
VALUES
	('Funskool Ltd', 'Indian toy manufacturing company'),
	('Hot Wheels', 'American toy brand of scale model cars'),
	('Lego', 'Danish plastic construction toy company'),
	('Nintendo Co. Ltd', 'Japanese multinational video game company');

INSERT INTO Toys
  (ToyName, ToyDescription, InStock, ImageName, Price, BrandId)
VALUES
	('Aquarium JigSaw Puzzle', '300 pieces jigsaw puzzle', 50, 'Aquarium Jigsaw Puzzle.jpg', 6.60, (select Id from Brand where BrandName='Funskool Ltd')),
	('Scotland Yard', 'A Compelling Detective Game', 70, 'Scotland Yard.jpg', 9.88, (select Id from Brand where BrandName='Funskool Ltd')),
	('Finger Puppets', 'Create animal finger puppets', 50, 'Finger Puppets.jpg', 5, (select Id from Brand where BrandName='Funskool Ltd')),
	('Super Loop Fire Station', 'Multilevel fire station playset', 30, 'Fire Station.jpg', 34.99, (select Id from Brand where BrandName='Hot Wheels')),
	('Figure-8 Track Set', 'Racing car stunt track set', 80, 'Figure-8 Track Set.jpg', 54.99, (select Id from Brand where BrandName='Hot Wheels')),
	('Monster Trucks', 'Pack of 2 demolition trucks', 40, 'Monster Trucks.jpg', 9.97, (select Id from Brand where BrandName='Hot Wheels')),
	('Duplo', 'Construction Site building blocks', 30, 'Duplo.jpg', 24.86, (select Id from Brand where BrandName='Lego')),
	('Minecraft', 'Build and play with Minecraft characters', 50, 'Minecraft.jpg', 12.67, (select Id from Brand where BrandName='Lego')),
	('Bonsai Tree', 'Build a bonsai tree with lego blocks', 60, 'Bonsai Tree.jpg', 64.98, (select Id from Brand where BrandName='Lego')),
	('Mario Golf', 'Nintendo Switch Games and Software', 80, 'Mario Golf.jpg', 79.96, (select Id from Brand where BrandName='Nintendo Co. Ltd')),
	('Pokemon', 'Play a Pokémon RPG on a home console', 50, 'Pokemon.jpg', 81.56, (select Id from Brand where BrandName='Nintendo Co. Ltd')),
	('The Legend of Zelda', 'Fight against the attacks on Hyrule', 20, 'Zelda.jpg', 89.96, (select Id from Brand where BrandName='Nintendo Co. Ltd'));


	select * from toys;