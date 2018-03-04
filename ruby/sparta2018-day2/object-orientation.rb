class User

  @@count = 0
  @@name = ""
  attr_accessor :name, :email
  def initialize(name, email)
    @name = name
    @email = email
    @@count += 1
    @@name += name+"\n"
  end

  def count
    puts @@count
  end

  def self.all_name
    puts @@name
  end
end

user_1 = User.new('Kazuma', 'kazuma@example.com')

user_1.count # 1

user_2 = User.new('Tsukahara', 'tsukahara@example.com')

user_1.count # 2
User.all_name