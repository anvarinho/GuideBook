//
//  AboutVisa.swift
//  GuideBook
//
//  Created by Anvar Jumabaev on 19.06.21.
//

import SwiftUI

struct AboutVisa: View {
    var text = """
       Kyrgyzstan is the most non-bureaucratic country for tourists to visit. Here, the registration of foreign citizens arriving for up to 60, and in some cases up to 90 days, is completely canceled. Visa regimes with 62 countries in Europe, Asia and America have also been abolished. The full list of countries with the current visa-free regime can be found here.
       Residents of the EAEU countries (Russia, Kazakhstan, Belarus and Armenia) can visit Kyrgyzstan with an internal passport.
       Getting to Kyrgyzstan is also quite easy, despite the apparent remoteness of the country. Daily direct flights to Bishkek are operated from almost all airports in major Russian cities (Moscow, St. Petersburg, Yekaterinburg, Novosibirsk, Irkutsk), as well as from airports in Istanbul (the most popular option for European residents), Dubai and Beijing. The average ticket price rarely exceeds 20 thousand soms ($300), on average, the ticket will cost you 10-12 thousand soms ($100-150)
       In addition to air travel, you can get to Kyrgyzstan by train. Long-distance trains come to Bishkek from many Russian cities, including Moscow. Of course, you can also enter Kyrgyzstan by car, through the Kazakh, Uzbek, Tajik and Chinese borders.
        
    """
    var text2 = """
    Visa-free regime

    In Kyrgyzstan there is a visa-free regime for citizens of 62 countries.

    From visa requirements for entry/departure in the territory of the Kyrgyz Republic are released citizens of the following States:

    1. Russian Federation
    2. Kazakhstan
    3. Belarus
    4. Tajikistan
    5. Azerbaijan
    6. Armenia
    7. Georgia
    8. Moldova
    9. Vietnam
    10. Democratic People's Republic Of Korea
    11. Cuba
    12. Laos

    From visa requirements for up to 90 days to enter/exit stay in the Kyrgyz Republic are released citizens of the following States:

    1. Mongolia
    2. Ukraine

    From visa requirements for up to 60 days to enter/exit stay in the Kyrgyz Republic are released citizens of the following States:

    1. Australia
    2. Austria
    3. Belgium
    4. Bosnia and Herzegovina
    5. Vatican
    6. Great Britain
    7. Hungary
    8. Germany
    9. Netherlands
    10. Greece
    11. Denmark
    12. Iceland
    13. Ireland
    14. Spain
    15. Italia
    16. Canada
    17. Korea
    18. Kuwait
    19. Latvia
    20. Lithuania
    21. Liechtenstein
    22. Luxembourg
    23. Malta
    24. Monaco
    25. New Zealand
    26. Norway
    27. United Arab Emirates
    28. Poland
    29. Portugal
    30. Kingdom Of Saudi Arabia
    31. Singapore
    32. Slovak Republic
    33. Slovenia
    34. USA
    35. Finland
    36. France
    37. Croatia
    38. Czech Republic
    39. Switzerland
    40. Sweden
    41. Estonia
    42. Qatar
    43. Brunei-Darussalam State
    44. Bahrain
    45. Japan
    46. Turkey
    47. Uzbekistan

    From visa requirements for up to 60 days to enter/exit stay in the Kyrgyz Republic are released citizens of the following States:

    1. Malaysia

    Source: Ministry Of Foreign Affairs Of The Kyrgyz Republic
    """
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                ScrollView(.vertical,showsIndicators: false) {
                    VStack {
                        Text("About Visa")
                            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                            .padding()
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .shadow(color: .black, radius: 3, x: 3, y: 3)
                        Text(text)
                            .padding(.horizontal)
                            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                        Link(destination: URL(string: "https://kg.usembassy.gov/covid-19-information/")!, label: {
                            Text("Some data may vary due to coronavirus, go to check").underline()
                                .padding(.horizontal)
                                .foregroundColor(.purple)
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .multilineTextAlignment(.leading)
                                .shadow(color: .black, radius: 2, x: 2, y: 2)
                        })
                        Text(text2)
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 0.9803921569, green: 0.5725490196, blue: 0.1215686275, alpha: 1)))
                            .font(.system(size: 15, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .shadow(color: .black, radius: 2, x: 2, y: 2)
                    }
                }
            }
            DismissButton()
        }
    }
}
