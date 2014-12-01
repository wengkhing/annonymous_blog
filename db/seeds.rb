require 'faker'

if Post.all.count == 0
  100.times {Post.create(title: Faker::Lorem.sentence(4), body: Faker::Lorem.paragraph(4), click_count: 0)}
end

if Tag.all.count == 0
  15.times {Tag.create(name: Faker::Lorem.word)}
end

if Tagging.all.count == 0
  Post.all.each do |p|
    temparr = []
    (rand(4) + 1).times do
      tempid = 1 + rand(15)
      unless temparr.include? tempid
        Tagging.create(post: p, tag: Tag.find(tempid))
        temparr << tempid
      end
      p temparr
    end
  end
end