
require 'gmail'

$gmail = Gmail.connect("tes_identifiants)

$email = "ton_email"

def envoi_email(email)
	$mail = $gmail.compose do
  	to $email
  	subject "Formez vos administrés au développement web, et ce gratuitement !"
  	body "Bonjour,
	Je m'appelle Fabien, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

	Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à Paris, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec Paris !

	Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
	end
end

$gmail.deliver($mail) # or: email.deliver!

$gmail.logout

Gmail.connect("fabien.cornelie.971", "lenuagedemains2015") do |gmail|
  $gmail.logged_in?
end