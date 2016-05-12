class Seed

  def initialize
    create_users
    create_loan_offers
    # create_loan_requests
  end

  def create_users
    puts "Created Users"
    create_kami_admin
    create_mark_admin
    create_thom_admin
    until User.count == 50 do
      User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                  email: Faker::Internet.email, city: Faker::Address.city, state: Faker::Address.state,
                  zipcode: Faker::Address.zip, password: "password",
                  address: Faker::Address.street_address, role: 0, username: Faker::Internet.user_name)
    end
    puts "Created Users"
  end

  def create_loan_offers
    puts "Creating Loan Offers"
    until LoanOffer.count == 100 do
      user = User.find(rand(4..50))
      user.loan_offers.create!(amount: rand(50..10000),
                               rate: "#{rand(3..20)}.#{rand(0..99)}".to_f,
                               term: rand(3..12))
    end
    puts "Created Loan Offers"
  end

  # def create_loan_requests
  #   puts "Creating Loan Requests"
  #   until LoanRequest.count == 100 do
  #     user = User.find(rand(4..50))
  #     user.loan_requests.create!(amount_requested: rand(50..10000),
  #                                max_interest_rate: "#{rand(3..20)}.#{rand(0..99)}".to_f)
  #   end
  #   puts "Created Loan Requests"
  # end
  private

    def create_kami_admin
      User.create!(first_name: "Kami", last_name: "Boers",
                  email: "kami@kami.kami", city: "Denver", state: "CO",
                  zipcode: "80229", password: "password",
                  address: "The Dungeon where there is no sunlight",
                  role: 1, username: "kami")
    end

    def create_mark_admin
      User.create!(first_name: "Mark", last_name: "Miranda",
                  email: "mark@mark.mark", city: "Denver", state: "CO",
                  zipcode: "80229", password: "password",
                  address: "The basement flooding from students tears",
                  role: 1, username: "mark")
    end

    def create_thom_admin
      User.create!(first_name: "Thom", last_name: "Pickett",
                  email: "thom@thom.thom", city: "Denver", state: "CO",
                  zipcode: "80229", password: "password",
                  address: "The Purgatory of waiting to see if we pass or fail",
                  role: 1, username: "thom")
    end
end

Seed.new