#================== User DATA =================
user1 = User.create(full_name: "subhasis", age: 27, email: "subhasisgiri01@gmail.com", password: "qwerty")
user2 = User.create(full_name: "Asish", age: 27, email: "asishgiri01@gmail.com", password: "qwerty")
#================== END OF User DATA =================

#================== Topic DATA =================
user1.topics.create(name: 'Photography', description: "Photography is the science, art, application and practice of creating durable images by recording light")
user1.topics.create(name: 'Space', description: "Space is the boundless three-dimensional extent in which objects and events have relative position and direction")
user2.topics.create(name: 'football', description: "Association football, more commonly known as football or soccer, is a team sport played between two teams of eleven players with a spherical ball")

#================== END OF Topic SEEDING =================

