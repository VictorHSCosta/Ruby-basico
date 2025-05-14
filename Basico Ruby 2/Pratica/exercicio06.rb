require "faker"

require "csv"

path = "/home/victor/Documentos/Estudo Ruby/Basico Ruby 2/Pratica/Arquivos"

def name 
  Faker::Name.name
end

def phone
  Faker::PhoneNumber.phone_number
end

def email(name)
  "#{name}@email.com"
end


CSV.open("#{path}/contacts.csv", "w") do |csv|
  csv << ["Nome", "Email", "Telefone"]
  10.times do
    storage_name = name
    storage_email = email(storage_name)
    puts storage_name
    csv << [storage_name, storage_email, phone]
  end
end
