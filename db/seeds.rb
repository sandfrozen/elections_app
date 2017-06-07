# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ElectionCandidate.destroy_all
ElectionUser.destroy_all
Election.destroy_all
ElectionType.destroy_all
User.destroy_all

user_a = User.create!( name: 'Admin', surname: 'Adminadmi', email: 'admin@ad.pl', pesel: 40041440404, admin: true, password: 'adminmind') #1
User.create!( name: 'Tomasz', surname: 'Buslowski', email: 'tombs@wp.pl', pesel: 94091594949, password: 'Asd123') #2

# imie_m = ['Jan', 'Andrzej', 'Piotr', 'Krzysztof', 'Stanisław', 'Tomasz', 'Paweł', 'Józef', 'Marcin', 'Marek', 'Michał',
#           'Grzegorz', 'Jerzy', 'Tadeusz', 'Adam', 'Łukasz', 'Zbigniew', 'Ryszard', 'Dariusz', 'Henryk', 'Mariusz',
#           'Kazimierz', 'Wojciech', 'Robert', 'Mateusz', 'MarSian', 'Rafał', 'Jacek', 'Janusz', 'Mirosław', 'Maciej',
#           'Sławomir', 'Jarosław', 'Kamil', 'Wiesław', 'Roman', 'Władysław', 'Jakub', 'Artur', 'Zdzisław', 'Edward',
#           'Mieczysław', 'Damian', 'Dawid', 'Przemysław', 'Sebastian', 'Czesław', 'Leszek', 'Daniel', 'Waldemar' ]
#
# nazwisko_m = [ 'Nowak', 'Kowalski', 'Wiśniewski', 'Dąbrowski', 'Lewandowski', 'Wójcik', 'Kamiński', 'Kowalczyk',
#                'Zieliński', 'Szymański', 'Woźniak', 'Kozłowski', 'Jankowski', 'Wojciechowski', 'Kwiatkowski' ]
#
# imie_m.each do |i|
#   nazwisko_m.each do |n|
#     y = rand(30..99).to_s
#     m = rand(1..12).to_s
#     d = rand(1..30).to_s
#     k = rand(10000..49999).to_s
#     pesel1 = y + m.rjust(2, '0') + d.rjust(2, '0') + k
#     User.create!( name: i, surname: n, email: "#{i}.#{n}.#{y}@wp.pl", pesel: pesel1, password: "#{i}#{n}" )
#   end
# end
#
# imie_d = [ 'Anna', 'Maria', 'Katarzyna', 'Małgorzata', 'Agnieszka', 'Krystyna', 'Barbara', 'Ewa', 'Elżbieta', 'Zofia',
#            'Janina', 'Teresa', 'Joanna', 'Magdalena', 'Monika', 'Jadwiga', 'Danuta', 'Irena', 'Halina', 'Helena',
#            'Beata', 'Aleksandra', 'Marta', 'Dorota', 'Marianna', 'Grażyna', 'Stanisława', 'Iwona', 'Karolina', 'Bożena',
#            'Urszula', 'Justyna', 'Renata', 'Alicja', 'Paulina', 'Sylwia', 'Natalia', 'Wanda', 'Agata', 'Aneta',
#            'Izabela', 'Ewelina', 'Marzena', 'Wiesława', 'Genowefa', 'Patrycja', 'Kazimiera', 'Edyta', 'Stefania' ]
#
# nazwisko_d = [ 'Nowak', 'Kowalska', 'Wiśniewska', 'Dąbrowska', 'Lewandowska', 'Wójcik', 'Kamińska', 'Kowalczyk',
#                'Zielińska', 'Szymańska', 'Woźniak', 'Kozłowska', 'Jankowska', 'Wojciechowska', 'Kwiatkowska' ]
# imie_d.each do |i|
#   nazwisko_d.each do |n|
#     y = rand(30..99).to_s
#     m = rand(1..12).to_s
#     d = rand(1..30).to_s
#     k = rand(50000..99999).to_s
#     pesel1 = y + m.rjust(2, '0') + d.rjust(2, '0') + k
#     User.create!( name: i, surname: n, email: "#{i}.#{n}.#{y}@wp.pl", pesel: pesel1, password: "#{i}#{n}" )
#   end
# end
puts "<<<< <<< << < SEED > >> >>> >>>> Dodano #{User.count} uzytkownikow"

el_type = ElectionType.create!( name: "Wybory Prezydenckie" ) #1
ElectionType.create!( name: "Wybory Parlamentarne" ) #2
ElectionType.create!( name: "Wybory Rektora Politechniki Białostockiej" ) #3
ElectionType.create!( name: "Wybory Dziekana Wydziału Informatyki Politechniki Białostockiej" ) #4
ElectionType.create!( name: "Wybory Przewodniczącego Samorządu Studentów Politechniki Białostockiej" ) #5
puts "<<<< <<< << < SEED > >> >>> >>>> Dodano #{ElectionType.count} typów wyborów"

election_a = Election.create!( name: "Nazwa Testowa Wyborów", info: "Informacja", start: (Time.now), stop: (Time.now)+2.days, max_votes: 1, election_type: el_type)
puts "<<<< <<< << < SEED > >> >>> >>>> Dodano #{Election.count} wyborów"

ElectionUser.create!( vote: 1, user: user_a, election: election_a)
puts "<<<< <<< << < SEED > >> >>> >>>> Dodano #{ElectionUser.count} electionuser"

ElectionCandidate.create!(party: 1, list: 1, place: 1, user: user_a, election: election_a)
puts "<<<< <<< << < SEED > >> >>> >>>> Dodano #{ElectionCandidate.count} electioncandidate"