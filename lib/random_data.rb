require 'faker'

module RandomData
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

  def self.random_sentence
    strings = []
    rand(5..10).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  def self.random_name
    "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  end

  def self.random_email
    Faker::Internet.email
  end

  def self.random_password
    Faker::Internet.password(6)
  end

  def self.random_word
    Faker::Color.color_name
  end
end
