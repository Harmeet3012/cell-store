class Mobile < ActiveRecord::Base
    before_destroy :destroy_obj
    has_many :images
    accepts_nested_attributes_for :images
    def destroy_obj
      File.open("#{Rails.root}/log/backup","a+") do |file|
          file.puts(self.to_json)
      end
    end
end
