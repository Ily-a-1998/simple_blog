class Post < ApplicationRecord
	has_many :comments #каждый пост может иметь много коментариев
	validates :title, presence: true, length: {minimum: 5}# presence: true - проверка будет вызываться автоматически
end
