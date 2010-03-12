module ItemsHelper

def new_line_to_br str
	str.gsub "\n", "<br>"
end

end
