# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions=Array.new
questions=[["5+5",3,6,10,3,3,"math"],
           ["Brain of the Computer","mouse","keyboard","RAM","Processor",4,"hardware"],
           ["What are light weight processes","threads","runners","workers","process",1,"operating system"],
           ["6+5",11,6,10,3,1,"math"],
           ["Whats the name of the pointing device?","mouse","keyboard","RAM","Processor",1,"hardware"],
           ["Which of the following is an OS?","Win","Windows","IBM","Rose",2,"operating system"],
           ["9+5",3,6,14,3,3,"math"]]

questions.each do |question|
  q=Question.create(:question=>question[0])
  a=Array.new
  a << Answer.create(:answer=>question[1],:is_correct=>false)
  a << Answer.create(:answer=>question[2],:is_correct=>false)
  a << Answer.create(:answer=>question[3],:is_correct=>false)
  a << Answer.create(:answer=>question[4],:is_correct=>false)

  a[question[5]-1].is_correct=true

  q.answers=a
  q.tag_list=question[6]
  q.save
end

if User.all.length==0
  User.create(:username=>"administrator",:password=>"railsrocks",:password_confirmation=>"railsrocks")
end
