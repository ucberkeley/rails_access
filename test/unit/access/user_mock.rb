class User

  def new_record?
    false
  end

  def id
    1
  end

  def self.transaction
    yield
  end

  def self.primary_key
    'id'
  end

end
