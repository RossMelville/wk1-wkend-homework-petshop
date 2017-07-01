def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_amount)
  pet_shop[:admin][:total_cash] += cash_amount
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pets_shop, sold_pets)
  pets_shop[:admin][:pets_sold] += sold_pets
end

def stock_count(pet_shop)
  num_of_pets = 0
  for pet in pet_shop[:pets] do 
    num_of_pets += 1
  end
  return num_of_pets
end

def pets_by_breed(pet_shop, breed)
  pets_per_breed = []
  for pet in pet_shop[:pets]
    pets_per_breed.push(pet) if pet[:breed] == breed
  end
  return pets_per_breed
end

def find_pet_by_name(pet_shop, pet_name)
  pet_by_name = {}
  for pet in pet_shop[:pets]
    pet_by_name.merge!(pet) and return pet_by_name if pet[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet.clear
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  pet_count = 0
  for pet in customer[:pets]
    pet_count += 1
  end
  return pet_count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  end
  return false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  found_pet = find_pet_by_name(pet_shop, pet)
  if found_pet == true
    customer[:pets].push(pet) 
    pet_shop[:admin][:pets_sold] += 1
    pet_shop[:admin][:total_cash] += pet[:price]
  end
end

