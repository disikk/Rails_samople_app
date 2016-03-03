# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
        name: 'Example User',
        email: 'example@example.com',
        password: 'foobar',
        password_confirmation: 'foobar'
)
User.create(
        name: 'Albert Einstein',
        email: 'CTO_AND_OTO@mail.com',
        password: 'foobar',
        password_confirmation: 'foobar'
)
User.create(
        name: 'Denis Simakov',
        email: 'thedisik@gmail.com',
        password: 'foobar',
        password_confirmation: 'foobar'
)
User.create(
        name: 'Alena Simakova',
        email: 'kuzn.alena@gmail.com',
        password: 'foobar',
        password_confirmation: 'foobar'
)