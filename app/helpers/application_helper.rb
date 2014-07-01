module ApplicationHelper
	def self.json_parser(parsing_object)
		JSON.parse(parsing_object)
	end
end
