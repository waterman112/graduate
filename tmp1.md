
  defqtongjitu
		@x_axis = Count.all.map{ |count|  "'#{count.date}'" }.join(',')
		@daily_pvs = Count.all.map { |count| count.counts }.join(',')
		puts "== @x_axis : #{@x_axis}, @daily_pvs: #{@daily_pvs}"
  end
