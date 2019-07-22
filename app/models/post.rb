class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  before_validation :make_title_case

  # before_save :email_author_about_post

  private
#title.split = splits a string into an array of individual words
#if any of these words first letter (w[0]) is not an upcase, then return the "Title must be in the title case"
  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
