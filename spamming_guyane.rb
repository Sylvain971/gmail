require 'nokogiri'
require 'open-uri'
require 'pry'

#Je crée une méthode pour récupérer l'adresse email d'une seule mairie via sa page dédiée.  
def get_the_email_of_a_townhall_from_its_webpage
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/973/kourou.html"))

	#J'ai regardé le code source et cherché à identifier le plus précisément possible l'élément qui contient l'adresse email. Il s'agit d'un p, dont la classe est "Style 22" situé à la 11ème position. J'ai demandé à la fonction d'aller me chercher précisément cet élément. Je l'enregistre dans la variable email_vaureal. Je convertis en texte pour ne pas récupérer les balises
	email_kourou = doc.css('p[class = "Style22"]')[11].text
end

get_the_email_of_a_townhall_from_its_webpage

#Je crée une méthode pour récupérer les url de toutes les mairies du Val d'Oise.
def get_all_the_urls_of_guyane_townhalls
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/guyane.html"))
	#Je crée un array pour stocker les urls que je vais collecter. 
	$list_of_url_973 = []

	#J'applique le même raisonnement que précédemment, j'identifie l'élément qui contient les url : l'élément a et sa classe lientxt pour le sélectionner. 
	doc.css("a[class = 'lientxt']").each do |url|
		#Pour chacun, j'enregistre le href dans le tableau créé à cet effet.
		$list_of_url_973 << url["href"]
	end
end	

get_all_the_urls_of_guyane_townhalls

#Je crée une méthode pour récupérer toutes les adresses emails de toutes les mairies
def get_all_the_emails_of_guyane_townhalls
	$data_guyane = Hash.new
	$list_of_url_973.each do |url|
		url = "http://annuaire-des-mairies.com/" + url
		doc = Nokogiri::HTML(open(url))
		town = doc.css('a[class = "lientxt4"]')[0].text
		email = doc.css('p[class = "Style22"]')[11].text
		$data_guyane[town] = email
	end
end

get_all_the_emails_of_guyane_townhalls