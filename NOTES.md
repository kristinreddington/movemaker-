MAKEMOVES app

-app for dancers to book open classes at studio

-Models: users, classes, genres

User:  has_many :bookings, has_many :classes, :through => :bookings
Class: belongs_to :genre, has_many :users, :through => :bookings 
Bookings: belongs_to :user, belongs_to :class

User: {:name, :dance_level, :pw,}

Class: {:name, :genre, :level, :date, :time}

Bookings: {:user_id, :class_id}
