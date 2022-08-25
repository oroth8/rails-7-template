# frozen_string_literal: true

raise 'SEEDING NOT ALLOWED IN PRODUCTION' if Rails.env.production?

Organisation.destroy_all
Unit.destroy_all
User.destroy_all

org = Organisation.create!(name: "1107 W Chestnut", capacity: 4)

unit = Unit.create!(name: "Owen's Unit", number: "1E", organisation_id: org.id)
unit2 = Unit.create!(name: "Jamie's Unit", number: "2E", organisation_id: org.id)

User.create!(name: "Owen Roth", role: 3, password: "111111", unit_id: unit.id, organisation_id: org.id, email: "owen@test.com", address: "1107 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")
User.create!(name: "Jamie Sawyer", role: 2, password: "111111", unit_id: unit2.id, organisation_id: org.id, email: "jamie@test.com", address: "1107 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")
User.create!(name: "Sabrina Carlins", role: 1, password: "111111", unit_id: unit2.id, organisation_id: org.id, email: "sabrina@test.com", address: "1107 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")
User.create!(name: "Brooks Ashmore", role: 0, password: "111111", unit_id: unit.id, organisation_id: org.id, email: "brooks@test.com", address: "1107 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")

org2 = Organisation.create!(name: "1113 W Chestnut", capacity: 4)

unit_a = Unit.create!(name: "Megs's Unit", number: "1E", organisation_id: org2.id)
unit_b = Unit.create!(name: "Tims's Unit", number: "2E", organisation_id: org2.id)

User.create!(name: "Meg Nam", role: 3, password: "111111", unit_id: unit_a.id, organisation_id: org2.id, email: "meg@test.com", address: "1113 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")
User.create!(name: "Miles McColloumn", role: 2, password: "111111", unit_id: unit_a.id, organisation_id: org2.id, email: "miles@test.com", address: "1113 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")
User.create!(name: "Tim Decosta", role: 1, password: "111111", unit_id: unit_b.id, organisation_id: org2.id, email: "tim@test.com", address: "1113 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")
User.create!(name: "Lindsay Decosta", role: 0, password: "111111", unit_id: unit_b.id, organisation_id: org2.id, email: "lindsay@test.com", address: "1113 W Chestnut St", postal_code: "60642", main_address: true, city: "Chicago")