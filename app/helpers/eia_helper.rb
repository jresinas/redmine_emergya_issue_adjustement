module EiaHelper
  def ignore_accents(str)
  	str.gsub('Á','A').gsub('á','a').gsub('É','E').gsub('é','e').gsub('Í','I').gsub('í','i').gsub('Ó','O').gsub('ó','o').gsub('Ú','U').gsub('ú','u')
  end

  def nil_to_empty(element)
		if element == nil
			return ""
		else
			return element
		end
	end
end