# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BookLog.destroy_all
Library.destroy_all
Book.destroy_all

books = []
50.times do
    books << Book.create(title: Faker::Book.title, author: Faker::Book.author, img_url:'https://m.media-amazon.com/images/I/41otZSNX8GL.jpg' , genre:Faker::Book.genre, description: Faker::Books::Lovecraft.paragraph(sentence_count: 2) )
end

librariesLatLong = [{lat: 41.96819 , long: -87.67666 }, {lat: 41.97013 , long:-87.67136}, {lat:41.97587 , long:-87.67134}, {lat:41.98189 , long:-87.67109}, {lat:41.979329 , long:-87.66644
}, {lat:41.97776 , long:-87.66443}, {lat:41.97721 , long:-87.6639}, {lat:41.97602 , long:-87.65759}]

# librariesLocations = ['McPherson Elementary School
# 4728 N. Wolcott Avenue Chicago IL 60640', 
# '4842 N. Paulina St. Chicago IL 60640', 
# '1643 W Foster Chicago IL 60640', 
# '1630 W Catalpa Avenue Chicago IL 60640', 
# '1438 W Summerdale Avenue Chicago IL 60640', 
# '5251 n Glenwood Chicago IL 60640', 
# '5230 North Wayne Avenue Chicago IL 60640',
# '5125 N Winthrop Ave Chicago IL 60640'
# ]

librariesLocations = ['McPherson Elementary School
4728 N. Wolcott Avenue Chicago IL 60640', 
'4842 N. Paulina St. Chicago IL 60640'
]

librariesLocations.each do |lib|
    Library.create(name: Faker::Address.state, location: lib, lat: 3151, long: 51651 )
end


# librariesLatLong.each do |lib|
#    Library.create(name: Faker::Address.state, location:'Ravenswood', lat: lib[:lat], long: lib[:long] )
# end

books.each do |book|
    BookLog.create(library_id: Library.all.sample.id, book_id: book.id)
end 



