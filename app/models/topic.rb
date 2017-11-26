class Topic < ApplicationRecord
  has_and_belongs_to_many :users
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  def self.create(params)
    retry_count = 2
    begin
      if params[:name].blank?
        raise ArgumentError.new("name is a required field")
      end
      topic 			= Topic.new
      topic.name		= params[:name]
      topic.description = params[:description]
      dup = topic.duplicate
      if dup.present?
        return dup
      end
      if topic.save
        return topic
      else
        puts "DEBUG>> error while saving topic: #{topic.errors.inspect}"
        return nil
      end
    rescue ActiveRecord::RecordNotUnique => e
      puts "DEBUG>> caught record not unique exception while making topic: #{e.message}"
      retry_count -= 1
      retry if retry_count > 0
      puts e.backtrace.join("\n\t")
      return nil
    end
  end

  def duplicate
    return Topic.where("name = ?", self.name).take
  end
end
