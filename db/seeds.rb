require 'open-uri'
require 'openssl'

# Teams
records = Nokogiri::HTML(open("http://www.espn.com/college-football/standings/_/season/#2009", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))

	records.css('.standings-row').each do |record|

		name = record.css('.team-names').text
		name == "Hawai'i" ? name = 'Hawaii' : name = name
		
		x = Team.create!(name: name)
	end


# Team Rankings
teams = Nokogiri::HTML(open("http://247sports.com/Season/2010-Football/CompositeTeamRankings", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
teams = teams.css('.rankingcmp_lst li').to_s
teams = teams.split('<div class="rank_blk">')

teams.each_with_index do |t, i|
	next if i%2 == 1
	next if i == 0
	title = /(title=)[^>]*/.match(t).to_s
	title = title[7..-2]
	title == 'Texas A&amp;M' ? title = 'Texas A&M' : title = title
	title == 'Brigham Young' ? title = 'BYU' : title = title
	title == 'N.C. State' ? title = 'NC State' : title = title

	five = t.index('<b class="grey">5')
	five = t[five + 58..five + 59].to_i

	four = t.index('<b class="grey">4')
	four = t[four + 58..four + 59].to_i

	three = t.index('<b class="grey">3')
	three = t[three + 58..three + 59].to_i

	x = RecruitingClass.create!(year: 2010, rank: i/2, team_id: Team.find_by(name: title).id, five_stars: five, four_stars: four, three_stars: three)
end



# Team Results
[2010, 2011, 2012, 2013, 2014].each do |year|

	records = Nokogiri::HTML(open("http://www.espn.com/college-football/standings/_/season/#{year.to_s}", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))

	records.css('.standings-row').each do |record|

		name = record.css('.team-names').text
		result = record.css(':nth-child(5)').text

		next if name == 'UAB'
		name == "Hawai'i" ? name = 'Hawaii' : name = name
		
		x = Record.create!(year: year, result: result, team_id: Team.find_by(name: name).id)
	end
end