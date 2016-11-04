# -*- encoding : utf-8 -*-
ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rubygems'
require 'rufus/scheduler'
require 'rails'
require 'uri'

scheduler = Rufus::Scheduler.new

scheduler.every '5s' do
  `echo "#{Time.now}" >> temp`
  # 能用crontab(http://crontab.org/)的表达形式
  # 每天凌晨5分钟后执行
end

scheduler.join



