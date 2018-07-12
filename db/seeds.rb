

DATA = {

  :user_keys =>
    ["name", "password", "level", "email"],
  :users => [
    ["Madison ","password", "beginner", "madison@flatiron.com"],
    ["Misty Copeland", "password", "intermidate", "misty@flatiron.com"],
    ["Kristin Reddingon", "password", "intermidate","kristin@flatiron.com"],
    ["Megan Charpentier", "password", "beginner", "megan@flatiron.com"],
    ["Delaney Glazer", "password", "advanced", "delaney@flatiron.com"],
    ["Matt Steffanina", "password", "advanced", "matt@flatiron.com"],
  ],

  :admins => [
    "Mary Elitch Long",
    "John Elitch"
  ]
}

def main
  make_users
  make_admin
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |name|
    User.create(name: name, admin: true, password: 'password')
  end
end

main
