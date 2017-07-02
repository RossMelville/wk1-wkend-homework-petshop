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
  for pet in pet_shop[:pets] 
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

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets].push(pet)
end

def customer_pet_count(customer)
  pet_count = 0
  for pet in customer[:pets]
    pet_count = pet_count + 1
  end
  return pet_count
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << (pet)
end

def customer_can_afford_pet(customer, pet)
  available_cash = customer[:cash]
  pet_cost = pet[:price]
  if available_cash >= pet_cost 
    return true
  end
  return false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  
  if pet == nil
    return
  end

  if customer_can_afford_pet(customer, pet) == true
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end
  
end

