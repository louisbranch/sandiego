# encoding: UTF-8

Rank.create([
  { :name => 'Aspira', :position => 1, :track_depth => 3, :track_breadth => 2, :minimum_xp => 0, :bonus_multiplier => 10 },
  { :name => 'Recruta', :position => 2, :track_depth => 4, :track_breadth => 3, :minimum_xp => 500, :bonus_multiplier => 20 },
  { :name => 'Detetive', :position => 3, :track_depth => 5, :track_breadth => 3, :minimum_xp => 1500, :bonus_multiplier => 30 },
  { :name => 'Investigador', :position => 4, :track_depth => 6, :track_breadth => 4, :minimum_xp => 5000, :bonus_multiplier => 40 },
  { :name => 'Agente Secreto', :position => 5, :track_depth => 7, :track_breadth => 4, :minimum_xp => 15000, :bonus_multiplier => 50 },
])

City.create([
  { :name => "Buenos Aires", :country => "Argentina", :photo_path => '/assets/cities/argentina.jpg'},
  { :name => "Cidade do México", :country => "México", :photo_path => '/assets/cities/mexico.jpg'},
  { :name => "Nova York", :country => "USA", :photo_path => '/assets/cities/usa.jpg'},
  { :name => "Londres", :country => "Inglaterra", :photo_path => '/assets/cities/england.jpg'},
  { :name => "Sydney", :country => "Australia", :photo_path => '/assets/cities/australia.jpg'},
  { :name => "Berlim", :country => "Alemanha", :photo_path => '/assets/cities/germany.jpg'},
  { :name => "Tokyo", :country => "Japão", :photo_path => '/assets/cities/japan.jpg'},
  { :name => "Roma", :country => "Itália", :photo_path => '/assets/cities/italia.jpg'},
  { :name => "Shangai", :country => "China", :photo_path => '/assets/cities/china.jpg'},
  { :name => "Barcelona", :country => "Espanha", :photo_path => '/assets/cities/spain.jpg'},
  { :name => "Moscou", :country => "Rússia", :photo_path => '/assets/cities/russia.jpg'},
  { :name => "Cairo", :country => "Egito", :photo_path => '/assets/cities/egypt.jpg'},
  { :name => "Cidade do Cabo", :country => "África do Sul", :photo_path => '/assets/cities/south_africa.jpg'},
  { :name => "Rio de Janeiro", :country => "Brasil", :photo_path => '/assets/cities/brazil.jpg'},
  { :name => "Auckland", :country => "New Zealand", :photo_path => '/assets/cities/new_zealand.jpg'},
])

City.find_each do |city|
  city.clues.create([{:description => '1st Clue'},{:description => '2nd Clue'}])
end

Location.create([
  { :name => 'Abatedouro', :witness => 'Açougueiro', :photo_path => '/assets/locations/slaughterhouse.jpg', :witness_photo_path => '/assets/witnesses/male_2.jpg' },
  { :name => 'Aeroporto', :witness => 'Aeromoça', :photo_path => '/assets/locations/airport.jpg', :witness_photo_path => '/assets/witnesses/female_6.jpg' },
  { :name => 'Albergue', :witness => 'Hóspede', :photo_path => '/assets/locations/hostel.jpg', :witness_photo_path => '/assets/witnesses/male_1.jpg' },
  { :name => 'Antiquário', :witness => 'Vendedor', :photo_path => '/assets/locations/antiquarian.jpg', :witness_photo_path => '/assets/witnesses/male_6.jpg' },
  { :name => 'Banco', :witness => 'Caixa', :photo_path => '/assets/locations/bank.jpg', :witness_photo_path => '/assets/witnesses/female_6.jpg' },
  { :name => 'Bar', :witness => 'Barman', :photo_path => '/assets/locations/bar.jpg', :witness_photo_path => '/assets/witnesses/male_5.jpg' },
  { :name => 'Barberaria', :witness => 'Barbeiro', :photo_path => '/assets/locations/babershop.jpg', :witness_photo_path => '/assets/witnesses/male_1.jpg' },
  { :name => 'Beco', :witness => 'Mendigo', :photo_path => '/assets/locations/alley.jpg', :witness_photo_path => '/assets/witnesses/male_4.jpg' },
  { :name => 'Boate', :witness => 'Stripper', :photo_path => '/assets/locations/club.jpg', :witness_photo_path => '/assets/witnesses/female_3.jpg' },
  { :name => 'Cafeteria', :witness => 'Garçonete', :photo_path => '/assets/locations/diner.jpg', :witness_photo_path => '/assets/witnesses/female_2.jpg' },
  { :name => 'Clube de Strippers', :witness => 'Stripper', :photo_path => '/assets/locations/striptease_club.jpg', :witness_photo_path => '/assets/witnesses/female_4.jpg' },
  { :name => 'Concessionária de Carros', :witness => 'Vendedor', :photo_path => '/assets/locations/car_dealership.jpg', :witness_photo_path => '/assets/witnesses/male_3.jpg' },
  { :name => 'Depósito', :witness => 'Estoquística', :photo_path => '/assets/locations/storage.jpg', :witness_photo_path => '/assets/witnesses/male_6.jpg' },
  { :name => 'Depósito de Lixo', :witness => 'Dono', :photo_path => '/assets/locations/waste_disposal.jpg', :witness_photo_path => '/assets/witnesses/male_4.jpg' },
  { :name => 'Estação de Metrô', :witness => 'Bilheteira', :photo_path => '/assets/locations/subway_station.jpg', :witness_photo_path => '/assets/witnesses/female_2.jpg' },
  { :name => 'Estação de Trêm', :witness => 'Bilheteiro', :photo_path => '/assets/locations/train_station.jpg', :witness_photo_path => '/assets/witnesses/male_3.jpg' },
  { :name => 'Estacionamento', :witness => 'Manobrista', :photo_path => '/assets/locations/parking_lot.jpg', :witness_photo_path => '/assets/witnesses/male_1.jpg' },
  { :name => 'Feira', :witness => 'Feirante', :photo_path => '/assets/locations/marketplace.jpg', :witness_photo_path => '/assets/witnesses/female_5.jpg' },
  { :name => 'Ferro Velho', :witness => 'Dono', :photo_path => '/assets/locations/junkyard.jpg', :witness_photo_path => '/assets/witnesses/male_6.jpg' },
  { :name => 'Hotel', :witness => 'Hóspede', :photo_path => '/assets/locations/hotel.jpg', :witness_photo_path => '/assets/witnesses/male_5.jpg' },
  { :name => 'Hospital', :witness => 'Enfermeira', :photo_path => '/assets/locations/hospital.jpg', :witness_photo_path => '/assets/witnesses/female_3.jpg' },
  { :name => 'Lavanderia', :witness => 'Atendente', :photo_path => '/assets/locations/laundry.jpg', :witness_photo_path => '/assets/witnesses/male_1.jpg' },
  { :name => 'Livraria', :witness => 'Vendedora', :photo_path => '/assets/locations/bookstore.jpg', :witness_photo_path => '/assets/witnesses/female_4.jpg' },
  { :name => 'Loja de Armas', :witness => 'Vendedor', :photo_path => '/assets/locations/gun_shop.jpg', :witness_photo_path => '/assets/witnesses/male_3.jpg' },
  { :name => 'Loja de Ferragens', :witness => 'Atendente', :photo_path => '/assets/locations/hardware_store.jpg', :witness_photo_path => '/assets/witnesses/male_2.jpg' },
  { :name => 'Loja de Penhores', :witness => 'Balconista', :photo_path => '/assets/locations/pawnshop.jpg', :witness_photo_path => '/assets/witnesses/male_6.jpg' },
  { :name => 'Mercearia', :witness => 'Balconista', :photo_path => '/assets/locations/grocery_store.jpg', :witness_photo_path => '/assets/witnesses/male_1.jpg' },
  { :name => 'Museu', :witness => 'Segurança', :photo_path => '/assets/locations/museum.jpg', :witness_photo_path => '/assets/witnesses/male_4.jpg' },
  { :name => 'Restaurante', :witness => 'Garçom', :photo_path => '/assets/locations/restaurant.jpg', :witness_photo_path => '/assets/witnesses/male_1.jpg' },
  { :name => 'SexShop', :witness => 'Atendente', :photo_path => '/assets/locations/sexshop.jpg', :witness_photo_path => '/assets/witnesses/male_4.jpg' },
  { :name => 'Supermercado', :witness => 'Caixa', :photo_path => '/assets/locations/supermarket.jpg', :witness_photo_path => '/assets/witnesses/male_5.jpg' },
  { :name => 'Oficina Mecânica', :witness => 'Mecânico', :photo_path => '/assets/locations/mechanic_shop.jpg', :witness_photo_path => '/assets/witnesses/male_5.jpg' },
])

Filler.create([
  { :description => 'Ele está na cidade.', :correct => true },
  { :description => 'Você está próximo de encontrá-lo.', :correct => true },
  { :description => 'A sua pista está esquentado.', :correct => true },
  { :description => 'Tudo que sei é que algo suspeito está ocorrendo por aqui.', :correct => true },
  { :description => 'Ouvi falar que ele está por aqui.', :correct => true },
  { :description => 'Ele está escondido nesta cidade.', :correct => true },
  { :description => 'Ele está próximo!', :correct => true },
  { :description => 'Ele esteve aqui há pouco, você precisa mover-se mais rápido.', :correct => true },
  #
  { :description => 'Você está na trilha errada.', :correct => false },
  { :description => 'Ninguem suspeito passou por aqui.', :correct => false },
  { :description => 'Acho que sua pista está fria, amigo.', :correct => false },
  { :description => 'Não ouvi falar.', :correct => false },
  { :description => 'Quem? Acho que você está enganado.', :correct => false },
  { :description => 'Acho que você deveria estar procurando em outro lugar.', :correct => false },
])
