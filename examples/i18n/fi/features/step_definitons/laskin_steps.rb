# encoding: utf-8
require 'spec/expectations'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'cucumber/formatters/unicode'
require 'laskin'

Before do
  @laskin = Laskin.new
end

After do
end

Given "että olen syöttänyt laskimeen luvun $n" do |n|
  @laskin.pinoa n.to_i
end

When /painan "(\w+)"/ do |op|
  @tulos = @laskin.send op
end

Then /laskimen ruudulla pitäisi näkyä tulos (.*)/ do |tulos|
  @tulos.should == tulos.to_f
end

Then /tuloksen luokan pitäisi olla (\w*)/ do |luokan_nimi|
  @tulos.class.name.should == luokan_nimi
end