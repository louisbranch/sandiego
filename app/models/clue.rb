class Clue < ActiveRecord::Base
  belongs_to :suspect

  validates :suspect, :presence => true
  validates :category, :presence => true
  validates :description, :presence => true

  def gender
    gender = suspect.raw_info['gender']
    if gender
      self.category = 'gender'
      if gender == 'male'
        gender_type = 'masculino'
      elsif gender == 'female'
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
      self.category = 'hometown'
      self.description = "Ele parecia ter #{years} anos"
      self.save
    end
  end

  def hometown
    hometown = suspect.raw_info['hometown']
    if hometown
      hometown = hometown['name']
      self.category = 'hometown'
      self.description = "Ele revelou ser de #{hometown}"
      self.save
    end
  end

  def current_city
    current_city = suspect.raw_info['location']
    if current_city
      current_city = current_city['name']
      self.category = 'hometown'
      self.description = "Ele disse morar em #{current_city}"
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
      self.description = "Ele ter tralhado para #{employer}"
      self.save
    end
  end

end

