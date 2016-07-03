module ExtraFromProducts
    extend ActiveSupport::Concern
def download
  if params[:format] == "csv"
  file = "#{Rails.root}/public/mobiles.csv"
  if File.exists? file
    FileUtils.rm file
  end
  CSV.open(file, "a+") do | csv |
    csv << ["id", "company", "product", "specs", "price", "created_at", "updated_at"]
    Mobile.all.each do |mobile|
      csv << ActiveRecord::Base.connection.select_one("select * from mobiles where id = #{mobile.id}").values
    end
  end
  send_file file, :disposition => 'attachment'
  elsif params[:format] == "xml"
  file = "#{Rails.root}/public/mobiles.xml"
   mobile = Mobile.all.map {|mob| mob}.to_xml
   File.open(file, "a+") {|wtf| wtf.write(mobile)}
   send_file file, :disposition => 'attachment'
  elsif params[:format] == "json"
   file = "#{Rails.root}/public/mobiles.json"
   mobile = Mobile.all.map {|mob| mob.to_json}
   File.open(file, "a+") {|wtf| wtf.write(mobile)}
   send_file file, :disposition => 'attachment'
  end
end
end
 
