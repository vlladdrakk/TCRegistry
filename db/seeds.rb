# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Color.create(
  name: "Primary",
  hex_value: "bfbff2",
  type_id: 1
)

Color.create(
  name: "Secondary",
  hex_value: "ffd6b3",
  type_id: 2
)