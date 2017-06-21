# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create(birth_date: '2015-02-03', color: 'orange', name: 'whiskers', sex: 'M', description: 'my house cat')

cat2 = Cat.create(birth_date: '2011-10-31', color: 'black', name: 'binky', sex: 'F', description: 'my awesome cat')


cat_request1 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2017-07-04', end_date: '2017-07-08')

cat_request2 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2017-08-04', end_date: '2017-08-08')

cat_request3 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2017-07-04', end_date: '2017-07-08')
