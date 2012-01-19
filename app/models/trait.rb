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
      trait.description = "Ele mencionou algo sobre ter estudado em #{school}"
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
    trait = Trait.new(:suspect_id => suspect['id'])
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

  #List of objects: https://developers.facebook.com/docs/reference/api/user/
  #Sports
  #Favorite Team
  #favorite_athletes
  #significant_other
  #inspirational_people
  #bio
  #Quotes

end
