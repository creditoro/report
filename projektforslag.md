# Creditoro og dato 29-05-2020 kl. 12.00

# Uddannelse
Softwareteknologi

# Projegruppe og vejleder
**Gruppenummer:** 06
**Kontaktoplysninger:** Findes i [gruppekontrakten](https://github.com/creditoro/report/blob/master/gruppekontrakt.md)

# Problemstilling
![system drawing](https://cdn.discordapp.com/attachments/673822129946361859/674706669921632256/TV2-Credits-Management.png)  


Systemet afspejler det system TV2 har lagt op til i projekt-casen. Der er tale om et system, hvor man kan se - og redigere krediteringstekster for programmer.   
Systemet indeholder forskellige brugerroller:  
 
- Administrator
  - Kan redigere, oprette - samt slette krediteringstekster.
- Bruger  
  - Kan redigere samt oprette krediteringstekster.
- Gæst (ikke autentificeret)
  - Kan se krediteringstekster for programmer.
  
  
Systemet består af forskellige programmer:   

- EPG Poller (should have)
  - Henter data fra Electronic Program Guide (EPG) og indsætter nye programmer i vores database via REST API'et, der gør at brugere ikke skal oprette programmet, men blot tilføje krediteringstekster.
- Desktop Client (must have)
  - Brugergrænseflade, der gør det let at se, søge, redigere samt slette krediteringstekster for programmer.
- Rest API (must have)
  - Api'et binder alle andre programmer sammen, ved at udbyde endpoints, der muliggører at foretage alle aktioner beskrevet i systemets andre programmer.
- Website (nice to have)
  - Brugergrænseflade som beskrevet i *Desktop Client* men som website, da det vil afspejle den løsning TV2 nok vil bruge i sidste ende.
  
Dette er implementeret via et REST API, som er den applikation der styrer vores business logic. For at gøre systemet brugervenligt, laves en dekstop client (GUI).   



# Faglig og personlig motivation
Motivation er at vi ikke bare vil lave minimus kravet, da der er en støre personlig interesse for at lave et større system, der afspejler det system som projekt casen har lagt op til
og kunne være en interesse for TV2.
hvad kan vi få ud af det
fx. farveligt



# Nuværende viden
TV2 efterspørger en løsning der gør at de kan cutte rulleteksterne der kommer efter en film eller lign. og derved få ekstra 30 sekunders visning af reklamer. 
Systemet kan indeholde:  
Bruger adgang:  

- Administrator 	(se/redigere/oprette og slette bruger)  
- TV2 brugere 		(se/redigere)  
- Gæster 			(se)  

TV2 skal kunne exportere til fx. XML og CSV.  
Systemet må ikke have personlig data offtentlig.  
TV2 finder muligheden intergration for andre systemer interessant.   
Notifikationer, så hvis krediteringer bliver opdateret, notifikeres de andre systemer.   


### Software Engineering og Modellering til CPS 
- Tilrettelægge og gennemføre udvikling af en softwareapplikation i en objektorienteret proces
- Bruge modelleringsværktøjer for CPS modeller til at understøtte designprocessen 


### Videregående projektorienteret programmering

- Programmere et softwareprodukt på grundlag af objektorienterede systemmodeller 
- Eksperimentere med valg af programmeringssprog til forskellige problemtyper 


### Databaser
- Udarbejde et databasedesign 
- Udforme databaseforespørgsler og benytte disse fra en applikation 


### Ingeniørgrundlag og praksis
- Udforme projektgrundlag og milepælsplan 
- Kunne samarbejde og kunne udføre individuelt arbejde 
- Planlægge og styre projektets tidsmæssige forløb ved fremstilling af tidsplaner, mødedagsordener og mødereferater, samt påtage sig ansvaret for bestemte områder af projektarbejdet, herunder projektledelse 
- Anvende udvalgte hjælpeteknikker og værktøjer til projektarbejdet samt til kommunikation af projektets resultater 
- Skrive klar, præcis, og nøjagtig teknisk dokumentation, der følger veldefinerede standarder mht. format og inddragelse af relevante tabeller, figurer og referencer 
- Reviewe teknisk dokumentation 
- Formulere sig skriftligt om egen og andres indsats i projektsamarbejdet 
- Argumentere for og vurdere gode og mindre gode arbejdsprocesser og præferencer 


### Hvad ved vi ikke endnu:
Krediterings regler for TV2  
Vi ved ikke noget om integrering af systemet til TV2 



# Rammetidsplan
[Rammetidsplan](https://docs.google.com/document/d/1GcyBqYznrnS67T8T1zZoPxFWeUDLLc6jlVvnFreY6GU/edit)
[Egen tidsplan](https://app.zenhub.com/workspaces/creditoro-5e4bb6f86a062ec95338879d/board)

# Gruppeværktøjer
**Gruppeværktøjer:** Se [Gruppekontrakt](https://github.com/creditoro/report/blob/master/gruppekontrakt.md) under afsnittet Værktøjer

# Gruppekontrakt
[Gruppekontrakt](https://github.com/creditoro/report/blob/master/gruppekontrakt.md)

# Vejlederkontrakt
[Vejlederkontrakt](https://github.com/creditoro/report/blob/master/Vejlederkontrakt.md)
