# encoding: UTF-8
class Trait < ActiveRecord::Base
  belongs_to :suspect
  has_many :networks, :as => :informable

  validates :suspect, :presence => true
  validates :category, :presence => true
  validates :description, :presence => true

  scope :found, :conditions => { :found => true }

  def self.gender(suspect)
    gender = suspect['raw_info']['gender']
    if gender
      trait = Trait.new(:suspect_id => suspect['id'])
      trait.category = 'Sexo'
      case gender
        when 'male'
          gender_type = 'masculino'
        when 'female'
          gender_type = 'feminino'
      end
      trait.description = "O Suspeito era do sexo #{gender_type}"
      trait.save
    end
  end

  def self.birthday(suspect)
    birthday = suspect['raw_info']['birthday']
    year_regex = /\d\d\/\d\d\/\d\d\d\d/
    if birthday && birthday.match(year_regex)
      trait = Trait.new(:suspect_id => suspect['id'])
      years = Time.now.year - birthday.match(/\d\d\d\d/)[0].to_i
      trait.category = 'Idade'
      trait.description = "Ele parecia ter #{years} anos"
      trait.save
    end
  end

  def self.hometown(suspect)
    hometown = suspect['raw_info']['hometown']
    if hometown
      hometown = hometown['name']
      unless hometown.nil?
        trait = Trait.new(:suspect_id => suspect['id'])
        trait.category = 'Cidade natal'
        trait.description = "Ele revelou ser de #{hometown}"
        trait.save
      end
    end
  end

  def self.current_city(suspect)
    current_city = suspect['raw_info']['location']
    if current_city
      trait = Trait.new(:suspect_id => suspect['id'])
      current_city = current_city['name']
      trait.category = 'Cidade atual'
      trait.description = "Ele disse que mora em #{current_city}"
      trait.save
    end
  end

  def self.education(suspect)
    education = suspect['raw_info']['education']
    if education
      trait = Trait.new(:suspect_id => suspect['id'])
      education = education.sample
      school = education['school']['name']
      trait.category = 'Educação'
      trait.description = "Ele mencionou ter estudado em #{school}"
      trait.save
    end
  end

  def self.work(suspect)
    work = suspect['raw_info']['work']
    if work
      trait = Trait.new(:suspect_id => suspect['id'])
      work = work.sample
      employer = work['employer']['name']
      trait.category = 'Trabalho'
      trait.description = "Ele trabalhou para #{employer}"
      trait.save
    end
  end

  def self.language(suspect)
    languages = suspect['raw_info']['languages']
    if languages
      trait = Trait.new(:suspect_id => suspect['id'])
      language = languages.sample['name']
      trait.category = 'Idioma'
      trait.description = "Eu ouvi ele falando em #{language}"
      trait.save
    end
  end

  def self.relationship_status(suspect)
    relationship_status = suspect['raw_info']['relationship_status']
    if relationship_status
      trait = Trait.new(:suspect_id => suspect['id'])
      case relationship_status
        when 'Single'
          status = 'ser solteiro'
        when 'In a relationship'
          status = 'estar namorando'
        when 'Engaged'
          status = 'estar noivo'
        when 'Married'
          status = 'ser casado'
        when 'It\'s complidated'
          status = 'estar em um relacionamento "complicado"'
        when 'In a open relationship'
          status = 'estar em um relacionamento aberto'
        when 'Widowed'
          status = 'ser viúvo'
        when 'Separated'
          status = 'ser separado'
        when 'Divorced'
          status = 'ser divorciado'
      end
      trait.category = 'Estado civil'
      trait.description = "Ele disse #{status}"
      trait.save
    end
  end

  def self.sport(suspect)
    sports = suspect['raw_info']['sports']
    if sports
      trait = Trait.new(:suspect_id => suspect['id'])
      sport = sports.sample['name']
      trait.category = 'Esporte'
      trait.description = "Ele pratica #{sport}"
      trait.save
    end
  end

  def self.favorite_team(suspect)
    teams = suspect['raw_info']['favorite_teams']
    if teams
      trait = Trait.new(:suspect_id => suspect['id'])
      team = teams.sample['name']
      trait.category = 'Time Favorito'
      trait.description = "Ele torce para #{team}"
      trait.save
    end
  end

  def self.favorite_athlete(suspect)
    athletes = suspect['raw_info']['favorite_athletes']
    if athletes
      trait = Trait.new(:suspect_id => suspect['id'])
      athlete = athletes.sample['name']
      trait.category = 'Atleta Favorito'
      trait.description = "Ele considera #{athlete} seu atleta favorito"
      trait.save
    end
  end

  def self.significant_other(suspect)
    significant_other = suspect['raw_info']['significant_other']
    if significant_other
      trait = Trait.new(:suspect_id => suspect['id'])
      person = significant_other['name']
      trait.category = 'Em um relacionamento com'
      trait.description = "Ele está em um relacionamento com #{person}"
      trait.save
    end
  end

  def self.inspirational_people(suspect)
    inspirational_people = suspect['raw_info']['inspirational_people']
    if inspirational_people
      trait = Trait.new(:suspect_id => suspect['id'])
      person = inspirational_people.sample['name']
      trait.category = 'Pessoa que lhe inspira'
      trait.description = "#{person} o inspira"
      trait.save
    end
  end

  def self.bio(suspect)
    bio = suspect['raw_info']['bio']
    if bio
      trait = Trait.new(:suspect_id => suspect['id'])
      trait.category = 'Sobre'
      trait.description = "Ele deixou cair isso: #{bio}"
      trait.save
    end
  end

  def self.quotes(suspect)
    quotes = suspect['raw_info']['quotes']
    if quotes
      trait = Trait.new(:suspect_id => suspect['id'])
      trait.category = 'Frase'
      trait.description = "Ele deixou cair isso: #{quotes}"
      trait.save
    end
  end

  #List of objects: https://developers.facebook.com/docs/reference/api/user/

end
