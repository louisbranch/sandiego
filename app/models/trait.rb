# encoding: UTF-8
class Trait < ActiveRecord::Base
  belongs_to :suspect
  has_many :networks, :as => :informable

  validates :suspect, :presence => true
  validates :category, :presence => true
  validates :description, :presence => true

  scope :found, :conditions => { :found => true }

  def gender
    gender = suspect.raw_info['gender']
    if gender
      self.category = 'gender'
      case gender
        when 'male'
          gender_type = 'masculino'
        when 'female'
          gender_type = 'feminino'
      end
      self.description = "O Suspeito era do sexo #{gender_type}"
      self.save
    end
  end

  def birthday
    birthday = suspect.raw_info['birthday']
    year_regex = /\d\d\/\d\d\/\d\d\d\d/
    if birthday && birthday.match(year_regex)
      years = Time.now.year - birthday.match(/\d\d\d\d/)[0].to_i
      self.category = 'birthday'
      self.description = "Ele parecia ter #{years} anos"
      self.save
    end
  end

  def hometown
    hometown = suspect.raw_info['hometown']
    if hometown
      hometown = hometown['name']
      unless hometown.nil?
        self.category = 'hometown'
        self.description = "Ele revelou ser de #{hometown}"
        self.save
      end
    end
  end

  def current_city
    current_city = suspect.raw_info['location']
    if current_city
      current_city = current_city['name']
      self.category = 'hometown'
      self.description = "Ele disse que mora em #{current_city}"
      self.save
    end
  end

  def education
    education = suspect.raw_info['education']
    if education
      education = education.sample
      school = education['school']['name']
      self.category = 'education'
      self.description = "Ele mencionou algo sobre ter estudado em #{school}"
      self.save
    end
  end

  def work
    work = suspect.raw_info['work']
    if work
      work = work.sample
      employer = work['employer']['name']
      self.category = 'work'
      self.description = "Ele trabalhou para #{employer}"
      self.save
    end
  end

  def language
    languages = suspect.raw_info['languages']
    if languages
      language = languages.sample
      language = language['name']
      self.category = 'language'
      self.description = "Eu ouvi ele falando em #{language}"
      self.save
    end
  end

  def relationship_status
    relationship_status = suspect.raw_info['relationship_status']
    if relationship_status
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
      self.category = 'relationship_status'
      self.description = "Ele disse #{status}"
      self.save
    end
  end

  #List of objects: https://developers.facebook.com/docs/reference/api/user/
  #Sports
  #Favorite Team
  #favorite_athletes
  #significant_other
  #bio
  #Quotes

end
