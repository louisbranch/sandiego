# encoding: UTF-8

Rank.create([
  { :name => 'Aspira', :position => 1, :track_depth => 3, :track_breadth => 2 },
  { :name => 'Recruta', :position => 2, :track_depth => 4, :track_breadth => 3 },
  { :name => 'Detetive', :position => 3, :track_depth => 5, :track_breadth => 3 },
  { :name => 'Investigador', :position => 4, :track_depth => 6, :track_breadth => 4 },
  { :name => 'Agente Secreto', :position => 5, :track_depth => 7, :track_breadth => 4 },
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

Filler.create([
  { :description => 'Ele está na cidade.', :correct => true },
  { :description => 'Você está próximo de encontrá-lo.', :correct => true },
  { :description => 'A sua pista está esquentado.', :correct => true },
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
