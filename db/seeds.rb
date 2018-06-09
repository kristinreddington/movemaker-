use 'Datetime '
DATA = {

  :user_keys =>
    ["name", "password", "level"],
  :users => [
    ["Max Charles","password", "beginner"],
    ["Skai Jackson", "password", "intermidate"],
    ["Kaleo Elam", "password", "intermidate"],
    ["Megan Charpentier", "password", "beginner"],
    ["Hayden Byerly", "password", "advanced"],
    ["Tenzing Norgay Trainor", "password", "professional"],
    ["Davis Cleveland", "password", "advanced"],
    ["Cole Sand", "password", "intermidate"],
    ["Quvenzhané Wallis", "password", "beginner"]
  ],

  :lesson_keys =>
   ["name", "genre", "level", "date"],
  :lessons => [
    ["Barre Work", "Ballet", "intermidate", Datetime.new(2018,6,13,5,0,0)],
    ["Hip Hop Work", "Hip Hop", "advanced", Datetime.new(2018,5,22,5,30,0)],
    ["Breakdancing Basics", "Hip Hop", "beginner", Datetime.new(2018,6,30,7,0,0)],
    ["Split and Stretch", "Fundamentals", "beginner", Datetime.new(2018,6,17,6,30,0)],
    ["Move Groove", "Contemporary", "intermidate", Datetime.new(2018,6,22,6,0,0)],
    ["Crump 101", "Hip Hop","beginner", Datetime.new(2018,6,13,5,0,0)],
    ["Common Technique", "Fundamentals", "beginner", Datetime.new(2018,1,1,7,0,0)]
  ],
  :admins => [
    "Mary Elitch Long",
    "John Elitch"
  ]
}

def main
  make_users
  make_admin
  make_lessons
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

def make_lessons
  DATA[:lessons].each do |lesson|
    new_lesson = Lesson.new
    lesson.each_with_index do |attribute, i|
      new_lesson.send(DATA[:lesson_keys][i] + "=", attribute)
    end
    rand(1..8).times do
      dancers = []
      User.all.each {|u| dancers << u if u.admin != true}
      new_lesson.users << dancers[rand(0...dancers.length)]
    end
    new_lessson.users.each {|d| d.save}
    new_lessson.save
  end
end

main
