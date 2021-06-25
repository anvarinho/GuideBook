//
//  ViewModel.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import Foundation

class ViewModel: ObservableObject {
    //@Published var mapData = MapViewModel()
    @Published var places = [City]()
    @Published var pearls = [Pearl]()
    @Published var ikPearls = [Pearl]()
    @Published var locations = [Location]()
    @Published var showMap = false
    @Published var showInfo = false
    @Published var showAboutCountry = false
    @Published var showAboutVisa = false
    @Published var showGuideView = false
    
    init() {
        getData()
        getData2()
        getData3()
        getLocations()
        
    }
    func getData(){
        if let url = Bundle.main.url(forResource: "dataJson", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let decode = try? JSONDecoder().decode(Cities.self, from: data){
                self.places = decode.cities
            }
        }
    }
    
    func getData2(){
        if let url = Bundle.main.url(forResource: "pearlsData", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let decode = try? JSONDecoder().decode(Pearls.self, from: data){
                self.pearls = decode.pearls
            }
        }
    }
    
    func getData3(){
        if let url = Bundle.main.url(forResource: "pearlsData1", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let decode = try? JSONDecoder().decode(Pearls.self, from: data){
                self.ikPearls = decode.pearls
            }
        }
    }
    
    func getLocations(){
        for place in places{
            locations.append(place.location)
        }
    }
    func getSumPearls() -> [Pearl]{
        var sum: [Pearl] = []
        sum.append(contentsOf: pearls)
        sum.append(contentsOf: ikPearls)
        return sum
    }
}
extension ViewModel{
    
    func getDescription(_ str: String) -> String{
        switch str {
        case "Bishkek":
           return """
            Bishkek (Kyrgyz: Бишкек, Bişkek, بىشکەک, IPA: [biʃˈkek]), formerly Pishpek and Frunze (Russian: Фрунзе), is the capital and largest city of Kyrgyzstan (Kyrgyz Republic). Bishkek is also the administrative centre of the Chuy Region. The province surrounds the city, although the city itself is not part of the province, but rather a province-level unit of Kyrgyzstan. It is also near the Kazakhstan-Kyrgyzstan border.

            In 1825, the Khanate of Kokand established the fortress of "Pishpek" to control local caravan routes and to collect tribute from Kyrgyz tribes. On 4 September 1860, with the approval of the Kyrgyz, Russian forces led by Colonel Apollon Zimmermann destroyed the fortress. In 1868, a Russian settlement was established on the site of the fortress under its original name, "Pishpek". It lay within the General Governorship of Russian Turkestan and its Semirechye Oblast.

            In 1925, the Kara-Kirghiz Autonomous Oblast was established in Russian Turkestan, promoting Pishpek to its capital. In 1926, the Communist Party of the Soviet Union renamed the city as Frunze, after the Bolshevik military leader Mikhail Frunze (1885–1925), who was born there. In 1936, the city of Frunze became the capital of the Kirghiz Soviet Socialist Republic, during the final stages of the national delimitation in the Soviet Union. In 1991, the Kyrgyz parliament changed the capital's name to "Bishkek".

            Bishkek is situated at an altitude of about 800 metres (2,600 ft), just off the northern fringe of the Kyrgyz Ala-Too Range, an extension of the Tian Shan mountain range. These mountains rise to a height of 4,895 metres (16,060 ft). North of the city, a fertile and gently undulating steppe extends far north into neighbouring Kazakhstan. The Chui River drains most of the area. Bishkek is connected to the Turkestan–Siberia Railway by a spur line.

            Bishkek is a city of wide boulevards and marble-faced public buildings combined with numerous Soviet-style apartment blocks surrounding interior courtyards. There are also thousands of smaller privately built houses, mostly outside the city centre. Streets follow a grid pattern, with most flanked on both sides by narrow irrigation channels, watering innumerable trees to provide shade in the hot summers.

          
          History

          Kokhand rule

          Originally a caravan rest stop (possibly founded by the Sogdians) on one of the branches of the Silk Road through the Tian Shan range, the location was fortified in 1825 by the khan of Kokand with a mud fort. In the last years of Kokhand rule, the Pishpek fortress was led by Atabek, the Datka.

          Tsarist era

          In 1860 Imperial Russia annexed the area, and the military forces of Colonel Apollon Ernestovich Zimmermann [ru] took and razed the fort. Colonel Zimmermann rebuilt the town over the destroyed fort and appointed field-Poruchik Titov as head of a new Russian garrison. The Imperial Russian government redeveloped the site from 1877 onward, encouraging the settlement of Russian peasants by giving them fertile land to develop.

          Soviet era

          Frunze statue near the railway station
          In 1926, the city became the capital of the newly established Kirghiz ASSR and was renamed "Frunze" after Mikhail Frunze, Lenin's close associate who was born in Bishkek and played key roles during the revolutions of 1905 and 1917 and during the Russian Civil War of the early 1920s.

          Independence era

          The early 1990s were tumultuous. In June 1990, a state of emergency was declared following severe ethnic riots in southern Kyrgyzstan that threatened to spread to the capital. The city was renamed Bishkek on 5 February 1991 and Kyrgyzstan achieved independence later that year during the breakup of the Soviet Union. Before independence, the majority of Bishkek's population were ethnic Russians. In 2004, Russians made up approximately 20% of the city's population, and about 7–8% in 2011.[6]

          Today, Bishkek is a modern city with many restaurants and cafes, and with many second-hand European and Japanese cars and minibuses crowding its streets. However, streets and sidewalks have fallen into disrepair since the 1990s. At the same time, Bishkek still preserves its former Soviet feel with Soviet-period buildings and gardens prevailing over newer structures.

          Bishkek is also the country's financial centre, with all of the country's 21 commercial banks headquartered there. During the Soviet era, the city was home to a large number of industrial plants, but most have been shut down since 1991 or now operate on a much-reduced scale. One of Bishkek's largest employment centres today is the Dordoy Bazaar open market, where many of the Chinese goods imported to CIS countries are sold.


          Geography

          Orientation
          Though the city is relatively young, the surrounding area has some sites of interest dating to prehistoric times. There are also sites from the Greco-Buddhist period, the period of Nestorian influence, the era of the Central Asian khanates, and the Soviet period.[citation needed]


          Russian Orthodox cathedral of the Holy Resurrection
          The central part of the city is laid out on a rectangular grid plan. The city's main street is the east-west Chui Avenue (Chuy Prospekti), named after the region's main river. In the Soviet era, it was called Lenin Avenue. Along or near it are many of the most important government buildings and universities. These include the Academy of Sciences compound. The westernmost section of the avenue is known as Deng Xiaoping Avenue.

          The main north–south street is Yusup Abdrakhmanov Street, still commonly referred to by its old name, Sovietskaya Street. Its northern and southern sections are called, respectively, Yelebesov and Baityk Batyr Streets. Several major shopping centers are located along with it, and in the north, it provides access to Dordoy Bazaar.

          Erkindik ("Freedom") Boulevard runs from north to south, from the main railroad station (Bishkek II) south of Chui Avenue to the museum quarter and sculpture park just north of Chui Avenue, and further north toward the Ministry of Foreign Affairs. In the past, it was called Dzerzhinsky Boulevard, named after a Communist revolutionary, Felix Dzerzhinsky, and its northern continuation is still called Dzerzhinsky Street.

          An important east–west street is Jibek Jolu ('Silk Road'). It runs parallel to Chui Avenue about 2 km (1.2 mi) north of it and is part of the main east–west road of Chui Province. Both the eastern and western bus terminals are located along Jibek Jolu.

          There is a Roman Catholic church located at ul. Vasiljeva 197 (near Rynok Bayat). It is the only Catholic cathedral in Kyrgyzstan.[7]

          There is a Stadium after Dolon Omurzakov located near the center of Bishkek. This is the largest stadium in the Kyrgyz Republic.

          City centre

          State Historical Museum, located in Ala-Too Square, the main city square
          State Museum of Applied Arts, containing examples of traditional Kyrgyz handicrafts
          Frunze House Museum
          Statue of Ivan Panfilov in the park near the White House.
          An equestrian statue of Mikhail Frunze stands in a large park (Boulevard Erkindik) across from the train station.
          The train station was built in 1946 by German prisoners of war and has survived since then without further renovation or repairs; most of those who built it perished and were buried in unmarked pits near the station.
          The main government building, the White House, is a huge, seven-story marble block and the former headquarters of the Communist Party of the Kirghiz SSR
          At Ala-Too Square there is an independence monument where the changing of the guards may be watched.
          Osh Bazaar, west of the city center, is a large, picturesque produce market
          Kyrgyz National Philharmonic, concert hall
          Outer neighbourhoods[edit]
          The Dordoy Bazaar, just inside the bypass highway on the north-eastern edge of the city, is a major retail and wholesale market.

          Outside the city

          The Kyrgyz Ala-Too mountain range, some 40 kilometres (25 mi) away, provides a spectacular backdrop to the city; the Ala Archa National Park is only a 30 to 45 minutes drive away.

          Distances

          Bishkek is about 300 km away directly from the country's second city Osh. However, its nearest large city is Almaty of Kazakhstan, which is 190 km to the east. Furthermore, it is 470 km from Tashkent (Uzbekistan), 680 km from Dushanbe (Tajikistan), and about 1,000 km each from Nur-Sultan (Kazakhstan), Ürümqi (China), Islamabad (Pakistan), and Kabul (Afghanistan).

          Climate

          Bishkek has a Mediterranean-influenced humid continental climate (Köppen climate classification Dsa.), as the average mean temperature in the winter is below 0 °C (32.0 °F).[8] Average precipitation is around 440 millimetres (17 in) per year. Average daily high temperatures range from 3 °C (37.4 °F) in January to about 31 °C (87.8 °F) during July.[9] The summer months are dominated by dry periods, punctuated by the occasional thunderstorm, which produces strong gusty winds and rare dust storms. The mountains to the south provide a natural boundary and protection from much of the damaging weather, as does the smaller mountain chain which runs north-west to south-east. In the winter months, sparse snow storms and frequent heavy fog are the dominating features. There are sometimes temperature inversions, during which the fog can last for days at a time.


          Demographics[edit]
          Bishkek is the most populated city in Kyrgyzstan. Its population, estimated in 2019, was 1,012,500.[11] From the foundation of the city to the mid-1990s, ethnic Russians and other peoples of European descent (Ukrainians, Germans) comprised the majority of the city's population. According to the 1970 census, the ethnic Kyrgyz were only 12.3%, while Europeans comprised more than 80% of the Frunze population. Now Bishkek is a predominantly Kyrgyz city, with around 66% of its residents Kyrgyz, while European peoples make up less than 20% of the population. Despite this fact, Russian is the main language while Kyrgyz continues losing ground, especially among the younger generations.

          Air quality

          Emissions of air pollutants in Bishkek amounted to 14,400 tons in 2010. Among all cities in Kyrgyzstan, the level of air pollution in Bishkek is the highest, occasionally exceeding maximum allowable concentrations by several times, especially in the city centre.[23] For example, concentrations of formaldehyde occasionally exceed maximum allowable limits by a factor of four.

          Responsibility for ambient air quality monitoring in Bishkek lies with the Kyrgyz State Agency of Hydrometeorology. There are seven air-quality monitoring stations in Bishkek, measuring levels of sulphur dioxide, nitrogen oxides, formaldehyde and ammonia.

          Housing

          As with many cities in post-Soviet states, housing in Bishkek has undergone extensive changes since the collapse of the Soviet Union. While housing was formerly distributed to citizens in the Soviet era, housing in Bishkek has since become privatised.

          Though single family houses are slowly becoming more popular, the majority of the residents live in Soviet-era apartments. Despite the Kyrgyz economy experiencing growth, increases in available housing has been slow with very little new construction. As a result of this growing prosperity and the lack of new formal housing, prices have been rising significantly—doubling from 2001 to 2002.

          Those unable to afford the high price of housing within Bishkek, notably internal migrants from rural villages and small provincial towns often have to resort to informal squatter settlements on the outskirts of the city. These settlements are estimated to house 400,000 people or about 30 percent of Bishkek's population. While many of the settlements have lacked basic necessities such as electricity and running water, recently there has been a push by the local government to provide these services.

          Government

          Local government is administered by the Bishkek Mayor's Office. Askarbek Salymbekov was mayor until his resignation in August 2005, after which his deputy, Arstanbek Nogoev, took over the mayorship. Nogoev was in turn removed from his position in October 2007 through a decree of President Kurmanbek Bakiyev and replaced by businessman and former first deputy prime minister Daniar Usenov. In July 2008 former head of the Kyrgyz Railways Nariman Tuleyev was appointed mayor, who was dismissed by the interim government after 7 April 2010. From April 2010 to February 2011 Isa Omurkulov, also a former head of the Kyrgyz Railways, was an interim mayor, and from 4 February 2011 to 14 December 2013 he was re-elected the mayor of Bishkek. Kubanychbek Kulmatov was nominated for election by parliamentary group of Social Democratic Party of Kyrgyzstan in city kenesh, and he was elected as a new mayor on 15 January 2014, and stepped down on 9 February 2016. The next mayor, Albek Sabirbekovich Ibraimov, was also nominated for election by parliamentary group of Social Democratic Party of Kyrgyzstan in city kenesh, and he was elected by Bishkek City Kenesh on 27 February 2016. The current mayor is Aziz Surakmatov, who was elected on 8 August 2018.

          Administrative divisions

          Bishkek city covers 169.6 square kilometres (65.5 square miles) and is administered separately and not part of any region. Besides the city proper, one urban-type settlement and one village are administered by the city: Chong-Aryk and Orto-Say. The city is divided into 4 districts: Birinchi May, Lenin, Oktyabr and Sverdlov. Chong-Aryk and Orto-Say are part of Lenin District.

          Sports

          Bishkek is home to Spartak, the largest football stadium in Kyrgyzstan and the only one eligible to host international matches. Several Bishkek-based football teams play on this pitch, including six-time Kyrgyzstan League champions, Dordoi Bishkek. Others include Alga Bishkek, Ilbirs Bishkek, and RUOR-Guardia Bishkek.

          Bishkek hosted the 2014 IIHF Challenge Cup of Asia – Division I.

          """
        case "karakol":
           return """
            Karakol (Kyrgyz: Каракол, Qaraqol/Karakol, قاراقول, Kyrgyz pronunciation: [qɑrɑqoɫ]); formerly Przhevalsk (Russian: Пржевальск), is the fourth largest city in Kyrgyzstan, near the eastern tip of Lake Issyk-Kul in Kyrgyzstan, about 150 kilometres (93 mi) from the Kyrgyzstan–China border and 380 kilometres (240 mi) from the capital Bishkek. It is the administrative capital of Issyk-Kul Region. Its area is 44 square kilometres (17 sq mi) and its resident population was 66,294 in 2009 (both including Pristan'-Przheval'sk).[1] To the north, on highway A363, is Tyup and to the southwest Jeti-Ögüz resort.

            History

            A Russian military outpost founded on 1 July 1869, Karakol grew in the 19th century after explorers came to map the peaks and valleys separating Kyrgyzstan from China. In the 1880s Karakol's population surged with an influx of Dungans, Chinese Muslims fleeing warfare in China.

            In 1888, the Russian explorer Nicholay Przhevalsky died in Karakol of typhoid, while preparing for an expedition to Tibet, the city was renamed Przhevalsk in his honor. After local protests, the town was given its original name back in 1921—a decision reversed in 1939 by Stalin to celebrate the centenary of the explorer's birth. Karakol then remained Przhevalsk until the demise of the Soviet Union in 1991. However the name has been retained by nearby Pristan'-Przheval'sk.

            Nearby Issyk Kul Lake was used by the Soviet military as a testing site for torpedo propulsion and guidance systems and Karakol was thus home to a sizable population of military personnel and their families. Karakol continues to be a major hub for visitors of Issyk Kul Lake.

            Demographics

            Karakol is fourth largest town in Kyrgyzstan after Bishkek, Osh and Jalal-Abad. The population of Karakol, according to the Population and Housing Census of 2009, was 67,100.

            Geography

            Climate

            Karakol features a humid continental climate (Dfb) according to the Köppen climate classification.

            Sights

            The Urkun Massacre Monument

            Terskei Alatoo

            Karakol gorge

            Karakol is one of Kyrgyzstan's major tourist destinations, serving as a good starting point for the excellent hiking, trekking, skiing and mountaineering in the high central Tian Shan to the south and east. Also this city is culturally rich by different ethnic groups that live here such as Dungan, Uighur, Kalmak, Uzbek, Russians and of course Kyrgyz. The city offers a great opportunity to discover other nationalities and cultures within the city.

            Przhevalsky's grave, a memorial park and a small museum dedicated to his and other Russian explorations in Central Asia are some 9 kilometres (5.6 mi) north of Karakol at Pristan Przhevalsky, overlooking the Mikhailovka inlet of Issyk Kul Lake where the former Soviet torpedo testing facilities were located. Facilities themselves are still a closed, military area.

            Karakol has Central Asia's highest ski resort, with 20 km of slopes, situated just 20 minutes from the town.[8] Unlike Shymbulak resort, the riding at Karakol includes forest areas as well as cleared trails.

            Russian Orthodox cathedral


            Karakol Russian-orthodoxy church

            The cathedral was originally built of stone in 1872,[9] when Karakol was a garrison town established as an outpost on the edges of the Tsarist Russian Empire. It was destroyed in 1890 by an earthquake and the current cathedral was built out of wood on a brick base.[9] It took six years to complete, and was finally completed in 1895. During the period of construction, a yurt served the congregation as a church. It has seen considerable service, not just as a church. During an anti-Russian uprising in 1916 its monks were brutally murdered.[9]

            Over the years, particularly following the Revolution in 1917, it has been used as an educational center housing a school, ladies' gymnasium and an institution of Higher Education; a Sports Hall; a Theater; a Dance Hall and even as a Coal Store. Then, in 1991, following the collapse of the Soviet Union and the Independence of Kyrgyzstan, the local authority once again gave the building back to the church, with the proviso that all further restorations were their responsibility.

            Dungan mosque

            Karakol Dungan Mosque
            The Issyk-kul Central Mosque of Karakol city was built for the local Dungan community by an initiative of Ibrahim Aji. He invited the famous Beijing architect Chou Seu and 20 carvers with the skills of traditional Chinese architecture and composition techniques for building the mosque. The construction of outbuildings and other work involved local craftsmen. Construction of the mosque began in 1904 and was completed in 1910.[9] Ingenious techniques allowed the builders to build the mosque with no nails.[9] The mosque holds 42 based pillars and encircling the building is multi-tiered wooden cornice, decorated with images of plants like grapes, pomegranates, pears and peaches. From 1929 to 1947 (during the Soviet era) the mosque was used as a storehouse. In 1947, the building was given to the Muslim community and continues to function as a mosque. It is registered as a historical monument and protected by law. Today the mosque is open to visitors.

            Przhevalsky Museum

            Nikolay Przhevalsky was one of the first Russian Scientist-Geographer to start detailed studies of the geography, flora and fauna of the Central Asian countries. Beginning from 1870, he arranged four large expeditions to Mongolia, China and Tibet.[9] During his expeditions he revealed the exact directions of the mountain ranges and borders of the Tibet Mountains. He described the nature, relief, climate, flora and fauna in the territories under his study and discovered over 200 plant species. Przhevalsky also collected an enormous zoological collection which comprised several thousand species of plants, animals, birds, fishes and insects. In the year of 1888, he died from typhoid fever on the eve of his fifth expedition to Central Asia; he was buried on the Issyk-Kul lakeside not far from the city of Karakol.[9] The Memorial Museum of N. M. Przhevalsky was opened on 29 April 1957 in Karakol.

            Karakol Historical Museum

            This small museum was the pre-revolutionary summer home of the Iliana merchant family. During the turbulent years of 1918–20 the building earned its socialist stripes as headquarters of the Regional Revolutionary Committee, and was subsequently transformed into a museum by order of the Soviet Council of Ministers in 1948. Scythian artifacts include enormous bronze pots retrieved from Lake Issyk-Kul, displayed alongside exhibits on petroglyphs in the area. Besides a comprehensive display of traditional Kyrgyz punched leather work, felt wall hangings and woven yurt decorations, the museum has a colorful collection of national costumes, examples of finely worked silver jewellery and a good exhibition of Kyrgyz applied art. One hall covers the region's flora and fauna – much of which is endangered and listed in the 'Red Book' (a Soviet inventory of protected species). The museum is also worth visiting to gain a Soviet perspective of history in the region. A couple of walls relating to Kyrgyz union with Russia and the subsequent revolution are now historical artifacts in themselves.

            Bugu-Ene Zoo

            Karakol Zoological Park was founded in 1987. This is the only zoo in Kyrgyzstan. After the demise of the Soviet Union, the economics of the country collapsed, and it concerned the newly created object culture. In 2001, closing the zoo was considered. However, sponsors were found, which not only allowed to preserve the wildlife area, but also allowed to keep it in a relatively prosperous state. Nowadays the buildings, cages and cells are not new, but in very good condition. There are Japanese macaques, bears, wolf, deer, camels, lamas, Przewalski's horse, peacock, lions and many others.

            Animal Market

            A Kyrgyz Goat at the Karakol animal market
            Early on Sunday mornings one of Kyrgyzstan's biggest animal markets takes place around 2 km north of central Karakol. Locals loading and unloading sheep into the back of a sedan is not an uncommon sight. The setting amid semi-derelict flour mills might seem unprepossessing, but on clear days the backdrop of white-topped mountains is more striking from here than from the town center. A series of earthen unloading platforms lead north. Jostle through the chaos to reach a bigger main compound one block north, where horses and embossed leather saddlery are for sale. On foot the bazaar is about 25 minutes' walk from City Center.[10]

            """
        case "Osh":
          return  """
            Osh (Kyrgyz: Ош, Oş; Uzbek: O‘sh) is the second largest city in Kyrgyzstan, located in the Fergana Valley in the south of the country and often referred to as the "capital of the south".[3] It is the oldest city in the country (estimated to be more than 3000 years old), and has served as the administrative center of Osh Region since 1939. The city has an ethnically mixed population of about 281,900 in 2017,[4] comprising Uzbeks, Kyrgyz, Russians, Tajiks, and other smaller ethnic groups. It is about 5 km from the Uzbekistan border.


            Overview

            Osh has an important outdoor bazaar which has been taking place on the same spot for the past 2000 years, and was a major market along the Silk Road. The city's industrial base, established during the Soviet period, largely collapsed after the break-up of the Soviet Union and has recently only started to revive.

            The proximity of the Uzbekistan border, which cuts through historically linked territories and settlements, deprives Osh of much of its former hinterland and presents a serious obstacle to trade and economic development. Daily flights from Osh Airport link Osh—and hence the southern part of Kyrgyzstan—to Bishkek and some international destinations, mainly in Russia. Osh has two railway stations and a railway connection to Andijan in neighbouring Uzbekistan, but no passenger traffic and only sporadic freight traffic. Most transport is by road. The recent upgrading of the long and arduous road through the mountains to Bishkek has greatly improved communications.

            The city has several monuments, including one to the southern Kyrgyz "queen" Kurmanjan Datka and one of the few remaining statues of Lenin. A Russian Orthodox church, reopened after the demise of the Soviet Union, the second largest mosque in the country (situated beside the bazaar) and the 16th-century Rabat Abdul Khan Mosque can be found here. The only World Heritage Site in Kyrgyzstan, the Sulayman Mountain, offers a splendid view of Osh and its environs.[5]

            This mountain is thought by some researchers and historians to be the famous landmark of antiquity known as the “Stone Tower", which Claudius Ptolemy wrote about in his famous work Geography. It marked the midpoint on the ancient Silk Road, the overland trade route taken by caravans between Europe and Asia.[6] The National Historical and Archaeological Museum Complex Sulayman is carved in the mountain, containing a collection of archaeological, geological and historical finds and information about local flora and fauna.

            Its first western-style supermarket Narodnyj opened in March 2007.[7]

            Osh is home to Osh State University, one of the largest universities in Kyrgyzstan.[8][circular reference]

            Administration

            Osh city (Ош шаар - Osh shaar) covers 182.5 square kilometres (70.5 square miles)[2] and like the capital city Bishkek, is administered separately and not part of any region, although it is the seat of Osh Region. Besides the city proper, 11 villages are administered by the city: Almalyk, Arek, Gulbaar-Toloykon, Japalak, Kengesh, Kerme-Too, Orke, Pyatiletka, Teeke and parts of Ozgur and Tölöykön.[2]

            Population

            Osh is the second largest city in Kyrgyzstan after the capital city of Bishkek. At the census of 2009 the city population amounted to 258,111, of which 25,925 reside in the 11 villages that are administered by the City of Osh. Of the total population, 57.9% were Uzbeks, 34.2% Kyrgyz, 2.5% Russians, 2.2% Turks, 1.1% Tatars and 2.1% other nationalities.[2] The population of the city with its suburbs in the surrounding Kara-Suu District is estimated at about 500,000 inhabitants (for 2012).


            History

            Early history

            The inhabitants of Osh repulse the occupiers of their city and assist Babur.
            The city is among the oldest settlements in Central Asia. Osh was known as early as the 8th century as a center for silk production along the Silk Road. The famous trading route crossed Alay Mountains to reach Kashgar to the east.[9]

            Babur, founder of the Mughal Empire and descendant of Tamerlane, was born in nearby Andijan, in the Fergana Valley, pondered his future on Sulayman Mountain and even constructed a mosque atop of the mountain. Babur somehow concludes that the confines of the Fergana would cramp his aspirations as a descendant of famous conquering warrior princes. He wrote of the city:

            "There are many sayings about the excellence of Osh. On the southeastern side of the Osh fortress is a well-proportioned mountain called Bara-Koh, where, on its summit, Sultan Mahmud Khan built a pavilion. Farther down, on a spur of the same mountain, I had a porticoed pavilion built in 902 (1496-7)"[10]
            Imperial Russian and Soviet rule[edit]
            The city was occupied and annexed by the Russian Empire in 1876 when Russia overwhelmed the Central Asian khanates during the so-called "Great Game", the contest between Britain and Russia for dominance in Central Asia. This conquest was achieved and the inclusion to the Russian Empire made by the mid-1880s, with main credit to General von Kaufman and General Mikhail Skobelev.[citation needed]

            In the 1960s Osh and other towns in the south of the Kyrgyz SSR began to be industrialized. The population of Osh and other towns in the Fergana Valley that falls within Kyrgyzstan has traditionally consisted of a significant number of ethnic Uzbeks.[11] When Osh started to industrialize the ethnic "Kyrgyz were encouraged to move from the Kyrgyz populated countryside to the cities to work in industrial jobs and public administration."[11] This contributed to the rise of social tension between the two groups.

            1990 riots[edit]
            Main article: Osh riots (1990)
            In 1990, shortly before the end of Soviet power in Central Asia, Osh and its environs experienced bloody ethnic clashes between Kyrgyz and Uzbeks. There were about 1,200 casualties, including over 300 dead and 462 seriously injured.[11] The riots broke out over the division of land resources in and around the city.[12]

            2010 ethnic violence[edit]
            Main article: Ethnic Violence in Southern Kyrgyzstan (2010)
            In 2010, after riots in Bishkek and other major Kyrgyz cities, President Kurmanbek Bakiyev took refuge in the city to hide from protesters denouncing his government and its response to the nation's struggling economy. On May 13, 2010, Bakiyev supporters took over government buildings in Osh, and also seized the airport, preventing interim government officials from landing.[13] The protesters demanded Bakiev's return, and forced the regional governor to flee. The former Osh regional governor Mamasadyk Bakirov was reinstated.

            On June 10, 2010, riots erupted in Osh, killing at least 81 and injuring hundreds of others.[14] "An explosion of violence, destruction and looting in southern Kyrgyzstan on 11–14 June 2010 killed many dozens of people, Kyrgyz and Uzbeks got killed and destroyed over 2000 buildings, mostly homes, and deepened the gulf between the country’s ethnic Kyrgyz and Uzbeks."[15]

            Local media reported that gangs of young men armed with sticks and stones smashed shop windows and set cars aflame in the city center. Several buildings and homes across the city were also set on fire. The city's police force proved incapable of restoring order resulting in a state of emergency being declared and the army being mobilised.[16]

            The Kyrgyz intelligence agency claimed that the 2010 violence was initiated by the just-deposed president, Kurmanbek Bakiyev, who is said to have made a deal with foreign narco-jihadist gangs to take over southern Kyrgyzstan and initiate a shariah state in exchange for the Bakiyev family's being returned to controlling Bishkek.[17] However, to the day no serious proof has been presented to the public and media. According to various sources, up to 100,000 ethnic Uzbeks refugees fled to Uzbekistan. Many refugee camps have been organized in the Andijan, Fergana and Namangan regions of Uzbekistan for Uzbek citizens of Kyrgyzstan who cross the border seeking safety.

            Geography[edit]
            Climate[edit]
            Under the Köppen climate classification, Osh features a continental climate (Dsa), with hot, dry summers and cold winters. Osh receives on average roughly 400 millimeters of precipitation annually, the bulk of which typically falls on the city outside the summer months. Summers are hot in Osh, with average high temperatures routinely exceeding 30 °C. Winters are cold with average temperatures below freezing during a good portion of the season. Spring and autumn are transitional seasons, with temperatures rising during the course of the spring season and falling during the course of the autumn.

            """
        
        case "Jalal-Abad":
            return """
                Jalal-Abad (also spelled Dzhalal-Abad, Djalal-Abat, Jalalabat; Kyrgyz: Жалал-Aбат, Calal-Abat/Jalal-Abat, جالال-ابات, [dʒɑlɑlɑbɑt]) is the administrative and economic centre of Jalal-Abad Region in southwestern Kyrgyzstan. Its area is 88 square kilometres (34 sq mi), and its resident population was 97,172 in 2009[1] and is officially estimated at 109,200 in January 2019.[2] It is situated at the north-eastern end of the Fergana valley along the Kögart River valley, in the foothills of the Babash Ata mountains, very close to Uzbekistan border.

                Overview

                Jalal-Abad is known for its mineral springs in its surroundings, and the water from the nearby Azreti-Ayup-Paygambar spa was long believed to cure lepers. Several Soviet era sanatoriums offer mineral water treatment programs for people with various chronic diseases. Bottled mineral water from the region is sold around the country and abroad.

                History

                Jalal-Abad street scene

                One of Kyrgyzstan's main branches of the Silk Road passed through Jalalabat and the region has played host to travelers for thousands of years, although few archaeological remains are visible today – except in some of the more remote parts of the region – such as Saimalu Tash and the Chatkal valley. These have included travelers, traders, tourists and pilgrims (to the various holy sights) and sick people visiting the curative spas such as in the Ayub Tau mountain, at the altitude of 700 m above sea level some three kilometers out of town.

                There is a legend that the water from the Azreti-Ayup-Paygambar (the Prophet Job) spa cured lepers. According to the legend there was a grave, a mosque and the khan's palace near the spa.

                -abad is a Persian suffix often used in city names in Persianate societies to refer to the person who founded the community. It is said that Jalalabat was named after Jalal ad Din, who was renowned for setting up Caravanserais to serve travelers and many pilgrims who came to the holy mountain.


                Hotel in Jalal-Abad
                In early 19th century a small Kokand fortress was built, and a small kishlak grew up around this. The local people were engaged in agriculture and trade and provided services to the pilgrims visiting the spas. Then, in the 1870s, Russian settlers came to the region. They set up a garrison town and military hospital.

                Climate

                Jalal-Abad has a hot, dry-summer continental climate (Dsa) according to the Köppen climate classification. There is more rainfall in winter than in summer. The average annual temperature in Jalal-Abad is 12.3 °C (54.1 °F). About 416 mm (16.38 in) of precipitation falls annually.

                Economy

                The train line (a rarity in Kyrgyzstan), runs from the Ferghana Valley northeast about 30 km to Kökjanggak.

                Biggest Companies: Kyrgyz-Canada JV "Kyrgyz Petroleum Company", АО «Kelechek», АО «Nur». AOZT «KyrgyzChlopok», JV «Ak-Altyn» process cotton. There are the tobacco-curing companies «Tura-Ai» Ltd and «Aziz-Tabak» Ltd., that export 90% of their output to 17 countries. There are also mill houses АО «Azrat Ayib», AOZT PTK «Intershaq», «Mariam & Co» ltd, and the liquor manufacturer AOZT «Jalalabat Arak Zavodu».

                Tourism

                Jalalabad's Theater
                The Jalal-Abad Region is known for its walnuts and scenery.[citation needed] Local sites include the Arslanbob Waterfalls and Sary-Chelek Nature Reserve and Lake. In the city itself, sites include the town square and the culture park, which contains various sculptures and Jalalabad's theater.
                """
        
            
        case "Naryn":
          return  """
            Naryn (Kyrgyz: Нарын, Narın, نارىن, Mongolian : Нарийн, Nariin, Traditional Mongolian ᠨᠠᠷᠢᠨ is the regional administrative center of Naryn Region in central Kyrgyzstan. Its area is 84 square kilometres (32 sq mi), and its estimated population was 40,000 as of January 2019.[1] The town was established as a fortress on the caravan route in 1868.[2] It is situated on both banks of the Naryn River (one of the main head waters of the Syr Darya), which cuts a picturesque gorge through the town. The city has two regional museums and some hotels, but is otherwise residential.


            Overview

            From Naryn, the main road (one of the branches of the ancient Silk Road) runs south through the sparsely settled central Kyrgyz highlands to the Torugart Pass and China. At present, this is the main transport link from Kyrgyzstan to China. Naryn hosts one of three campuses of the University of Central Asia (UCA). The University was founded in 2000 by the governments of Kazakhstan, the Kyrgyz Republic and Tajikistan, and His Highness the Aga Khan. It is the world's first internationally chartered institution of higher education. The UCA currently operates a School of Professional and Continuing Education (SPCE), with a School of Undergraduate Studies and a Graduate School of Development in the process of being established. Undergraduate classes at the University of Central Asia’s (UCA) Naryn, Kyrgyz Republic campus commenced on 5 September 2016.


            Demographics

            Naryn is the tenth largest city by population in Kyrgyzstan. Its de facto population, according to the Population and Housing Census of 2009, was 34,226. The population of the district as a whole was 44,080 people according to the 2009 census. According to the National Statistical Committee the population of Naryn amounted to 40,000 as of January 2019.[1]

            Economics

            The economy of the Province is dominated by animal husbandry such as horse, sheep and yak, and wool and meat being the main products. Today, the district is the poorest region in the country. The mineral mines developed during the Soviet period were largely abandoned after the fall of communism as they were not profitable.

            """
            
            
        case "Talas":
            return """
                Talas is a town in northwestern Kyrgyzstan, located in the Talas River valley between two mountain ranges. Its area is 13 square kilometres (5.0 sq mi), and its resident population was 32,886 in 2009.[1] It is the administrative headquarters of Talas Region. The town was founded by East Slavic settlers in 1877.[2] To the south is the Besh-Tash (‘five rocks’) valley with the Besh-Tash National Park.

                Overview

                Its economy has traditionally been oriented towards the ancient city of Taraz (once named Talas and Dzhambul) in present day Kazakhstan. The Talas valley has suffered severely from the imposition of rigid border controls by Kazakhstan following the demise of the Soviet Union, as transport and trade links to the rest of Kyrgyzstan are now constrained by the mountains separating it from the Chuy Valley and Bishkek.[citation needed] Though much transportation does occur from Bishkek to Talas by transiting through Kazakhstan via the border crossings at Chaldovar in Chuy and then re-crossing into the Talas valley of Kyrgyzstan at Taraz. The only drivable road within the borders of Kyrgyzstan to Bishkek and the rest of the country crosses two mountain passes that rise to heights of more than 3000 meters above sea level over the Ötmök Pass into the Suusamyr Valley and then again the Töö Ashuu Pass before descending to the Chuy Valley and Bishkek

                Manas

                Manas, the mythical Kyrgyz national hero, is said to have been born in the Ala Too mountains in Talas oblast. A few kilometers outside Talas lies a mausoleum, supposedly that of Manas, called the Kümböz Manas. However, the inscription on its richly decorated facade dedicates it to "...the most glorious of women Kenizek-Khatun, the daughter of the Emir Abuka". Legend explains that Manas' wife Kanikey ordered a deliberately false inscription in order to mislead her husband's enemies and prevent the desecration of his body. The building, known as Manastin Khumbuzu or The Ghumbez of Manas, is thought to have been built in 1334. It now contains a museum dedicated to the epic. A ceremonial mound also lies nearby.


                """
        
        case "Batken":
            return """
                The name Batkent is from the Iranian language of Sogdian and means "The city of wind". Batken became the administrative headquarters of the youngest of Kyrgyzstan's seven regions, created from the three westernmost districts of Osh Region in 1999, after concerns over radical Islamist activities in neighboring Tajikistan and Uzbekistan led to demands for a more direct and visible governmental presence in this remote and mountainous region. Batken Airport links the town with Bishkek. Since 2000, there is a small university in Batken.
                """
            
        default:
            return ""
        
        }
    }
}

