class Article < ActiveRecord::Base
  belongs_to :classificate
  mount_uploader :logo, LogoUploader

  def self.tongji
	  @x_axis = Count.all.map{ |count|  "'#{count.date}'" }.join(',')
	  @daily_pvs = Count.all.map { |count| count.counts }.join(',')
    {:x => @x_axis, :y => @daily_pvs}
  end
end
