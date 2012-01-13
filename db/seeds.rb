# encoding: UTF-8

Rank.create([
  { :name => 'Recruta', :track_depth => 3, :track_breadth => 2 },
  { :name => 'Aspira', :track_depth => 5, :track_breadth => 3 },
  { :name => 'Detetive', :track_depth => 7, :track_breadth => 3 },
  { :name => 'Capitão', :track_depth => 9, :track_breadth => 4 },
])

City.create([
  { :name => "Abu Dhabi", :country => "Emirados Árabes Unidos"},
  { :name => "Abuja", :country => "Nigéria"},
  { :name => "Acra", :country => "Gana"},
  { :name => "Adamstown", :country => "Pitcairn"},
  { :name => "Adis Abeba", :country => "Etiópia"},
  { :name => "Agana", :country => "Guam"},
  { :name => "Alofi", :country => "Niue"},
  { :name => "Amã", :country => "Jordânia"},
  { :name => "Amsterdã", :country => "Países Baixos"},
  { :name => "Ancara", :country => "Turquia"},
  { :name => "Andorra, a Velha", :country => "Andorra"},
  { :name => "Antananarivo", :country => "Madagáscar"},
  { :name => "Apia", :country => "Samoa"},
  { :name => "Argel", :country => "Argélia"},
  { :name => "Asgabate", :country => "Turquemenistão"},
  { :name => "Asmara", :country => "Eritreia"},
  { :name => "Assunção", :country => "Paraguai"},
  { :name => "Astana", :country => "Cazaquistão"},
])

City.find_each do |city|
  city.clues.create([{:description => '1st Clue'},{:description => '2nd Clue'}])
end

Location.create([
  { :name => 'Abatedouro', :witness => 'Açougueiro' },
  { :name => 'Aeroporto', :witness => 'Aeromoça' },
  { :name => 'Albergue', :witness => 'Hóspede' },
  { :name => 'Antiquário', :witness => 'Vendedor' },
  { :name => 'Banco', :witness => 'Caixa' },
  { :name => 'Bar', :witness => 'Barman' },
  { :name => 'Barberaria', :witness => 'Barbeiro' },
  { :name => 'Beco', :witness => 'Mendigo' },
  { :name => 'Boate', :witness => 'Stripper' },
  { :name => 'Concessionária de Carros', :witness => 'Vendedor' },
  { :name => 'Depósito', :witness => 'Estoquística' },
  { :name => 'Depósito de Lixo', :witness => 'Dono' },
  { :name => 'Estação de Metrô', :witness => 'Bilheteira' },
  { :name => 'Estação de Ônibus', :witness => 'Bilheteiro' },
  { :name => 'Estação de Trêm', :witness => 'Bilheteiro' },
  { :name => 'Estacionamento', :witness => 'Manobrista' },
  { :name => 'Feira', :witness => 'Feirante' },
  { :name => 'Ferro Velho', :witness => 'Dono' },
  { :name => 'Hotel', :witness => 'Hóspede' },
  { :name => 'Hospital', :witness => 'Enfermeira' },
  { :name => 'Lavanderia', :witness => 'Sr. Ching' },
  { :name => 'Loja de Armas', :witness => 'Vendedor' },
  { :name => 'Loja de Ferragens', :witness => 'Atendente' },
  { :name => 'Loja de Penhores', :witness => 'Balconista' },
  { :name => 'Mercearia', :witness => 'Balconista' },
  { :name => 'Museu', :witness => 'Segurança' },
  { :name => 'Prostíbulo', :witness => 'Prostituta' },
  { :name => 'Restaurante', :witness => 'Garçom' },
  { :name => 'SexShop', :witness => 'Atendente' },
  { :name => 'Supermercado', :witness => 'Caixa' },
  { :name => 'Oficina', :witness => 'Mecânico' },
])
