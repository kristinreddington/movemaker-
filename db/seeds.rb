

DATA = {

  :user_keys =>
    ["name", "password", "level"],
  :users => [
    ["Madison ","password", "beginner"],
    ["Misty Copeland", "password", "intermidate"],
    ["Kristin Reddingon", "password", "intermidate"],
    ["Megan Charpentier", "password", "beginner"],
    ["Delaney Glazer", "password", "advanced"],
    ["Matt Steffanina", "password", "advanced"],
    ["Davis Cleveland", "password", "advanced"],
    ["Cole Sand", "password", "intermidate"],
    ["Quvenzhané Wallis", "password", "beginner"]
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
