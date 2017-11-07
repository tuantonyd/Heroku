# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create([
  {name: 'Basket #1', description: '20% goes to charity', price: 150.00 },
  {name: 'Basket #2', description: 'This basket is so pretty', price: 200.00},
  {name: 'Basket #3', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #4', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #5', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #6', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #7', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #8', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #9', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #10', description: 'Houston themed basket', price: 400.00 },
  {name: 'Basket #11', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #12', description: 'Houston themed basket', price: 350.00 },
  {name: 'Basket #13', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #14', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #15', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #16', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #17', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #18', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #19', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #20', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #21', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #22', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #23', description: 'Houston themed basket', price: 250.00 },
  {name: 'Basket #24', description: 'Houston themed basket', price: 250.00 }])

OrderStatus.create([{status: 'Placed'}, {status: 'Processed'},
  {status: 'Shipped'}, {status: 'Completed'}])

states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut',
  'Delaware', 'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois',
  'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts',
  'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
  'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon',
  'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
  'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']

states.each do |state|
State.create({state_name: state})
end

Customer.create(
  {first_name: "Linda", last_name: "Hickman", email: "oliver.heart.gifts@gmail.com", password: "password", password_confirmation: "password", admin: true})
